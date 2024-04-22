import 'package:provider_project/model/db/database.dart';

class User {
  String username;
  String password;
  String? lastLogin;

  User(this.username, this.password, this.lastLogin);
  User.verify(this.username, this.password);

  static Future<User?> verifyUser(User user) async {
    final db = await Banco.instance.database;
    String query =
        "SELECT * FROM form_provider_test WHERE username = '${user.username}' AND password = '${user.password}'";
    List<Map<String, Object?>> lista = await db.rawQuery(query);
    if (lista.isNotEmpty) {
      Map<String, Object?> utemp = lista.first;
      User user = User.verify(
          utemp['username'].toString(), utemp['password'].toString());
      return user;
    }
    return null;
  }
}
