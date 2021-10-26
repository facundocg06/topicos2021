import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'modelos/usuario.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DbHelper {
  static Database _db;

  static const String DB_Name = 'prueba1.db';
  static const String Table_User = 'user';
  static const int Version = 1;
  static const String UserID = 'user_id';
  static const String Nombre = 'nombre';
  static const String Telefono = 'telefono';
  static const String Direccion = 'direccion';
  static const String Genero = 'genero';
  static const String Email = 'email';
  static const String Password = 'password';
  static const String Password2 = 'password2';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_User  ("
        " $UserID TEXT, "
        " $Nombre TEXT, "
        " $Telefono TEXT,"
        " $Direccion TEXT, "
        " $Genero TEXT, "
        " $Email TEXT, "
        " $Password TEXT,"
        " $Password2 TEXT, "
        " PRIMARY KEY ($UserID)"
        ")");
  }

  Future<int> saveData(Usuario user) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_User, user.toMap());
    return res;
  }

  Future<Usuario> getLoginUser(String userId, String password) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $Table_User  WHERE "
        "$Email = '$userId' AND "
        "$Password = '$password'");

    if (res.length > 0) {
      return Usuario.fromMap(res.first);
    }

    return null;
  }

  Future<int> updateUser(Usuario user) async {
    var dbClient = await db;
    var res = await dbClient.update(Table_User, user.toMap(),
        where: '$UserID = ?', whereArgs: [user.user_id]);
    return res;
  }

  // Future<int> deleteUser(String user_id) async {
  //   var dbClient = await db;
  //   var res = await dbClient
  //       .delete(Usuarios where: '$UserID = ?', whereArgs: [user_id]);
  //   return res;
  // }

  alertDialog(BuildContext context, String msg) {
    Toast.show(msg, context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  }

  validateEmail(String email) {
    final emailReg = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return emailReg.hasMatch(email);
  }
}
