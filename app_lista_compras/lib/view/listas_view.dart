// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_lista_compras/view/criar_lista_view.dart';
import 'package:flutter/material.dart';
import '../model/lista.dart';

class ListasView extends StatefulWidget {
  const ListasView({super.key});

  //final List<Lista>? listas;

  @override
  State<ListasView> createState() => _ListasViewState();
}

class _ListasViewState extends State<ListasView> {
  //Identificador do formulário
  //final _formKey = GlobalKey<State<CriarLista>>();

  final TextEditingController _nomeLista = TextEditingController();

  List<Lista> listasTeste = Lista.listaTeste();
  final List<Lista> _listas = List.empty(growable: true);

  /*@override
  void initState() {
    _listas.add(Lista(nome: "AAAA", itens: List.empty()));
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEF0F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFEEF0F5),
        centerTitle: true,
        title: Text('Listas de Compras'),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Column(
                  children: [
                    barraDeBusca(),
                    SizedBox(height: 20),
                    _listas.isEmpty
                        ? Text("Você ainda não criou nenhuma lista de compras")
                        : Expanded(
                            child: ListView.builder(
                              itemCount: _listas.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    onTap: () {},
                                    title: Text(
                                      _listas[index].nome,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: criarLista,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget barraDeBusca() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 20,
          ),
          border: InputBorder.none,
          hintText: 'Buscar',
        ),
      ),
    );
  }

  salvarNome() {
      setState(() {
        _listas.add(Lista(nome: _nomeLista.text, itens: []));
        _nomeLista.clear();
      });

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Lista criada com sucesso"),
        ),
      );
      
  }

  criarLista() {
    showDialog(
      context: context,
      builder: (context) {
        return CriarLista(
          controller: _nomeLista,
          onEnviar: salvarNome,
          //formKey: _formKey,
        );
      },
    );
  }
}
