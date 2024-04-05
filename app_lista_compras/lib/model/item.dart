class Item {
  final String? nome;
  final String? qtde;
  bool isDone;


  Item({required this.nome, required this.qtde, this.isDone = false});

  static List<Item> listaTeste(){
    return [
      Item(nome: "Pao de aio", qtde:  "10"),
      Item(nome: "Picanha", qtde: "3kg"),
      Item(nome: "Linguiça", qtde: "5kg"),
      Item(nome: "Cerveja X", qtde: "10 far"),

    ];
  }
}