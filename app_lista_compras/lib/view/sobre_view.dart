// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Sobre extends StatelessWidget {
  Sobre({super.key});

  final String _urlGitHub = "https://github.com/Alequeixam/";

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
            children: [
              Text("Lista de Compras",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 40),
              Text(
                "O aplicativo de Lista de Compras é projetado para te ajudar a criar e gerenciar listas de compras de forma eficiente. Ele permite que você adicione itens à uma lista, edite um item, marque itens como comprados e remova itens conforme necessário.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17),
              ),
              Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Devs:"),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Alex Henrique Santana"),
                        SizedBox(width: 5),
                        InkWell(
                          onTap: () => launchUrlString(_urlGitHub),
                          
                          child: FaIcon(FontAwesomeIcons.github),
                          
                        ),
                      ],
                    ),
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
