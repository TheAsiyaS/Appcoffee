import 'dart:developer';

import 'package:coffeeapp/Navigation.dart';
import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/Utensils/Common_icons.dart';
import 'package:coffeeapp/Utensils/Common_sizes.dart';
import 'package:coffeeapp/db/Authentication/UserAuthentcatio.dart';
import 'package:coffeeapp/db/Dbfunction.dart';
import 'package:coffeeapp/db/Model/UserModel.dart';
import 'package:coffeeapp/main.dart';
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
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CupertinoTextField(
            placeholder: ' Username.....',
            controller: usernameController,
            placeholderStyle: const TextStyle(color: kwhite),
            onSubmitted: (value) {
              usernameController.text = value;
            },
            onChanged: (value) => usernameController.text = value,
            prefix: kperson,
            decoration: const BoxDecoration(),
          ),
          const Divider(
            color: kbrownlight,
          ),
          h30,
          CupertinoTextField(
            placeholder: ' Password.....',
            controller: passwordController,
            placeholderStyle: const TextStyle(color: kwhite),
            onSubmitted: (value) {
              passwordController.text = value;
            },
            onChanged: (value) => passwordController.text = value,
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
              onPressed: () async {
                log('username ${usernameController.text}');
                final value = await getuserData(usernameController.text);
                if (value == true) {
                  final user = User(
                      username: usernameController.text,
                      password: passwordController.text);
                  await AuthenticationManager().setAuthenticatedUser(user);
                  userdata = user;
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const Navigationbar()),
                      (route) => false);
                } else {
                  const snackBar = SnackBar(
                    backgroundColor: kgoldlight,
                    content: Text('User not Found'),
                    duration: Duration(seconds: 2),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
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
