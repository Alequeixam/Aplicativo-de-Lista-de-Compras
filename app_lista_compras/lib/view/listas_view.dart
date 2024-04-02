// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../model/lista.dart';
import 'criar_lista_view.dart';

class ListasView extends StatefulWidget {
  const ListasView({super.key});

  @override
  State<ListasView> createState() => _ListasViewState();
}

class _ListasViewState extends State<ListasView> {
  criarLista() {
    showDialog(
      context: context,
      builder: (context) {
        return CriarLista();
      },
    );
  }

  List<Lista> listasTeste = Lista.listaTeste();
  List<Lista> listas = [];

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
                    listas.isEmpty
                        ? Text("Você ainda não criou nenhuma lista de compras")
                        : Expanded(
                            child: ListView.builder(
                              itemCount: listasTeste.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    onTap: () {},
                                    title: Text(
                                      listasTeste[index].nome.toString(),
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
        onPressed: (){},
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
}
