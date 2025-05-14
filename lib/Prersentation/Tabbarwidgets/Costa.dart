import 'package:coffeeapp/Domain/Coffee_ids.dart';
import 'package:coffeeapp/Domain/Coffee_subtitle.dart';
import 'package:coffeeapp/Domain/Coffee_titile.dart';
import 'package:coffeeapp/Domain/Coffee_Urls.dart';
import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/Widgets/Coffee_detalied.dart';
import 'package:coffeeapp/Widgets/Coffee_item_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Costa extends StatelessWidget {
  const Costa({super.key, });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {   
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'As Costa supports Israel, we have decided not to offer their products through our app. Therefore, ordering is currently unavailable.',
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
        mainAxisSpacing:  40,
        crossAxisSpacing: kIsWeb ? 50 : 0,
        children: List.generate(
            kUrlCosta.length,
            (index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Coffee_detailed(
                          coffeeid: kcostaid[index],
                          catergory: 'Costa',
                            Coffee_cost: '${index + 1}',
                            size: size,
                            Coffee_url: kUrlCosta[index],
                            Coffee_title: kcostatitile[index],
                            Coffee_subtitle: kcostaSubtitile[index])));
                  },
              child: CoffeeItems(
                cost: index.toString(),
                  size: size,
                  coffeeImgUrl: kUrlCosta[index],
                  coffeeName: kcostatitile[index],
                  coffeeSomething: kcostaSubtitile[index]),
            )),
      ),
    );
  }
}
