// ignore_for_file: prefer_const_constructors

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class Recuperacao extends StatefulWidget {
  const Recuperacao({super.key});

  @override
  State<Recuperacao> createState() => _RecuperacaoState();
}

class _RecuperacaoState extends State<Recuperacao> {
  
  //Identificador do formulário
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      title: Text(
        "Recuperar a senha",
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      content: Container(
        height: 350,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.deepPurple[50],
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    //labelText: 'Digite seu e-mail',
                    icon: Icon(Icons.email),
                    border: InputBorder.none,
                    hintText: 'nome@email.com',
                  ),
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Por favor, insira um e-mail';
                    } else if (!EmailValidator.validate(email)) {
                      return 'Digite um endereço de e-mail válido!';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 12,),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                }, 
                  child: Text(
                    "Enviar",

                  ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
