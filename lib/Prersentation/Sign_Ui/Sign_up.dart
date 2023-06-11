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
import 'package:google_fonts/google_fonts.dart';

class Sign_up extends StatelessWidget {
  const Sign_up({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isshow = ValueNotifier(false);
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController repasswordController = TextEditingController();
    return Column(
      children: [
        CupertinoTextField(
          placeholder: ' Username.....',
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
        h30,
        CupertinoTextField(
          placeholder: ' Conform Password.....',
          placeholderStyle: const TextStyle(color: kwhite),
          onSubmitted: (value) {
            repasswordController.text = value;

            if (passwordController.text != repasswordController.text) {
              const snackBar = SnackBar(
                backgroundColor: kgoldlight,
                content: Text('password is not match'),
                duration: Duration(seconds: 2),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          onChanged: (value) => repasswordController.text = value,
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
            onPressed: () async {
              final value = await addUserData(
                  usernameController.text, passwordController.text);
              if (value == true &&
                  passwordController.text == repasswordController.text) {
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
                  content: Text('Some Error ocuured!!'),
                  duration: Duration(seconds: 2), //12345
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
            child: Text('Sign Up',
                style: GoogleFonts.playfairDisplay(
                    fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}
