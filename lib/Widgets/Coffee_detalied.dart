import 'dart:developer';

import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/Utensils/Common_icons.dart';
import 'package:coffeeapp/Utensils/Common_sizes.dart';
import 'package:coffeeapp/db/Dbfunction.dart';
import 'package:coffeeapp/db/Model/CoffeeModel.dart';
import 'package:coffeeapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class Coffee_detailed extends StatelessWidget {
  const Coffee_detailed(
      {super.key,
      required this.Coffee_url,
      required this.Coffee_title,
      required this.Coffee_subtitle,
      required this.size,
      required this.Coffee_cost,
      required this.catergory,
      required this.coffeeid});
  final String Coffee_url;
  final String Coffee_title;
  final String Coffee_subtitle;
  final Size size;
  final String Coffee_cost;
  final String catergory;
  final String coffeeid;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<double> ratingvalue = ValueNotifier(3);
    ValueNotifier<bool> islike = ValueNotifier(false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ktransaparent,
        leading: Card(
            color: ktransaparentGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  50.0), // Adjust the value to control the roundness
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: kback)),
        actions: [
          Card(
              color: ktransaparentGrey,
              child: IconButton(onPressed: () {}, icon: kcart)),
          w20,
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: size.height / 1,
                  width: size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Coffee_url), fit: BoxFit.cover)),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: kblack,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  height: size.height / 4,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('From $catergory',
                          style: GoogleFonts.dancingScript(
                              fontSize: 25, color: kbrownlight)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Text(
                              "$Coffee_title   \$$Coffee_cost",
                              style: GoogleFonts.playfairDisplay(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ValueListenableBuilder(
                              valueListenable: islike,
                              builder: (context, newvalue, _) {
                                return IconButton(
                                    onPressed: () async {
                                      islike.value = !islike.value;
                                      final model = FavCoffeeModel(
                                          coffeeid: coffeeid,
                                          username: userdata!.username,
                                          coffeename: Coffee_title,
                                          coffeeurl: Coffee_url,
                                          coffeedescription: Coffee_subtitle,
                                          coffeecost: Coffee_cost);
                                      await AddCoffeesfavData(model);
                                    },
                                    icon: islike.value
                                        ? kfavorite
                                        : kfavorite_outline);
                              })
                        ],
                      ),
                      h10,
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          Coffee_subtitle,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: kGrey),
                        ),
                      ),
                      h10,
                      const Divider(
                        color: kbrownlight,
                        endIndent: 20,
                        indent: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height / 4,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder(
                      valueListenable: ratingvalue,
                      builder: (context, snapshot, _) {
                        return Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Transform.scale(
                              scale: 0.6,
                              child: RatingBar.builder(
                                unratedColor: kgoldlight,
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: kbrownlight,
                                ),
                                onRatingUpdate: (rating) {
                                  ratingvalue.value = rating;
                                },
                              ),
                            ),
                            Text('${ratingvalue.value}'),
                            const Spacer(),
                            const Text(
                              '234 reviews',
                              style: TextStyle(color: kGrey),
                            )
                          ],
                        );
                      }),
                  h10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final model = AddCoffeeModel(
                              coffeeid: coffeeid,
                              username: userdata!.username,
                              coffeename: Coffee_title,
                              coffeeurl: Coffee_url,
                              coffeedescription: Coffee_subtitle,
                              coffeecost: Coffee_cost);
                          await AddCoffeesData(model);
                        },
                        child: Container(
                          height: size.height / 12,
                          width: size.width / 2.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [
                                  kbrowndark,
                                  kgoldlight,
                                  kbrowndark,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )),
                          child: Center(
                              child: Text('Add to cart',
                                  style: GoogleFonts.dancingScript(
                                      fontSize: 25, color: kwhite))),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          log("$coffeeid    ${userdata!.username}");
                          final model = CoffeeModel(
                            username: userdata!.username,
                            coffeename: Coffee_title,
                            coffeeurl: Coffee_url,
                            coffeedescription: Coffee_subtitle,
                            coffeecost: Coffee_cost,
                            coffeeid: coffeeid,
                          );
                          await addCoffeesData(model);
                        },
                        child: Container(
                          height: size.height / 12,
                          width: size.width / 2.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [
                                  kbrowndark,
                                  kgoldlight,
                                  kbrowndark,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )),
                          child: Center(
                              child: Text('Buy Now',
                                  style: GoogleFonts.dancingScript(
                                      fontSize: 25, color: kwhite))),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*
Dancing Script
Parisienne
Italianno
 */