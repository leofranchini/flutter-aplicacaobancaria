import 'package:flutter/material.dart';
import 'screen/formulario.dart'; 
import 'screen/lista.dart'; 
import 'service/transacao.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), 
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Transacao> transacoes = [];

  void _addTransacao(Transacao transacao) {
    setState(() {
      transacoes.add(transacao);
    });
  }

  void _deleteTransacao(int index) {
    setState(() {
      transacoes.removeAt(index);
    });
  }

  void _updateTransacao(int index, Transacao transacao) {
    setState(() {
      transacoes[index] = transacao;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListaPage(
      transacoes: transacoes,
      onAddTransacao: _addTransacao,
      onDeleteTransacao: _deleteTransacao,
      onUpdateTransacao: _updateTransacao,
    );
  }
}
