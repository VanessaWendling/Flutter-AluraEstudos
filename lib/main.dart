import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          body: FormularioTransferencia(),
        )
    );
  }

}



class FormularioTransferencia extends StatelessWidget{

  //criou o controlador privado e instanciou
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criando Transferência'),),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: const TextStyle(
                fontSize: 20.0,
              ),
              decoration: const InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: const TextStyle(
                fontSize: 20.0,
              ),
              decoration: const InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
              child: const Text('Confirmar'),
            onPressed: (){
              final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
              final double?  valor = double.tryParse(_controladorCampoValor.text);
              debugPrint('oi');
              if(numeroConta != null && valor != null){
                final transferenciaCriada = Transferencia(valor, numeroConta);
                debugPrint('$transferenciaCriada');
              }

              },

    )
        ],
      ),
    );
  }
}

/*
StatefulWidget - capacidade de modificar o widget de maneira dinâmica.
StatelessElement - não muda dinamicamente.
 */

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Transferências'),),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 1000)),
          ItemTransferencia(Transferencia(200.0, 1001)),
          ItemTransferencia(Transferencia(300.0, 2200)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: const Icon(Icons.add),
      ),
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
        leading: const Icon(Icons.monetization_on),
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

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

