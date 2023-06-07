import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Cart Items'),
        ),
        backgroundColor: ktransaparent,
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
