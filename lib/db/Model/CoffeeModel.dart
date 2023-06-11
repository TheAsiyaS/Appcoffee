class CoffeeModel {
  final String coffeename;
  final String coffeeurl;
  final String coffeedescription;
  final String coffeecost;
  final String username;
  CoffeeModel({
    required this.coffeename,
    required this.coffeeurl,
    required this.coffeedescription,
    required this.coffeecost,
    required this.username,
  });

  static CoffeeModel fromJson(Map<String, dynamic> json) {
    final coffeename = json['coffeename'];
    final coffeeurl = json['coffeeurl'];
    final coffeedescription = json['coffeedescription'];
    final coffeecost = json['coffeecost'];
    final username = json['username'];
    return CoffeeModel(
        coffeename: coffeename,
        coffeeurl: coffeeurl,
        coffeedescription: coffeedescription,
        coffeecost: coffeecost,
        username: username);
  }
}

class AddCoffeeModel {
  final String coffeename;
  final String coffeeurl;
  final String coffeedescription;
  final String coffeecost;
  final String username;
  AddCoffeeModel({
    required this.coffeename,
    required this.coffeeurl,
    required this.coffeedescription,
    required this.coffeecost,
    required this.username,
  });

  static AddCoffeeModel fromJson(Map<String, dynamic> json) {
    final coffeename = json['coffeename'];
    final coffeeurl = json['coffeeurl'];
    final coffeedescription = json['coffeedescription'];
    final coffeecost = json['coffeecost'];
    final username = json['username'];
    return AddCoffeeModel(
        coffeename: coffeename,
        coffeeurl: coffeeurl,
        coffeedescription: coffeedescription,
        coffeecost: coffeecost,
        username: username);
  }
}

class FavCoffeeModel {
  final String coffeename;
  final String coffeeurl;
  final String coffeedescription;
  final String coffeecost;
  final String username;
  FavCoffeeModel({
    required this.coffeename,
    required this.coffeeurl,
    required this.coffeedescription,
    required this.coffeecost,
    required this.username,
  });

  static FavCoffeeModel fromJson(Map<String, dynamic> json) {
    final coffeename = json['coffeename'];
    final coffeeurl = json['coffeeurl'];
    final coffeedescription = json['coffeedescription'];
    final coffeecost = json['coffeecost'];
    final username = json['username'];
    return FavCoffeeModel(
        coffeename: coffeename,
        coffeeurl: coffeeurl,
        coffeedescription: coffeedescription,
        coffeecost: coffeecost,
        username: username);
  }
}
