import 'package:flutter/material.dart';

class Recuperacao extends StatefulWidget {
  const Recuperacao({super.key});

  @override
  State<Recuperacao> createState() => _RecuperacaoState();
}

class _RecuperacaoState extends State<Recuperacao> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recuperar Senha"),
        backgroundColor: Colors.deepPurple[200],
      ),
    );
  }
}
