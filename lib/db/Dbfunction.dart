import 'dart:developer';

import 'package:coffeeapp/db/Model/CoffeeModel.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<CoffeeModel>> CoffeeListNotifier = ValueNotifier([]);
ValueNotifier<List<AddCoffeeModel>> addCoffeeListNotifier = ValueNotifier([]);
ValueNotifier<List<FavCoffeeModel>> favCoffeeListNotifier = ValueNotifier([]);
late Database db;
late Database adddb;
late Database favdb;
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

Future<void> initializesDatabase() async {
  favdb = await openDatabase(
    'favcoffee.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE favcoffee (id INTEGER PRIMARY KEY, coffeename TEXT,coffeeurl TEXT , coffeedescription TEXT , coffeecost TEXT )');
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
  // log('db: $value');
  value.forEach((json) {
    final coffeedetail = AddCoffeeModel.fromJson(json);
    addCoffeeListNotifier.value.add(coffeedetail);
    addCoffeeListNotifier.notifyListeners();
  });
}

Future<void> getfavCoffeesData() async {
  final value = await favdb.rawQuery('SELECT * FROM favcoffee');
  CoffeeListNotifier.value.clear();
  log('db: $value');
  value.forEach((json) {
    final coffeedetail = FavCoffeeModel.fromJson(json);
    favCoffeeListNotifier.value.add(coffeedetail);

    favCoffeeListNotifier.notifyListeners();
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

Future<void> AddCoffeesfavData(FavCoffeeModel coffeemodel) async {
  await favdb.rawInsert(
      'INSERT INTO favcoffee(coffeename, coffeeurl, coffeedescription,coffeecost) VALUES(?,?,?,?)',
      [
        coffeemodel.coffeename,
        coffeemodel.coffeeurl,
        coffeemodel.coffeedescription,
        coffeemodel.coffeecost
      ]);
  getfavCoffeesData();
}
