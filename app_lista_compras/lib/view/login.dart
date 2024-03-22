import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<Login> {
  //Identificador do formulário
  final _formKey = GlobalKey<FormState>();

  //Controladores dos campos de texto
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          backgroundColor: Colors.deepPurple[200],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('E-mail'),
                      hintText: 'nome@email.com',
                    ),
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Por favor, insira um e-mail';
                      } else if(!EmailValidator.validate(email)) {
                        return 'Digite um endereço de e-mail válido!';
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Senha'),
                      hintText: 'Digite sua senha',
                    ),
                    validator: (senha) {
                      if (senha == null || senha.isEmpty) {
                        return 'Por favor, insira uma senha';
                      } else if (senha.length < 6) {
                        return 'A senha deve conter no mínimo 6 dígitos!';
                      }
                    },
                  ),
                  
                  SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {

                      }
                    },
                    child: Text("Entrar"),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}