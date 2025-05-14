import 'package:coffeeapp/Domain/Coffee_ids.dart';
import 'package:coffeeapp/Domain/Coffee_subtitle.dart';
import 'package:coffeeapp/Domain/Coffee_titile.dart';
import 'package:coffeeapp/Domain/Coffee_Urls.dart';
import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/Widgets/Coffee_detalied.dart';
import 'package:coffeeapp/Widgets/Coffee_item_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Starbucks extends StatelessWidget {
  const Starbucks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'As Starbucks supports Israel, we have decided not to offer their products through our app. Therefore, ordering is currently unavailable.',
            style: TextStyle(color: kwhite),
          ),
          duration: Duration(seconds: 10),
          backgroundColor: kgoldlight,
        ),
      );
     
    });
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kIsWeb ? size.width / 6 : 0),
      child: GridView.count(
        padding: EdgeInsets.zero,
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
                  child: CoffeeItems(
                      cost: index.toString(),
                      size: size,
                      coffeeImgUrl: kUrlStarbucks[index],
                      coffeeName: kstarbuckstitile[index],
                      coffeeSomething: kstarbucksSubtitile[index]),
                )),
      ),
    );
  }
}
