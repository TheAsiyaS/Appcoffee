import 'package:coffeeapp/Prersentation/Account/Account.dart';
import 'package:coffeeapp/Prersentation/Cart/Cart.dart';
import 'package:coffeeapp/Prersentation/Home/Home.dart';
import 'package:coffeeapp/Prersentation/Favorite/Favorite.dart';
import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/Utensils/Common_icons.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

ValueNotifier<int> bottomIndex = ValueNotifier(0); //bottomnavigationBar index
final navigationScreens = [
  const Home(),
  const Cart(),
  const Liked(),
  const Account()
];

class Navigationbar extends StatelessWidget {
  const Navigationbar({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: bottomIndex,
        builder: (BuildContext ctx, int newindex, Widget? _) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: kblack,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                elevation: 0,
                currentIndex: bottomIndex.value,
                onTap: (index) {
                  bottomIndex.value = index;
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem( 
                      icon: Icon(
                        Icons.coffee,
                      ),
                      label: 'Cart'),
                  BottomNavigationBarItem(
                      icon:
                       kfavorite,
                      
                      label: 'Favourite'),
                  BottomNavigationBarItem(icon: kperson, label: 'Account'),
                ]),
            body: navigationScreens[bottomIndex.value],
          );
        });
  }
}
