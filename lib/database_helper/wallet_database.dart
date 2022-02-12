import 'package:assist_queen/model_class/wallet.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class WalletDatabase {
  static final WalletDatabase instance = WalletDatabase._init();
  static Database? _database;

  WalletDatabase._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('wallets.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY';
    const textType = 'TEXT';
    const integerType = 'INTEGER';

    await db.execute('''
CREATE TABLE $tableWallet ( 
  ${WalletFields.id} $idType, 
 
  ${WalletFields.number} $integerType,
  ${WalletFields.title} $textType,
  ${WalletFields.description} $textType,
  ${WalletFields.time} $textType
  )
''');
  }

  Future<Wallet> create(Wallet wallet) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableWallet, wallet.toJson());
    return wallet.copy(id: id);
  }

  Future<Wallet> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableWallet,
      columns: WalletFields.values,
      where: '${WalletFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Wallet.fromJson(maps
          .first); //return the first eement , throws a[stateError] if 'this' is empty
    } else {
      throw Exception('ID $id not found');
    }
  }

// Fetch operation: get all note objects from database
  Future<List<Wallet>> readAllWallets() async {
    final db = await instance.database;

    const orderBy = '${WalletFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableWallet, orderBy: orderBy);

    return result.map((json) => Wallet.fromJson(json)).toList();
  }

  Future<int> update(Wallet wallet) async {
    final db = await instance.database;

    return db.update(
      tableWallet,
      wallet.toJson(),
      where: '${WalletFields.id} = ?',
      whereArgs: [wallet.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableWallet,
      where: '${WalletFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    _database = null;

    return db.close();
  }
}
