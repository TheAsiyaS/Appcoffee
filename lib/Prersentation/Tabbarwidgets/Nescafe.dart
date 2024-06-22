import 'package:coffeeapp/Domain/Coffee_ids.dart';
import 'package:coffeeapp/Domain/Coffee_subtitle.dart';
import 'package:coffeeapp/Domain/Coffee_titile.dart';
import 'package:coffeeapp/Domain/Coffee_Urls.dart';
import 'package:coffeeapp/Widgets/Coffee_detalied.dart';
import 'package:coffeeapp/Widgets/Coffee_item_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Nescafe extends StatelessWidget {
  const Nescafe({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kIsWeb ? size.width / 6 : 0),
      child: GridView.count(
         padding: EdgeInsets.zero,
        crossAxisCount: 2,
        mainAxisSpacing: 40,
        crossAxisSpacing: kIsWeb ? 50 : 0,
        children: List.generate(
            kUrlNescafe.length,
            (index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Coffee_detailed(
                            coffeeid: knescafeid[index],
                            catergory: 'Nescafe',
                            Coffee_cost: '${index + 1}',
                            size: size,
                            Coffee_url: kUrlNescafe[index],
                            Coffee_title: knescafetitile[index],
                            Coffee_subtitle: knescafeSubtitile[index])));
                  },
                  child: CoffeeItems(
                      cost: index.toString(),
                      size: size,
                      coffeeImgUrl: kUrlNescafe[index],
                      coffeeName: knescafetitile[index],
                      coffeeSomething: knescafeSubtitile[index]),
                )),
      ),
    );
  }
}
