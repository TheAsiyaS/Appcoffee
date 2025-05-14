import 'package:coffeeapp/Domain/Coffee_ids.dart';
import 'package:coffeeapp/Domain/Coffee_subtitle.dart';
import 'package:coffeeapp/Domain/Coffee_titile.dart';
import 'package:coffeeapp/Domain/Coffee_Urls.dart';
import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/Widgets/Coffee_detalied.dart';
import 'package:coffeeapp/Widgets/Coffee_item_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';    

class Nescafe extends StatelessWidget {
  const Nescafe({super.key,});

  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance.addPostFrameCallback((_) {   
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text( 
            'As Nescafe supports Israel, we have decided not to offer their products through our app. Therefore, ordering is currently unavailable.',
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
