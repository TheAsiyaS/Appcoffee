import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.blue,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  margin: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Center(
                    child: Text('Item $index'),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                10,
                (index) => Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.green,
                  child: Center(
                    child: Text('Grid Item $index'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     const Text(
                    //       '\$20',
                    //       style: TextStyle(
                    //           fontSize: 20, fontWeight: FontWeight.bold),
                    //     ),
                    //     IconButton(onPressed: () {}, icon: kadd)
                    //   ],
                    // ),