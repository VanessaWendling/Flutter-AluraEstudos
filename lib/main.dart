import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home:Scaffold(
          appBar: AppBar(title: Text('Transferências'),),
          floatingActionButton: FloatingActionButton(
            onPressed: () {  },
            child: Icon(Icons.add),
          ),
          body: ListaTransferencia(),
        )
      )
    );

/*
StatefulWidget - capacidade de modificar o widget de maneira dinâmica.
StatelessElement - não muda dinamicamente.
 */

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ItemTransferencia(Transferencia(100.0, 1000)),
        ItemTransferencia(Transferencia(200.0, 1001)),
        ItemTransferencia(Transferencia(300.0, 2200)),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget{

  //o _ indica que o atributo é privado
  final Transferencia _transferencia;


  ItemTransferencia(this._transferencia);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia{
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}