// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:app_lista_compras/view/cadastro_view.dart';
import 'package:app_lista_compras/view/recuperacao_view.dart';
import 'package:app_lista_compras/view/sobre_view.dart';

import '/view/listas_view.dart';
import 'view/login_view.dart';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Compras de Mercado',
      initialRoute: 'login_view',
      routes: {
        'login_view': (context) => Login(),
        'listas_view': (context) => ListasView(),
        'recuperacao_view': (context) => Recuperacao(),
        'cadastro_view' :(context) => Cadastro(),
        'sobre_view' : (context) => Sobre(),
      },
    );
  }
}

