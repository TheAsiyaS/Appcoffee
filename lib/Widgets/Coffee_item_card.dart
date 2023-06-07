
import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/Utensils/Common_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Coffee_items extends StatelessWidget {
  const Coffee_items({
    super.key,
    required this.size,
    required this.Coffee_img_url,
    required this.Coffee_name,
    required this.Coffee_something,
    required this.cost,
  });

  final Size size;
  final String Coffee_img_url;
  final String Coffee_name;
  final String Coffee_something;
  final String cost;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> ishovered = ValueNotifier(false);
    return ValueListenableBuilder(
        valueListenable: ishovered,
        builder: (context, newvalue, _) {
          return MouseRegion(
            onEnter: (event) {
              ishovered.value = true;
            },
            onExit: (event) {
              ishovered.value = false;
            },
            child: ishovered.value
                ? Card(
                  color: ktransaparent,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width / 15),
                        child: Container(
                          height: size.height / 4,
                          width: size.width / 3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(Coffee_img_url),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      Text(
                        Coffee_name,
                        style: GoogleFonts.playfairDisplay(fontSize: 30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('\$${cost + 1.toString()}',
                              style: GoogleFonts.playfairDisplay(
                                  fontSize: 30)),
                          IconButton(onPressed: () {}, icon: kadd)
                        ],
                      ),
                    ],
                  ),
                )
                : SizedBox(
                    // color: kwhite,
                    height: kIsWeb ? size.height / 5 : size.height / 3,
                    width: size.width / 2,
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Align(
                          alignment: kIsWeb
                              ? Alignment.center
                              : Alignment.bottomCenter,
                          child: SizedBox(
                            height:
                                kIsWeb ? size.height / 3 : size.height / 4.5,
                            width: size.width / 2,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height / 10,
                                  ),
                                  ListTile(
                                    title: Text(
                                      Coffee_name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Column(
                                      children: [
                                        Divider(
                                          color: kbrownlight,
                                          endIndent: size.width / 6,
                                        ),
                                        Text(
                                          Coffee_something,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: kIsWeb ? 100 : 50,
                          backgroundImage: AssetImage(Coffee_img_url),
                        ),
                      ],
                    ),
                  ),
          );
        });
  }
}


/*
|------------------------------|
|                              |
|                              |
|                              |
|                              |
|                              |
|------------------------------|
|                              |
|  invisible space             |
|                              |
|                              |
| my card item start in here   |
|                              |
|                              |
|                              |
|                              |
|                              |
|------------------------------|
|------------------------------|





 */