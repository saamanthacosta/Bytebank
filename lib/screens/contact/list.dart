import 'package:bytebank2/screens/contact/form.dart';
import 'package:flutter/material.dart';

class ListarContatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                  'Alex',
                style: TextStyle(
                  fontSize: 16.0
                ),
              ),
              subtitle: Text(
                  '1000',
                style: TextStyle(
                    fontSize: 16.0
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FormularioContatos(),
              )
          ).then(
                  (novoContato) => debugPrint(novoContato.toString())
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

}