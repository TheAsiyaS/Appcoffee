import 'package:coffeeapp/Domain/Coffee_subtitle.dart';
import 'package:coffeeapp/Domain/Coffee_titile.dart';
import 'package:coffeeapp/Domain/Urls.dart';
import 'package:coffeeapp/Widgets/Coffee_detalied.dart';
import 'package:coffeeapp/Widgets/Coffee_item_card.dart';import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Peets extends StatelessWidget {
  const Peets({Key? key});

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
            kUrlPeets.length,
            (index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Coffee_detailed(
                          catergory: 'Peet\'s',
                            Coffee_cost: '${index + 1}',
                            size: size,
                            Coffee_url: kUrlPeets[index],
                            Coffee_title: kpeetstitile[index],
                            Coffee_subtitle: kpeetsSubtitile[index])));
                  },
              child: Coffee_items(
                cost: index.toString(),
                  size: size,
                  Coffee_img_url: kUrlPeets[index],
                  Coffee_name: kpeetstitile[index],
                  Coffee_something: kpeetsSubtitile[index]),
            )),
      ),
    );
  }
}
