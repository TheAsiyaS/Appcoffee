import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/Utensils/Common_icons.dart';
import 'package:coffeeapp/Utensils/Common_sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buyedcartitems extends StatelessWidget {
  const Buyedcartitems({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.from,
    required this.cost,
    required this.imageurl,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String from;
  final String cost;
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return SizedBox(
              height: size.height / 5,
              child: Row(
                children: [
                  w10,
                  SizedBox(
                    height: size.height / 6,
                    width: size.width / 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(imageurl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                title,
                                style: GoogleFonts.playfairDisplay(
                                  color: kwhite,
                                  fontSize: 20,
                                ),
                              ),
                              w20,
                              Text(
                                cost,
                                style: GoogleFonts.playfairDisplay(
                                  color: kwhite,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                          Text(
                            subtitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: kGrey),
                          ),
                          h10,
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: size.height / 15,
                              width: size.width / 2.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color:
                                      kbrownlight, // Set the color of the border
                                  width: 1, // Set the width of the border
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                'You Buyed',
                                style: GoogleFonts.playfairDisplay(
                                  color: kwhite,
                                  fontSize: 20,
                                ),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: kbrownlight,
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
