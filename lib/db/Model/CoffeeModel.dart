class CoffeeModel {
  final String coffeename;
  final String coffeeurl;
  final String coffeedescription;
  final String coffeecost;
  CoffeeModel({
    required this.coffeename,
    required this.coffeeurl,
    required this.coffeedescription,
    required this.coffeecost,
  });

  static CoffeeModel fromJson(Map<String, dynamic> json) {
    final coffeename = json['coffeename'];
    final coffeeurl = json['coffeeurl'];
    final coffeedescription = json['coffeedescription'];
    final coffeecost = json['coffeecost'];

    return CoffeeModel(
        coffeename: coffeename,
        coffeeurl: coffeeurl,
        coffeedescription: coffeedescription,
        coffeecost: coffeecost);
  }
}
class AddCoffeeModel {
  final String coffeename;
  final String coffeeurl;
  final String coffeedescription;
  final String coffeecost;
  AddCoffeeModel({
    required this.coffeename,
    required this.coffeeurl,
    required this.coffeedescription,
    required this.coffeecost,
  });

  static AddCoffeeModel fromJson(Map<String, dynamic> json) {
    final coffeename = json['coffeename'];
    final coffeeurl = json['coffeeurl'];
    final coffeedescription = json['coffeedescription'];
    final coffeecost = json['coffeecost'];

    return AddCoffeeModel(
        coffeename: coffeename,
        coffeeurl: coffeeurl,
        coffeedescription: coffeedescription,
        coffeecost: coffeecost);
  }
}

class FavCoffeeModel {
  final String coffeename;
  final String coffeeurl;
  final String coffeedescription;
  final String coffeecost;
  FavCoffeeModel({
    required this.coffeename,
    required this.coffeeurl,
    required this.coffeedescription,
    required this.coffeecost,
  });

  static FavCoffeeModel fromJson(Map<String, dynamic> json) {
    final coffeename = json['coffeename'];
    final coffeeurl = json['coffeeurl'];
    final coffeedescription = json['coffeedescription'];
    final coffeecost = json['coffeecost'];

    return FavCoffeeModel(
        coffeename: coffeename,
        coffeeurl: coffeeurl,
        coffeedescription: coffeedescription,
        coffeecost: coffeecost);
  }
}