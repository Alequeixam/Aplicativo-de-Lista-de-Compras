class Item {
  late final String? nome;
   late final String? qtde;
  bool isDone;


  Item({ this.nome, this.qtde, this.isDone = false});

  static List<Item> listaTeste(){
    return [
      Item(nome: "Pao de aio", qtde:  "10"),
      Item(nome: "Picanha", qtde: "3kg"),
      Item(nome: "Linguiça", qtde: "5kg"),
      Item(nome: "Cerveja X", qtde: "10 far"),

    ];
  }
}