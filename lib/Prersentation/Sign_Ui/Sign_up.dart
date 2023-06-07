import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/Utensils/Common_icons.dart';
import 'package:coffeeapp/Utensils/Common_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sign_up extends StatelessWidget {
  const Sign_up({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isshow = ValueNotifier(false);

    return Column(
      children: [
        CupertinoTextField(
          placeholder: ' Username.....',
          placeholderStyle: const TextStyle(color: kwhite),
          onSubmitted: (value) {},
          prefix: kperson,
          decoration: const BoxDecoration(),
        ),
        const Divider(
          color: kbrownlight,
        ),
        h30,
        CupertinoTextField(
          placeholder: ' Password.....',
          placeholderStyle: const TextStyle(color: kwhite),
          onSubmitted: (value) {},
          prefix: ksecurity,
          suffix: ValueListenableBuilder(
              valueListenable: isshow,
              builder: (context, newvalue, _) {
                return IconButton(
                    onPressed: () {
                      isshow.value = !isshow.value;
                    },
                    icon: isshow.value ? khide : kshow);
              }),
          decoration: const BoxDecoration(),
        ),
        const Divider(
          color: kbrownlight,
        ),
        h30,
        CupertinoTextField(
          placeholder: ' Conform Password.....',
          placeholderStyle: const TextStyle(color: kwhite),
          onSubmitted: (value) {}, 
          prefix: ksecurity,
          suffix: ValueListenableBuilder(
              valueListenable: isshow,
              builder: (context, newvalue, _) {
                return IconButton(
                    onPressed: () {
                      isshow.value = !isshow.value;
                    },
                    icon: isshow.value ? khide : kshow);
              }),
          decoration: const BoxDecoration(),
        ),
        const Divider(
          color: kbrownlight,
        ),
        h10,
        SizedBox(
          height: 70,
          width: 200,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: kbrown,
              shadowColor: kblack,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text('Sign Up',
                style: GoogleFonts.playfairDisplay(
                    fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}
