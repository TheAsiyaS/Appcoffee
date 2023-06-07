import 'package:coffeeapp/Prersentation/Sign_Ui/Sign_in.dart';
import 'package:coffeeapp/Prersentation/Sign_Ui/Sign_up.dart';
import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/Utensils/Common_sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sign_in_up extends StatelessWidget {
  const Sign_in_up({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/common/common_4.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            height: size.height,
            width: size.width,
            color: kblackshade,
            child: Column(
              children: [
                Container(
                  height: size.height / 2.5,
                  width: size.width / 2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/logo/logo_coffee.png'))),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text('Coffee House',
                        style: GoogleFonts.playfairDisplay(
                            color: const Color.fromARGB(255, 224, 170, 6),
                            fontSize: 25)),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kIsWeb ? size.width / 3.5 : 0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: ktransaparentGrey,
                      child: SizedBox(
                          height: size.height / 1.7,
                          width: size.width,
                          child: Column(
                            children: [
                              TabBar(
                                isScrollable: true,
                                labelColor: kbrownlight,
                                unselectedLabelColor: kgoldlight,
                                labelStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w900),
                                indicatorColor: kGrey,
                                tabs: [
                                  Tab(
                                    child: Text('Sign In',
                                        style: GoogleFonts.playfairDisplay()),
                                  ),
                                  Tab(
                                    child: Text('Sign Up',
                                        style: GoogleFonts.playfairDisplay()),
                                  ),
                                ],
                              ),
                              h30,
                              SizedBox(
                                  height: size.height / 2.3,
                                  width: size.width,
                                  child: const TabBarView(
                                      children: [Sign_in(), Sign_up()])),
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
