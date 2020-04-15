import 'package:bytebank2/database/contato/dao.dart';
import 'package:bytebank2/models/contato.dart';
import 'package:flutter/material.dart';

class FormularioContatos extends StatefulWidget {
  @override
  _FormularioContatosState createState() => _FormularioContatosState();
}

class _FormularioContatosState extends State<FormularioContatos> {
  final TextEditingController _nomeController = TextEditingController();

  final TextEditingController _numContaController = TextEditingController();

  final ContatoDAO _dao = ContatoDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome completo'),
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _numContaController,
                decoration: InputDecoration(labelText: 'Número da conta'),
                style: TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  onPressed: () {
                    final String nome = _nomeController.text;
                    final int numConta = int.tryParse(_numContaController.text);
                    try {
                      final Contato contato = Contato(0, nome, numConta);
                      _dao.salvar(contato).then((id) => Navigator.pop(context));
                    }
                    catch(error) {
                      debugPrint(error.toString());
                    }
                  },
                  child: Text('Criar'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
