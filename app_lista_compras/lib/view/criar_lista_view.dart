// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:ffi';

import 'package:app_lista_compras/model/lista.dart';
import 'package:app_lista_compras/view/listas_view.dart';
import 'package:flutter/material.dart';

class CriarLista extends StatefulWidget {
  final controller;
  //final formKey;
  final VoidCallback onEnviar;
  const CriarLista({
    super.key,
    required this.controller,
    required this.onEnviar,
    //required this.formKey,
  });

  @override
  State<CriarLista> createState() => _CriarListaState();
}

class _CriarListaState extends State<CriarLista> {
  //Identificador do formulário
  final _formKey = GlobalKey<FormState>();

  FormState? getFormState() {
    return _formKey.currentState;
  }

  //final TextEditingController _nomeLista = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  controller: widget.controller,
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
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: widget.onEnviar,
                child: Text(
                  "Criar",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
