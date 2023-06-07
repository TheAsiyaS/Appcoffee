import 'package:coffeeapp/Domain/Coffee_subtitle.dart';
import 'package:coffeeapp/Domain/Coffee_titile.dart';
import 'package:coffeeapp/Domain/Urls.dart';
import 'package:coffeeapp/Widgets/Coffee_detalied.dart';
import 'package:coffeeapp/Widgets/Coffee_item_card.dart';import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Dunkin extends StatelessWidget {
  const Dunkin({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kIsWeb ? size.width / 6 : 0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: kIsWeb ? 50 : 0,
        mainAxisSpacing: 40,
        children: List.generate(
            kUrlDunkin.length,
            (index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Coffee_detailed(
                          catergory: 'Dunkin',
                            Coffee_cost: '${index + 1}',
                            size: size,
                            Coffee_url: kUrlDunkin[index],
                            Coffee_title: kdunkintitile[index],
                            Coffee_subtitle: kdunkinSubtitile[index])));
                  },
              child: Coffee_items(
                cost: index.toString(),
                  size: size,
                  Coffee_img_url: kUrlDunkin[index],
                  Coffee_name: kdunkintitile[index],
                  Coffee_something: kdunkinSubtitile[index]),
            )),
      ),
    );
  }
}
