class CoffeeModel {
  final String coffeename;
  final String coffeeurl;
  final String coffeedescription;
  final String coffeecost;
  final String username;
  final String coffeeid;
  CoffeeModel({
    required this.coffeename,
    required this.coffeeurl,
    required this.coffeedescription,
    required this.coffeecost,
    required this.username,
    required this.coffeeid,
  });

  static CoffeeModel fromJson(Map<String, dynamic> json) {
    final coffeename = json['coffeename'];
    final coffeeurl = json['coffeeurl'];
    final coffeedescription = json['coffeedescription'];
    final coffeecost = json['coffeecost'];
    final username = json['username'];
    final coffeeid = json['coffeeid'];
    return CoffeeModel(
        coffeename: coffeename,
        coffeeurl: coffeeurl,
        coffeedescription: coffeedescription,
        coffeecost: coffeecost,
        username: username,
        coffeeid: coffeeid);
  }
}

class AddCoffeeModel {
  final String coffeename;
  final String coffeeurl;
  final String coffeedescription;
  final String coffeecost;
  final String username;
  final String coffeeid;
  AddCoffeeModel({
    required this.coffeename,
    required this.coffeeurl,
    required this.coffeedescription,
    required this.coffeecost,
    required this.username,
    required this.coffeeid,
  });

  static AddCoffeeModel fromJson(Map<String, dynamic> json) {
    final coffeename = json['coffeename'];
    final coffeeurl = json['coffeeurl'];
    final coffeedescription = json['coffeedescription'];
    final coffeecost = json['coffeecost'];
    final username = json['username'];
    final coffeeid = json['coffeeid'];
    return AddCoffeeModel(
        coffeename: coffeename,
        coffeeurl: coffeeurl,
        coffeedescription: coffeedescription,
        coffeecost: coffeecost,
        username: username,
        coffeeid: coffeeid);
  }
}

class FavCoffeeModel {
  final String coffeename;
  final String coffeeurl;
  final String coffeedescription;
  final String coffeecost;
  final String username;
  final String coffeeid;
  FavCoffeeModel({
    required this.coffeename,
    required this.coffeeurl,
    required this.coffeedescription,
    required this.coffeecost,
    required this.username,
    required this.coffeeid,
  });

  static FavCoffeeModel fromJson(Map<String, dynamic> json) {
    final coffeename = json['coffeename'];
    final coffeeurl = json['coffeeurl'];
    final coffeedescription = json['coffeedescription'];
    final coffeecost = json['coffeecost'];
    final username = json['username'];
    final coffeeid = json['coffeeid'];

    return FavCoffeeModel(
        coffeename: coffeename,
        coffeeurl: coffeeurl,
        coffeedescription: coffeedescription,
        coffeecost: coffeecost,
        username: username,
        coffeeid: coffeeid);
  }
}
