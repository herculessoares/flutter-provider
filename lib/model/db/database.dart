import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Banco {
  static final Banco instance = Banco._();
  static Database? _database;
  // Construtor privado

  Banco._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'meu_banco.db');
    return await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE user(
    username TEXT PRIMARY KEY, 
    password TEXT
    )
    
  ''');

    await db.execute('''CREATE TABLE form_provider_test (
    fullName TEXT,
    dateOfBirth TEXT,
    gender TEXT,
    emailAddress TEXT,
    phoneNumber TEXT,
    nationality TEXT,
    occupation TEXT,
    username TEXT,
    password TEXT,
    streetAddress TEXT,
    city TEXT,
    stateProvince TEXT,
    zipCode TEXT,
    country TEXT,
    creditCardNumber TEXT,
    expirationDate TEXT,
    cvv TEXT,
    billingAddress TEXT,
    paymentMethod TEXT
)''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute("ALTER TABLE user ADD COLUMN last_login TEXT");
    }
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
