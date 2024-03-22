import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<Login> {
  //Identificador do formulário
  var formKey = GlobalKey<FormState>();

  //Controladores dos campos de texto
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();

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
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('E-mail'),
                      hintText: 'nome@email.com',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Senha'),
                      hintText: 'Digite sua senha',
                    ),
                  ),
                  SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Entrar"),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
