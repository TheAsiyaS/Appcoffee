import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class containerText extends StatelessWidget {
  const containerText({
    super.key,
    required this.size,
    required this.text,
  });

  final Size size;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 15,
      width: size.width / 2.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: kbrownlight, // Set the color of the border
          width: 1, // Set the width of the border
        ),
      ),
      child: Center(
          child: Text(
        text,
        style: GoogleFonts.playfairDisplay(
          color: kwhite,
          fontSize: 20,
        ),
      )),
    );
  }
}
