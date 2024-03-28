// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ListasView extends StatefulWidget {
  const ListasView({super.key});

  @override
  State<ListasView> createState() => _ListasViewState();
}

class _ListasViewState extends State<ListasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas de Compras'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('abrir'),
            ],
          ),
        ),
      ),
    );
  }
}
