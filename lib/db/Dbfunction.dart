import 'dart:developer';

import 'package:coffeeapp/db/Model/CoffeeModel.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<CoffeeModel>> CoffeeListNotifier = ValueNotifier([]);
ValueNotifier<List<AddCoffeeModel>> addCoffeeListNotifier = ValueNotifier([]);
late Database db;
late Database adddb;
Future<void> initializeDatabase() async {
  db = await openDatabase(
    'coffee.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE coffee (id INTEGER PRIMARY KEY, coffeename TEXT,coffeeurl TEXT , coffeedescription TEXT , coffeecost TEXT )');
    },
  );
}

Future<void> initializedDatabase() async {
  adddb = await openDatabase(
    'addcoffee.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE addcoffee (id INTEGER PRIMARY KEY, coffeename TEXT,coffeeurl TEXT , coffeedescription TEXT , coffeecost TEXT )');
    },
  );
}

Future<void> getCoffeesData() async {
  final value = await db.rawQuery('SELECT * FROM coffee');
  CoffeeListNotifier.value.clear();
  //log('db: $value');
  value.forEach((json) {
    final coffeedetail = CoffeeModel.fromJson(json);
    CoffeeListNotifier.value.add(coffeedetail);

    CoffeeListNotifier.notifyListeners();
  });
}

Future<void> getaddCoffeesData() async {
  final value = await adddb.rawQuery('SELECT * FROM addcoffee');
  addCoffeeListNotifier.value.clear();
  log('db: $value');
  value.forEach((json) {
    final coffeedetail = AddCoffeeModel.fromJson(json);
    addCoffeeListNotifier.value.add(coffeedetail);
    addCoffeeListNotifier.notifyListeners();
  });
}

Future<void> addCoffeesData(CoffeeModel coffeemodel) async {
  await db.rawInsert(
      'INSERT INTO coffee(coffeename, coffeeurl, coffeedescription,coffeecost) VALUES(?,?,?,?)',
      [
        coffeemodel.coffeename,
        coffeemodel.coffeeurl,
        coffeemodel.coffeedescription,
        coffeemodel.coffeecost
      ]);
  getCoffeesData();
}

Future<void> AddCoffeesData(AddCoffeeModel coffeemodel) async {
  await adddb.rawInsert(
      'INSERT INTO addcoffee(coffeename, coffeeurl, coffeedescription,coffeecost) VALUES(?,?,?,?)',
      [
        coffeemodel.coffeename,
        coffeemodel.coffeeurl,
        coffeemodel.coffeedescription,
        coffeemodel.coffeecost
      ]);
  getaddCoffeesData();
}
