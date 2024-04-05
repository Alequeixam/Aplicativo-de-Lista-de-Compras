// ignore_for_filfer_const_constructors, prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

import 'package:app_lista_compras/model/item.dart';
import 'package:flutter/material.dart';
import '../model/lista.dart';

class Itens extends StatefulWidget {
  const Itens({super.key, required this.lista});
  final Lista lista;

  @override
  State<Itens> createState() => _ItensState();
}

class _ItensState extends State<Itens> {
  //Identificador do formulário
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeItem = TextEditingController();
  final TextEditingController _qtdItem = TextEditingController();

  List<Item> itensTeste = Item.listaTeste();
  final List<Item> _itens = List.empty(growable: true);
  int updateIndex = -1;

  /* @override
  void initState() {
    _itens.add(Item.listaTeste());
    super.initState();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEF0F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFEEF0F5),
        centerTitle: true,
        title: Text(widget.lista.nome),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Column(
                  children: [
                    barraDeBusca(),
                    SizedBox(height: 20),
                    _itens.isEmpty
                        ? Text(
                            "Você ainda não adicionou nenhum item na sua lista '${widget.lista.nome}'")
                        : Expanded(
                            child: ListView.builder(
                              itemCount: _itens.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    leading: IconButton(
                                      icon: Icon(_itens[index].isDone
                                          ? Icons.check_box
                                          : Icons.check_box_outline_blank),
                                      onPressed: () {
                                        setState(() {
                                          _itens[index].isDone = !_itens[index].isDone;
                                        });
                                      },
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(
                                          Icons.delete_sharp),
                                      onPressed: () {
                                        setState(() {
                                          _itens.removeAt(index);
                                        });
                                      },
                                    ),

                                    onTap: (){
                                      _nomeItem.text = _itens[index].nome!;
                                      _qtdItem.text = _itens[index].qtde!;
                                      setState(() {
                                        updateIndex = index;
                                      });
                                      editarItem();
                                    },
                                    title: Text(
                                      _itens[index].nome!,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                      ),
                                    ),
                                    subtitle: Text(
                                      _itens[index].qtde!,
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: criarItem,
        child: Icon(Icons.add),
      ),
      
    );
  }

  salvarItem() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _itens.add(Item(nome: _nomeItem.text, qtde: _qtdItem.text));
        widget.lista.itens?.add(_itens.last);
        _nomeItem.clear();
        _qtdItem.clear();
      });
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Item adicionado com sucesso"),
        ),
      );
    }
  }

  attItem() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _itens[updateIndex].nome = _nomeItem.text;
        _itens[updateIndex].qtde = _qtdItem.text;
        _nomeItem.clear();
        _qtdItem.clear();
      });
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Item atualizado com sucesso"),
        ),
      );
    }
  }

  criarItem() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: Text(
            "Adicionar Item",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          content: Container(
            height: 320,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.fromLTRB(2, 0, 0, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.deepPurple[50],
                    ),
                    child: TextFormField(
                      controller: _nomeItem,
                      decoration: InputDecoration(
                        labelText: 'Digite o nome do item',
                        icon: Icon(Icons.abc),
                        border: InputBorder.none,
                      ),
                      validator: (nome) {
                        if (nome == null || nome.isEmpty) {
                          return 'Por favor, digite o nome do item';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.fromLTRB(2, 0, 0, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.deepPurple[50],
                    ),
                    child: TextFormField(
                      controller: _qtdItem,
                      decoration: InputDecoration(
                        labelText: 'Digite a quantidade do item',
                        hintText:
                            'Você pode digitar também a unidade de medida',
                        icon: Icon(Icons.pin),
                        border: InputBorder.none,
                      ),
                      validator: (qtd) {
                        if (qtd == null || qtd.isEmpty) {
                          return 'Por favor, digite a quantidade do item';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: salvarItem,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(110, 40),
                      backgroundColor: Colors.purple[400],
                    ),
                    child: Text(
                      "Criar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancelar",
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  editarItem() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: Text(
            "Atualizar Item",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          content: Container(
            height: 320,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.fromLTRB(2, 0, 0, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.deepPurple[50],
                    ),
                    child: TextFormField(
                      controller: _nomeItem,
                      decoration: InputDecoration(
                        labelText: 'Digite o nome do item',
                        icon: Icon(Icons.abc),
                        border: InputBorder.none,
                      ),
                      validator: (nome) {
                        if (nome == null || nome.isEmpty) {
                          return 'Por favor, digite o nome do item';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.fromLTRB(2, 0, 0, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.deepPurple[50],
                    ),
                    child: TextFormField(
                      controller: _qtdItem,
                      decoration: InputDecoration(
                        labelText: 'Digite a quantidade do item',
                        hintText:'Unidade de medida',
                        icon: Icon(Icons.pin),
                        border: InputBorder.none,
                      ),
                      validator: (qtd) {
                        if (qtd == null || qtd.isEmpty) {
                          return 'Por favor, digite a quantidade do item';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: attItem,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(110, 40),
                      backgroundColor: Colors.purple[400],
                    ),
                    child: Text(
                      "Atualizar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancelar",
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget barraDeBusca() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          size: 20,
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20,
          minWidth: 20,
        ),
        border: InputBorder.none,
        hintText: 'Buscar',
      ),
    ),
  );
}
