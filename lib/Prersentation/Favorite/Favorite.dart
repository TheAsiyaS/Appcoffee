import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/Utensils/Common_icons.dart';
import 'package:coffeeapp/db/Dbfunction.dart';
import 'package:coffeeapp/db/Model/CoffeeModel.dart';
import 'package:coffeeapp/main.dart';
import 'package:flutter/material.dart';

class Liked extends StatelessWidget {
  const Liked({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    getfavCoffeesData(userdata!.username);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Favourite')),
        backgroundColor: kblack,
      ),
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: favCoffeeListNotifier,
              builder: (context, newvalue, _) {
                return GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  children: List.generate(
                      favCoffeeListNotifier.value.length,
                      (index) => SizedBox(
                            height: size.height / 3.5,
                            width: size.width / 2.2,
                            child: Column(
                              children: [
                                Container(
                                  height: size.height / 8,
                                  width: size.width / 3.3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              newvalue[index].coffeeurl),
                                          fit: BoxFit.cover)),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  148, 255, 255, 255),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: IconButton(
                                              onPressed: () async {
                                                final model = FavCoffeeModel(
                                                    coffeename: newvalue[index]
                                                        .coffeename,
                                                    coffeeurl: newvalue[index]
                                                        .coffeeurl,
                                                    coffeedescription:
                                                        newvalue[index]
                                                            .coffeedescription,
                                                    coffeecost: newvalue[index]
                                                        .coffeecost,
                                                    username: newvalue[index]
                                                        .username,
                                                    coffeeid: newvalue[index]
                                                        .coffeeid);
                                                await deletefavcoffee(model);
                                              },
                                              icon: const Icon(
                                                Icons.close,
                                                color: kbrowndark,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Center(
                                    child: Text(
                                      newvalue[index].coffeename,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  subtitle: Column(
                                    children: [
                                      const Divider(
                                        color: kbrownlight,
                                      ),
                                      Text(
                                        newvalue[index].coffeedescription,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                );
              })),
    );
  }
}
