import 'dart:developer';

import 'package:coffeeapp/db/Model/CoffeeModel.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'Model/UserModel.dart';

ValueNotifier<List<CoffeeModel>> CoffeeListNotifier = ValueNotifier([]);
ValueNotifier<List<AddCoffeeModel>> addCoffeeListNotifier = ValueNotifier([]);
ValueNotifier<List<FavCoffeeModel>> favCoffeeListNotifier = ValueNotifier([]);
ValueNotifier<List<User>> userNotifier = ValueNotifier([]);
late Database db;
late Database adddb;
late Database favdb;
late Database userdb;

Future<void> initializeDatabase() async {
  db = await openDatabase(
    'coffee.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE coffee (id INTEGER PRIMARY KEY, coffeename TEXT, coffeeurl TEXT, coffeedescription TEXT, coffeecost TEXT, username TEXT, coffeeid TEXT)');
    },
  );
  adddb = await openDatabase(
    'addcoffee.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE addcoffee (id INTEGER PRIMARY KEY, coffeename TEXT, coffeeurl TEXT, coffeedescription TEXT, coffeecost TEXT, username TEXT, coffeeid TEXT)');
    },
  );
  favdb = await openDatabase(
    'favcoffee.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE favcoffee (id INTEGER PRIMARY KEY, coffeename TEXT, coffeeurl TEXT, coffeedescription TEXT, coffeecost TEXT, username TEXT, coffeeid TEXT)');
    },
  );
  userdb = await openDatabase(
    'user.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE user (id INTEGER PRIMARY KEY,username TEXT,password TEXT)');
    },
  );
}

/*

-------------------------get -------------------------------


 */
Future<void> getCoffeesData(String username) async {
  final value =
      await db.rawQuery('SELECT * FROM coffee WHERE username = ?', [username]);
  CoffeeListNotifier.value.clear();
  //log('db: $value');
  value.forEach((json) {
    final coffeedetail = CoffeeModel.fromJson(json);
    CoffeeListNotifier.value.add(coffeedetail);

    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    CoffeeListNotifier.notifyListeners();
  });
}

Future<void> getaddCoffeesData(String username) async {
  final value = await adddb
      .rawQuery('SELECT * FROM addcoffee WHERE username = ?', [username]);

  addCoffeeListNotifier.value.clear();

  List<AddCoffeeModel> allCoffees =
      value.map((json) => AddCoffeeModel.fromJson(json)).toList();

  List<AddCoffeeModel> uniqueCoffees = removeDuplicates(allCoffees);

  addCoffeeListNotifier.value.addAll(uniqueCoffees);

  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  addCoffeeListNotifier.notifyListeners();
}

// Function to remove duplicates
List<AddCoffeeModel> removeDuplicates(List<AddCoffeeModel> coffees) {
  final seen = <String>{};
  return coffees.where((coffee) => seen.add(coffee.coffeename)).toList();
}

Future<void> getfavCoffeesData(String username) async {
  final value = await favdb
      .rawQuery('SELECT * FROM favcoffee WHERE username = ?', [username]);
  favCoffeeListNotifier.value.clear();

  value.forEach((json) {
    final coffeedetail = FavCoffeeModel.fromJson(json);
    favCoffeeListNotifier.value.add(coffeedetail);

    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    favCoffeeListNotifier.notifyListeners();
  });
}

Future<bool> getuserData(String username) async {
  final value = await userdb
      .rawQuery('SELECT * FROM user WHERE username = ?', [username]);
  userNotifier.value.clear();
  log('db: $value');
  final valueuser = await userdb.rawQuery('SELECT * FROM user');
  log('value user $valueuser');
  value.forEach((json) {
    final userdetail = User.fromJson(json);
    log('db: $userdetail');
    userNotifier.value.add(userdetail);

    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    userNotifier.notifyListeners();
  });
  if (value.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

/*



----------------------------add----------------



*/
Future<void> addCoffeesData(CoffeeModel coffeemodel) async {
  await db.rawInsert(
      'INSERT INTO coffee(coffeename, coffeeurl, coffeedescription, coffeecost, username, coffeeid) VALUES(?,?,?,?,?,?)',
      [
        coffeemodel.coffeename,
        coffeemodel.coffeeurl,
        coffeemodel.coffeedescription,
        coffeemodel.coffeecost,
        coffeemodel.username,
        coffeemodel.coffeeid,
      ]);
}

Future<void> AddCoffeesData(AddCoffeeModel coffeemodel) async {
  await adddb.rawInsert(
      'INSERT INTO addcoffee(coffeename, coffeeurl, coffeedescription, coffeecost, username, coffeeid) VALUES(?,?,?,?,?,?)',
      [
        coffeemodel.coffeename,
        coffeemodel.coffeeurl,
        coffeemodel.coffeedescription,
        coffeemodel.coffeecost,
        coffeemodel.username,
        coffeemodel.coffeeid,
      ]);
}

Future<void> AddCoffeesfavData(FavCoffeeModel coffeemodel) async {
  await favdb.rawInsert(
      'INSERT INTO favcoffee(coffeename, coffeeurl, coffeedescription, coffeecost, username, coffeeid) VALUES(?,?,?,?,?,?)',
      [
        coffeemodel.coffeename,
        coffeemodel.coffeeurl,
        coffeemodel.coffeedescription,
        coffeemodel.coffeecost,
        coffeemodel.username,
        coffeemodel.coffeeid,
      ]);
}

Future<bool> addUserData(String username, String password) async {
  final existingUser = await userdb
      .rawQuery('SELECT * FROM user WHERE username = ?', [username]);

  if (existingUser.isEmpty) {
    await userdb.rawInsert(
        'INSERT INTO user (username, password) VALUES (?, ?)',
        [username, password]);
    log('User added successfully');
    final value = await userdb.rawQuery('SELECT * FROM user');
    log('value user $value');
    return true;
  } else {
    log('User already exists');
    return false;
  }
}

/*



-----------------------------delete-------------------------------



 */
Future<void> deleteUser(String username) async {
  // Delete the user from the table
  await userdb.rawDelete(
    'DELETE FROM user WHERE username = ?',
    [username],
  );
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  userNotifier.notifyListeners();
}

Future<void> deletecoffee(CoffeeModel model) async {
  // Delete the user from the table
  await db.rawDelete(
    'DELETE FROM coffee WHERE coffeeid = ?',
    [model.coffeeid],
  );

  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  CoffeeListNotifier.notifyListeners();
}

Future<void> deleteaddcoffee(AddCoffeeModel model) async {
  // Delete the user from the table
  await adddb.rawDelete(
    'DELETE FROM addcoffee WHERE coffeeid = ?',
    [model.coffeeid],
  );

  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  addCoffeeListNotifier.notifyListeners();
}

Future<void> deletefavcoffee(FavCoffeeModel model) async {
  // Delete the user from the table
  await favdb.rawDelete(
    'DELETE FROM favcoffee WHERE coffeeid = ?',
    [model.coffeeid],
  );

  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  favCoffeeListNotifier.notifyListeners();
}
