import 'package:flutter/material.dart';
import '../service/transacao.dart'; 
import 'formulario.dart'; 

class ListaPage extends StatelessWidget {
  final List<Transacao> transacoes; 
  final Function(Transacao) onAddTransacao; 
  final Function(int) onDeleteTransacao; 
  final Function(int, Transacao) onUpdateTransacao; 

  ListaPage({
    Key? key,
    required this.transacoes,
    required this.onAddTransacao,
    required this.onDeleteTransacao,
    required this.onUpdateTransacao,
  }) : super(key: key); 

  void _navigateToFormulario(BuildContext context, {Transacao? transacao}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormularioPage(transacao: transacao),
      ),
    );

    if (result != null) {
      if (transacao == null) {
        onAddTransacao(result); 
      } else {
        onUpdateTransacao(transacoes.indexOf(transacao), result); 
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: ListView.builder(
        itemCount: transacoes.length,
        itemBuilder: (context, index) {
          final transacao = transacoes[index];
          return ListTile(
            title: Text(transacao.texto),
            subtitle: Text(transacao.numero.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _navigateToFormulario(context, transacao: transacao),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    onDeleteTransacao(index); 
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToFormulario(context), 
        child: Icon(Icons.add), 
        tooltip: 'Adicionar Transação', 
      ),
    );
  }
}
