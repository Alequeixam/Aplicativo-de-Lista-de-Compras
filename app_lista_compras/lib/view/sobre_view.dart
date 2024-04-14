// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sobre este aplicativo"),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: const [
              Text("Lista de Compras",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 40),
              Text(
                "O aplicativo de Lista de Compras é projetado para te ajudar a criar e gerenciar listas de compras de forma eficiente. Ele permite que você adicione itens à uma lista, edite um item, marque itens como comprados e remova itens conforme necessário.",
                textAlign: TextAlign.justify,
              ),
              Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  children: [
                    Text("Dev: Alex Henrique Santana"),
                    Icon(Icons.)
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
