import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class MyyDatabase {
  Future<Database> initDatabase() async {
    return await openDatabase(
      "${getApplicationDocumentsDirectory()}/BanioDB.db",
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE UserNuTable (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name VARCHAR(20) );
          ''');
        print(";;;;;;;;;;table cer");
      },
      version: 1,
      onUpgrade: (db, oldVersion, newVersion) {},
    );
  }

  //init vadu puru

  //AAA Function jova mate no 6e badho user no data  ----------------------      (GET ALL)
  Future<List<Map<dynamic, dynamic>>> getAllUserFun() async {
    Database bijoDbBanio = await initDatabase();

    List<Map<dynamic, dynamic>> UserNiListBani =
        await bijoDbBanio.query("UserNuTable");

    return UserNiListBani;
  }

  //AAA Function user no data add kar va mate nu 6e   ---------------    (INSERT)
  Future<void> addUserThayoFun(Map<String, dynamic> mapaavio) async {
    Database bijoDbBanio = await initDatabase();
    await bijoDbBanio.insert("UserNuTable", mapaavio);
    log("User ADDED ....");
  }

  //AAA Function user no data add kar va mate nu 6e   ---------------    (EDIT)
  Future<void> editUserThayoFun(Map<String, dynamic> mapaavio, int id) async {
    Database bijoDbBanio = await initDatabase();
    await bijoDbBanio
        .update("UserNuTable", mapaavio, where: "Id = ?", whereArgs: [id]);
    log("User ADDED ....");
  }

  // delete user
  Future<void> deleteUser(int id) async {
    Database bijoDbBanio = await initDatabase();

    await bijoDbBanio.delete("UserNuTable", where: "Id = ?", whereArgs: [id]);
  }
}
