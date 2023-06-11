import 'package:coffeeapp/Prersentation/Cart/Add.dart';
import 'package:coffeeapp/Prersentation/Cart/Buy.dart';
import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/db/Dbfunction.dart';
import 'package:coffeeapp/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    getCoffeesData(userdata!.username);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: ktransaparent,
              title: Center(
                child: TabBar(
                  isScrollable: true,
                  labelColor: kbrownlight,
                  unselectedLabelColor: kgoldlight,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w900),
                  indicatorColor: kgoldlight,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Tab(
                      child: SizedBox(
                          height: 50,
                          width: 100,
                          child: Center(
                              child: Text('Buy',
                                  style: GoogleFonts.playfairDisplay()))),
                    ),
                    Tab(
                      child: SizedBox(
                          height: 50,
                          width: 100,
                          child: Center(
                              child: Text('Add',
                                  style: GoogleFonts.playfairDisplay()))),
                    ),
                  ],
                ),
              )),
          extendBodyBehindAppBar: true,
          body: TabBarView(children: [
            ValueListenableBuilder(
                valueListenable: CoffeeListNotifier,
                builder: (context, newvalue, _) {
                  return Buyedcartitems(
                    data: newvalue,
                  );
                }),
            const Addedcartitems(),
          ])),
    );
  }
}
