import 'package:flutter/material.dart';
import '../service/transacao.dart'; 

class FormularioPage extends StatelessWidget {
  final TextEditingController textoController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();
  final Transacao? transacao; 

  FormularioPage({Key? key, this.transacao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (transacao != null) {
      textoController.text = transacao!.texto;
      numeroController.text = transacao!.numero.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(transacao == null ? 'Adicionar Transação' : 'Editar Transação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textoController,
              decoration: InputDecoration(labelText: 'Texto'),
            ),
            TextField(
              controller: numeroController,
              decoration: InputDecoration(labelText: 'Número'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final texto = textoController.text;
                final numero = int.tryParse(numeroController.text) ?? 0;

                final novaTransacao = Transacao(texto: texto, numero: numero);
                Navigator.pop(context, novaTransacao); 
              },
              child: Text(transacao == null ? 'Adicionar' : 'Atualizar'),
            ),
          ],
        ),
      ),
    );
  }
}
