import 'dart:io' as io;

import 'package:flutter/services.dart';
import 'package:need_doctors/models/DrugDBModel.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  Database _db;

  Future<void> init() async {
    print("DB Init Start");

    io.Directory applicationDirectory =
    await getApplicationDocumentsDirectory();

    String dbPath = path.join(applicationDirectory.path, "11.db");

    bool dbExists = await io.File(dbPath).exists();

    if (!dbExists) {
      // Copy from asset
      ByteData data = await rootBundle.load(path.join("asset/images", "11.db"));

      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await io.File(dbPath).writeAsBytes(bytes, flush: true);
    }

    this._db = await openDatabase(dbPath);
    print("DB Init Done");
  }

  /// get all the words from english dictionary
  Future<List<DrugDbModel>> getMedicineDataWithSearch(String searchText,
      String limit, String offset) async {
    if (_db == null) {
      throw "bd is not initiated, initiate using [init(db)] function";
    }
    List<Map<String, dynamic>> medicines;
    await _db.transaction((txn) async {
      medicines = await txn.rawQuery(
          "SELECT * FROM 't_drug_brand' JOIN 't_company_name' ON t_drug_brand.company_id == t_company_name.company_id JOIN " +
              "'t_drug_generic' ON t_drug_brand.generic_id == t_drug_generic.generic_id WHERE brand_name like '" +
              searchText +
              "%' LIMIT " + limit + " OFFSET " + offset);
    });

    List<DrugDbModel> drugDbModels = [];
    for (Map<String, dynamic> mp in medicines) {
      DrugDbModel drugDbModel = DrugDbModel.fromJson(mp);

      drugDbModels.add(drugDbModel);
    }

    return drugDbModels;
  }

  Future<int> getCount(String searchText) async {
    if (_db == null) {
      throw "bd is not initiated, initiate using [init(db)] function";
    }
    List<Map<String, dynamic>> words;
    await _db.transaction((txn) async {
      words = await txn.rawQuery(
          "SELECT COUNT(*) FROM 't_drug_brand' where brand_name like '" +
              searchText+"%'");
    });

    int count;
    for (Map<String, dynamic> mp in words) {
      count = mp.values.single;
    }

    return count;
  }

  Future<List<DrugDbModel>> getMedicineData(String limit,
      String offset) async {
    if (_db == null) {
      throw "bd is not initiated, initiate using [init(db)] function";
    }
    List<Map<String, dynamic>> medicines;
    await _db.transaction((txn) async {
      medicines = await txn.rawQuery(
          "SELECT * FROM 't_drug_brand' JOIN 't_company_name' ON t_drug_brand.company_id == t_company_name.company_id JOIN " +
              "'t_drug_generic' ON t_drug_brand.generic_id == t_drug_generic.generic_id LIMIT " +
              limit + " OFFSET " + offset);
    });

    List<DrugDbModel> drugDbModels = [];
    for (Map<String, dynamic> mp in medicines) {
      DrugDbModel drugDbModel = DrugDbModel.fromJson(mp);

      drugDbModels.add(drugDbModel);
    }

    return drugDbModels;
  }

  Future<int> getCountAll() async {
    if (_db == null) {
      throw "bd is not initiated, initiate using [init(db)] function";
    }
    List<Map<String, dynamic>> words;
    await _db.transaction((txn) async {
      words = await txn.rawQuery(
          "SELECT COUNT(*) FROM 't_drug_brand'");
    });

    int count;
    for (Map<String, dynamic> mp in words) {
      count = mp.values.single;
    }

    return count;
  }
}
