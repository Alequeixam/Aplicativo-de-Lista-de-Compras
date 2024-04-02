import '/model/item.dart';

class Lista {
  String nome;
  late List<Item> itens;

  Lista({required this.nome, required this.itens});

  static List<Lista> listaTeste() {
    return [
      Lista(nome: "Churrasco", itens: []),
      Lista(nome: "Churrasco", itens: []),
      Lista(nome: "Churrasco", itens: []),
    ];
  }
}