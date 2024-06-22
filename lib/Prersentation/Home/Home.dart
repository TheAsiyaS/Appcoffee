import 'package:coffeeapp/Prersentation/Tabbarwidgets/Costa.dart';
import 'package:coffeeapp/Prersentation/Tabbarwidgets/Dunkin.dart';
import 'package:coffeeapp/Prersentation/Tabbarwidgets/Nescafe.dart';
import 'package:coffeeapp/Prersentation/Tabbarwidgets/Starbucks.dart';

import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/Utensils/Common_icons.dart';
import 'package:coffeeapp/Utensils/Common_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Tabbarwidgets/All.dart';
import '../Tabbarwidgets/Peets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: ktransaparent,
          leading: Card(
              color: ktransaparentGrey,
              child: IconButton(onPressed: () {}, icon: ksqGrid)),
          actions: const [
            CircleAvatar(
              radius: 25,
              backgroundColor: kbrownlight,
              backgroundImage: AssetImage('asset/common/common_6.jpg'),
            ),
            w20,
          ],
        ),
        body: Column(
          children: [
            Container(
                height: size.height / 2,
                width: size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/common/common_2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  height: size.height / 2,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [ktransaparent, kblack],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height / 6.5,
                        width: size.width,
                      ),
                      Text('Find The Best COFFEE\nFor You From \nCOFFEE HOUSE',
                          style: GoogleFonts.playfairDisplay(
                              color: kwhite, fontSize: 30)),
                      h20,
                      SizedBox(
                        height: size.height / 15,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: kIsWeb ? size.width / 6 : 0),
                          child: CupertinoTextField(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: ktransaparentGrey,
                                borderRadius: BorderRadius.circular(10)),
                            placeholder: 'Find new tastes.....',
                            placeholderStyle:
                                const TextStyle(color: klightwhite),
                            onSubmitted: (value) {},
                            prefix: ksearchicon,
                          ),
                        ),
                      ),
                      TabBar(
                        isScrollable: true,
                        labelColor: kbrownlight,
                        unselectedLabelColor: kgoldlight,
                        labelStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                        indicatorColor: ktransaparentGrey,
                        tabs: [
                          Tab(
                            child: Text('All',
                                style: GoogleFonts.playfairDisplay()),
                          ),
                          Tab(
                            child: Text('Starbucks',
                                style: GoogleFonts.playfairDisplay()),
                          ),
                          Tab(
                            child: Text('Costa',
                                style: GoogleFonts.playfairDisplay()),
                          ),
                          Tab(
                            child: Text('Nescafe',
                                style: GoogleFonts.playfairDisplay()),
                          ),
                          Tab(
                            child: Text('Peet\'s',
                                style: GoogleFonts.playfairDisplay()),
                          ),
                          Tab(
                            child: Text('Dunkin',
                                style: GoogleFonts.playfairDisplay()),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            const Expanded(
              child: TabBarView(children: [
                All(),
                Starbucks(),
                Costa(),
                Nescafe(),
                Peets(),
                Dunkin()
              ]),
            )
          ],
        ),
      ),
    );
  }
}
