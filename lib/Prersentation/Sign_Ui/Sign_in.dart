import 'package:coffeeapp/Navigation.dart';
import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/Utensils/Common_icons.dart';
import 'package:coffeeapp/Utensils/Common_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Sign_in extends StatelessWidget {
  const Sign_in({Key? key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isshow = ValueNotifier(false);
   // final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
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
          const Align(
            alignment: Alignment.topRight,
            child: Text(
              'Forget password?',
              style: TextStyle(
                color: kGrey,
              ),
            ),
          ),
          h10,
          SizedBox(
            height: 70,
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const Navigationbar()),
                    (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kbrown,
                shadowColor: kblack,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('Sign In',
                  style: GoogleFonts.playfairDisplay(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          h10,
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Divider(
                    color: kbrownlight,
                    thickness: 1,
                  ),
                ),
              ),
              Text('OR',
                  style: GoogleFonts.playfairDisplay(
                      color: kbrownlight,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Divider(
                    color: kbrownlight,
                    thickness: 1,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.facebook,
                    color: kbrownlight,
                    size: 35,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.google,
                    color: kbrownlight,
                    size: 35,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
