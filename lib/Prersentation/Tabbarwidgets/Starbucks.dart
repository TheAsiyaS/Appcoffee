import 'package:coffeeapp/Domain/Coffee_ids.dart';
import 'package:coffeeapp/Domain/Coffee_subtitle.dart';
import 'package:coffeeapp/Domain/Coffee_titile.dart';
import 'package:coffeeapp/Domain/Coffee_Urls.dart';
import 'package:coffeeapp/Widgets/Coffee_detalied.dart';
import 'package:coffeeapp/Widgets/Coffee_item_card.dart';import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Starbucks extends StatelessWidget {
  const Starbucks({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kIsWeb ? size.width / 6 : 0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 40,
        crossAxisSpacing: kIsWeb ? 50 : 0,
        children: List.generate(
            kUrlStarbucks.length,
            (index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Coffee_detailed(
                            coffeeid: kstarbucksid[index],
                          catergory: 'Starbucks',
                            Coffee_cost: '${index + 1}',
                            size: size,
                            Coffee_url: kUrlStarbucks[index],
                            Coffee_title: kstarbuckstitile[index],
                            Coffee_subtitle: kstarbucksSubtitile[index])));
                  },
              child: Coffee_items(
                cost: index.toString(),
                  size: size,
                  Coffee_img_url: kUrlStarbucks[index],
                  Coffee_name: kstarbuckstitile[index],
                  Coffee_something: kstarbucksSubtitile[index]),
            )),
      ),
    );
  }
}
