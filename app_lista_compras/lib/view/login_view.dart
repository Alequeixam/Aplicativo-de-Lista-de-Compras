// ignore_for_file: prefer_const_constructors

import 'package:app_lista_compras/view/recuperacao_view.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginViewState();
}

class _LoginViewState extends State<Login> {
  //Identificador do formulário
  final _formKey = GlobalKey<FormState>();

  //Controladores dos campos de texto
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool isVisivel = false;

  recuperarSenha(){
    showDialog(context: context, builder: (context) {
      return Recuperacao();
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Login"),
          backgroundColor: Colors.deepPurple[200],
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    SizedBox(height: 50),
                    Icon(
                      Icons.lock,
                      size: 90,
                    ),

                    SizedBox(height: 18),
                    Text(
                      "Bem vindo de volta!",
                      style: TextStyle(fontSize: 18, color: Colors.grey[550]),
                    ),

                    SizedBox(height: 40),

                    // Email
                    //
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
                          icon: Icon(Icons.person),
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
                    const SizedBox(height: 10),

                    // Senha
                    //
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.deepPurple[50],
                      ),
                      child: TextFormField(
                        obscureText: !isVisivel,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: 'senha',
                          // define como visivel ou nao o campo da senha
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisivel = !isVisivel;
                                });
                              },
                              icon: Icon(!isVisivel
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        ),
                        validator: (senha) {
                          if (senha == null || senha.isEmpty) {
                            return 'Por favor, insira uma senha';
                          } else if (senha.length < 6) {
                            return 'A senha deve conter no mínimo 6 dígitos!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: recuperarSenha,
                          child: Text('Esqueceu a senha?'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, 'listas_view');
                        }
                      },
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Ainda não possui cadastro?"),
                            TextButton(
                                  onPressed: () {},
                                  child: Text('Cadastre-se aqui.'),
                                ),
                          ],
                        ),
                      ),
                    ),
                   // SizedBox(height: 50),

                    
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
