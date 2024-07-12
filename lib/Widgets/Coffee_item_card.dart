import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/Utensils/Common_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeItems extends StatelessWidget {
  const CoffeeItems({
    Key? key,
    required this.size,
    required this.coffeeImgUrl,
    required this.coffeeName,
    required this.coffeeSomething,
    required this.cost,
  }) : super(key: key);

  final Size size;
  final String coffeeImgUrl;
  final String coffeeName;
  final String coffeeSomething;
  final String cost;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isHovered = ValueNotifier(false);
    return ValueListenableBuilder(
      valueListenable: isHovered,
      builder: (context, newvalue, _) {
        return MouseRegion(
          onEnter: (event) {
            isHovered.value = true;
          },
          onExit: (event) {
            isHovered.value = false;
          },
          child: isHovered.value
              ? Card(
                  color: ktransaparent,
                  child: SizedBox(
                    width: size.width / 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: size.height / 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              coffeeImgUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: size.width / 15),
                          child: Text(
                            coffeeName,
                            style: GoogleFonts.playfairDisplay(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('\$${int.parse(cost) + 1}',
                                style:
                                    GoogleFonts.playfairDisplay(fontSize: 30)),
                            IconButton(onPressed: () {}, icon: kadd),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox(
                  height: kIsWeb ? size.height / 5 : size.height / 3,
                  width: size.width / 2,
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Align(
                        alignment:
                            kIsWeb ? Alignment.center : Alignment.bottomCenter,
                        child: SizedBox(
                          height: kIsWeb ? size.height / 3 : size.height / 5,
                          width: size.width / 2,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: size.height / 15),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          coffeeName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            print('hello');
                                          },
                                          child:
                                              const Icon(Icons.bookmark_border))
                                    ],
                                  ),
                                  subtitle: Column(
                                    children: [
                                      Divider(
                                          color: kbrownlight,
                                          endIndent: size.width / 6),
                                      Text(
                                        coffeeSomething,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
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
                        backgroundImage: AssetImage(coffeeImgUrl),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
