import 'package:coffeeapp/Utensils/Common_colors.dart';

import 'package:coffeeapp/db/Dbfunction.dart';
import 'package:coffeeapp/db/Model/CoffeeModel.dart';
import 'package:coffeeapp/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Addedcartitems extends StatelessWidget {
  const Addedcartitems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int itemCount = addCoffeeListNotifier.value.length;

    List<ValueNotifier<int>> itemCounts = List.generate(
      itemCount,
      (_) => ValueNotifier(0),
    );

    // Ensure getaddCoffeesData is called to update the list
    getaddCoffeesData(userdata!.username);

    return ValueListenableBuilder(
      valueListenable: addCoffeeListNotifier,
      builder: (context, newvalue, _) {
        // Update itemCount to reflect the current state of the list
        itemCount = newvalue.length;

        return SizedBox(
          height: size.height,
          width: size.width,
          child: SafeArea(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return SizedBox(
                  height: size.height / 4,
                  child: Row(
                    children: [
                      SizedBox(
                        height: size.height / 6,
                        width: size.width / 3,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(newvalue[index].coffeeurl),
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
                                      newvalue[index].coffeename,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.playfairDisplay(
                                        color: kwhite,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      '\$${newvalue[index].coffeecost}',
                                      style: GoogleFonts.playfairDisplay(
                                        color: kwhite,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                newvalue[index].coffeedescription,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: kGrey),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    height: size.height / 15,
                                    width: size.width / 2.1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: kbrownlight,
                                        width: 1,
                                      ),
                                    ),
                                    child: ValueListenableBuilder(
                                      valueListenable: itemCounts[index],
                                      builder: (context, newvalue, _) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                itemCounts[index].value++;
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: kgoldlight,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                              ),
                                              child: Text('+'), // Updated to avoid missing reference
                                            ),
                                            Text(
                                                '${itemCounts[index].value}'),
                                            ElevatedButton(
                                              onPressed: () {
                                                if (itemCounts[index].value ==
                                                    0) {
                                                  itemCounts[index].value = 0;
                                                } else {
                                                  itemCounts[index].value--;
                                                }
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: kgoldlight,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                              ),
                                              child: Text('-'), // Updated to avoid missing reference
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      final model = AddCoffeeModel(
                                        coffeename: newvalue[index].coffeename,
                                        coffeeurl: newvalue[index].coffeeurl,
                                        coffeedescription:
                                            newvalue[index].coffeedescription,
                                        coffeecost: newvalue[index].coffeecost,
                                        username: newvalue[index].username,
                                        coffeeid: newvalue[index].coffeeid,
                                      );
                                      await deleteaddcoffee(model);
                                      // Update the notifier after deletion
                                      getaddCoffeesData(userdata!.username);
                                    },
                                    icon: Icon(Icons.close), // Updated to avoid missing reference
                                  ),
                                ],
                              ),
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
              itemCount: itemCount,
            ),
          ),
        );
      },
    );
  }
}

