import 'package:coffeeapp/Prersentation/Cart/Add.dart';
import 'package:coffeeapp/Prersentation/Cart/Buy.dart';
import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
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
          body: const TabBarView(children: [
            Buyedcartitems(
                title: 'Latte',
                subtitle: 'A coffee mixture with milk,shdsdhfds sdfy fdufhudf sufu dfuydf usdfuf sfusfsf usfusf sudfhudsfsdf sfusf ssfusfus fushfusdfusd  sdhfusdf ddhufhdsfu sdfhsudhfusdf sfhsufs sfduhfu',
                from: 'Mc Cafe',
                cost: '\$2',
                imageurl: 'asset/mc donalds/Mc_2.jpg'),
            Addedcartitems(
                title: 'Latte',
                subtitle: 'A coffee mixture with milk,shdsdhfds sdfy fdufhudf sufu dfuydf usdfuf sfusfsf usfusf sudfhudsfsdf sfusf ssfusfus fushfusdfusd  sdhfusdf ddhufhdsfu sdfhsudhfusdf sfhsufs sfduhfu',
                from: 'Mc Cafe',
                cost: '\$2',
                imageurl: 'asset/mc donalds/Mc_2.jpg'),
          ])),
    );
  }
}
