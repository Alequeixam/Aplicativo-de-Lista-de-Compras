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
  final _formKey = GlobalKey<FormState>();

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
    if (_formKey.currentState!.validate()) {
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
  }

  criarLista() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: Text(
            "Adicionar lista",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          content: Container(
            height: 220,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.fromLTRB(2, 0, 0, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.deepPurple[50],
                    ),
                    child: TextFormField(
                      controller: _nomeLista,
                      decoration: InputDecoration(
                        labelText: 'Digite o nome da lista',
                        icon: Icon(Icons.list),
                        border: InputBorder.none,
                      ),
                      validator: (lista) {
                        if (lista == null || lista.isEmpty) {
                          return 'Por favor, digite o nome da lista';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: salvarNome,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(110, 40),
                      backgroundColor: Colors.purple[400],
                    ),
                    child: Text(
                      "Criar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancelar",
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        /* /* CriarLista(
          controller: _nomeLista,
          onEnviar: salvarNome,
          //formKey: _formKey, */
        ); */
      },
    );
  }
}
