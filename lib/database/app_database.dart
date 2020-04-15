import 'package:bytebank2/database/contato/dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String _nomeBD = 'bytebank.db';

Future<Database> pegarDB() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, _nomeBD);
  return openDatabase(path, onCreate: (db, version) {
    String sql = ContatoDAO.criarTabela;
    db.execute(sql);
    }, version: 1,
//    onDowngrade: onDatabaseDowngradeDelete
  );
}

