import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class StarbucksCoffeeScreen extends StatefulWidget {
  const StarbucksCoffeeScreen({super.key});

  @override
  _StarbucksCoffeeScreenState createState() => _StarbucksCoffeeScreenState();
}

class _StarbucksCoffeeScreenState extends State<StarbucksCoffeeScreen> {
  List<Map<String, dynamic>> starbucksProducts = [];

  @override
  void initState() {
    super.initState();
    fetchStarbucksCoffeeData();
  }

  Future<void> fetchStarbucksCoffeeData() async {
    const apiUrl = 'https://world.openfoodfacts.org/category/coffees.json';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the response JSON and extract the desired data
      final jsonData = json.decode(response.body);
      final products = jsonData['products'];

      // Filter and retrieve Starbucks coffee data
      final filteredProducts = List<Map<String, dynamic>>.from(products)
          .where((product) =>
              product['brands'] is String &&
              product['brands'].toLowerCase().contains('starbucks'))
          .toList();
          

      setState(() {
        starbucksProducts = filteredProducts;
      });
    } else {
      // Handle API error
      log('API request failed with status code: ${response.statusCode}');
    }
  }   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Starbucks Coffees'),
      ),
      body: ListView.builder(
        itemCount: starbucksProducts.length,
        itemBuilder: (context, index) {
          final productName = starbucksProducts[index]['product_name'];
          final brands = starbucksProducts[index]['brands'];
          final imageUrl = starbucksProducts[index]['image_url'];

          return Card(
            child: ListTile(
              leading: imageUrl != null
                  ? Image.network(
                      imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: Colors.red,
                      height: 100,
                      width: 100,
                    ),
              title: Text(productName ?? 'no product'),
              subtitle: Text(brands ?? "no brand"),
            ),
          );
        },
      ),
    );
  }
}
