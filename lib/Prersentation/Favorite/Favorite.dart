import 'package:coffeeapp/Utensils/Common_colors.dart';
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
          child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 30,
        children: List.generate(10, (index) => Favouritecard(size: size)),
      )),
    );
  }
}

class Favouritecard extends StatelessWidget {
  const Favouritecard({
    super.key,
    required this.size,
  });

  final Size size;

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
                image: const DecorationImage(
                    image: AssetImage('asset/common/common_0.jpg'),
                    fit: BoxFit.cover)),
          ),
          const Card(
            color: kblack,
            child: ListTile(
              title: Center(
                child: Text(
                  "Coffee_name",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              subtitle: Column(
                children: [
                  Divider(
                    color: kbrownlight,
                  ),
                  Text(
                    "Coffee_something dfuhdf fduigfug  dfhgufdg kdfiddfu idf ",
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
