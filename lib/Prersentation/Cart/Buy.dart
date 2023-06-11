import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/Utensils/Common_sizes.dart';
import 'package:coffeeapp/Widgets/ConatinerText.dart';
import 'package:coffeeapp/db/Dbfunction.dart';
import 'package:coffeeapp/db/Model/CoffeeModel.dart';
import 'package:coffeeapp/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buyedcartitems extends StatelessWidget {
  const Buyedcartitems({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<CoffeeModel> data;
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
                          image: AssetImage(data[index].coffeeurl),
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
                              Expanded(
                                child: Text(
                                  data[index].coffeename,
                                  style: GoogleFonts.playfairDisplay(
                                    color: kwhite,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              w20,
                              Expanded(
                                child: Text(
                                  "\$${data[index].coffeecost}",
                                  style: GoogleFonts.playfairDisplay(
                                    color: kwhite,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            data[index].coffeedescription,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: kGrey),
                          ),
                          h10,
                          Align(
                            alignment: Alignment.center,
                            child: containerText(size: size, text: 'Purchased'),
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
          itemCount: data.length,
        ),
      ),
    );
  }
}

