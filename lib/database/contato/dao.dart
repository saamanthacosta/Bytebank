import 'package:bytebank2/models/contato.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class ContatoDAO {

  static const String criarTabela = 'CREATE TABLE $_nomeTabela('
      '$_contatoId INTEGER PRIMARY KEY, '
      '$_contatoNome TEXT, '
      '$_contatoConta INTEGER)';

  static const String _nomeTabela = 'contatos';
  static const _contatoId = 'id';
  static const _contatoNome = 'nome';
  static const _contatoConta = 'numero_conta';

  Future<int> salvar(Contato contato) async {
    final Database db = await pegarDB();
    Map<String, dynamic> contatoMap = _toMap(contato);
    return db.insert(_nomeTabela, contatoMap);
  }

  Future<List<Contato>> listar() async {
    final Database db = await pegarDB();
    final List<Map<String, dynamic>> roles = await db.query(_nomeTabela);
    return _toList(roles);
  }

  Map<String, dynamic> _toMap(Contato contato) {
    final Map<String, dynamic> contatoMap = Map();
    contatoMap[_contatoNome] = contato.nome;
    contatoMap[_contatoConta] = contato.numConta;
    return contatoMap;
  }

  List<Contato> _toList(List<Map<String, dynamic>> roles) {
    final List<Contato> contatos = List();
    for (Map<String, dynamic> role in roles) {
      final Contato contato = Contato(
          role[_contatoId],
          role[_contatoNome],
          role[_contatoConta]
      );
      contatos.add(contato);
    }
    return contatos;
  }

}