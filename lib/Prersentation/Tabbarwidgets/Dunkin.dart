import 'package:coffeeapp/Domain/Coffee_ids.dart';
import 'package:coffeeapp/Domain/Coffee_subtitle.dart';
import 'package:coffeeapp/Domain/Coffee_titile.dart';
import 'package:coffeeapp/Domain/Coffee_Urls.dart';
import 'package:coffeeapp/Widgets/Coffee_detalied.dart';
import 'package:coffeeapp/Widgets/Coffee_item_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Dunkin extends StatelessWidget {
  const Dunkin({super.key, });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kIsWeb ? size.width / 6 : 0),
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        crossAxisSpacing: kIsWeb ? 50 : 0,
        mainAxisSpacing: 40,
        children: List.generate(
            kUrlDunkin.length,
            (index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Coffee_detailed(
                            coffeeid: kdunkinid[index],
                            catergory: 'Dunkin',
                            Coffee_cost: '${index + 1}',
                            size: size,
                            Coffee_url: kUrlDunkin[index],
                            Coffee_title: kdunkintitile[index],
                            Coffee_subtitle: kdunkinSubtitile[index])));
                  },
                  child: CoffeeItems(
                      cost: index.toString(),
                      size: size,
                      coffeeImgUrl: kUrlDunkin[index],
                      coffeeName: kdunkintitile[index],
                      coffeeSomething: kdunkinSubtitile[index]),
                )),
      ),
    );
  }
}
