import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/db/Dbfunction.dart';
import 'package:flutter/material.dart';

class Liked extends StatelessWidget {
  const Liked({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                      (index) => Favouritecard(
                            size: size,
                            url: newvalue[index].coffeeurl,
                            cost: newvalue[index].coffeecost,
                            subtitle: newvalue[index].coffeedescription,
                            title: newvalue[index].coffeename,
                          )),
                );
              })), 
    );
  }
}

class Favouritecard extends StatelessWidget {
  const Favouritecard({
    super.key,
    required this.size,
    required this.url,
    required this.title,
    required this.subtitle,
    required this.cost,
  });

  final Size size;
  final String url;
  final String title;
  final String subtitle;
  final String cost;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      width: size.width / 2.2,
      child: Column(
        children: [
          Container(
            height: size.height / 7.5,
            width: size.width / 3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image:
                    DecorationImage(image: AssetImage(url), fit: BoxFit.cover)),
          ),
          Card(
            color: kblack,
            child: ListTile(
              title: Center(
                child: Text(
                  title,
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
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
