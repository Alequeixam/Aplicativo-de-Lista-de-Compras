import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
      ),
    );
  }
}
