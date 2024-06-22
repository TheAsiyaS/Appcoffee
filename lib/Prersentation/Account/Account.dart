import 'dart:developer';

import 'package:coffeeapp/Navigation.dart';
import 'package:coffeeapp/Prersentation/Sign_Ui/Sign_in_up.dart';
import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/Widgets/ConatinerText.dart';
import 'package:coffeeapp/db/Authentication/UserAuthentcatio.dart';
import 'package:coffeeapp/db/Dbfunction.dart';
import 'package:coffeeapp/db/Model/UserModel.dart';
import 'package:coffeeapp/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Account')),
        backgroundColor: kblack,
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: size.height / 5,
            width: size.width / 2,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'asset/logo/1.png',
                    ),
                    fit: BoxFit.cover)),
          ),
          Text('COFFEE HOUSE',
              style: GoogleFonts.playfairDisplay(
                  color: kbrownlight, fontSize: 30)),
          Text(
            'Hi ${userdata!.username},  Hope you enjoy our app . Hope you visit again to create new experinces .',
            style: const TextStyle(color: kGrey, fontSize: 15),
          ),
          SizedBox(
            height: size.height / 2.5,
            width: size.width,
            child: Card(
              color: const Color.fromARGB(94, 103, 103, 103),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      'Account Settings',
                      style: GoogleFonts.playfairDisplay(
                          color: kgoldlight, fontSize: 25),
                    ),
                  ),
                  const Divider(
                    color: kbrownlight,
                    endIndent: 20,
                    indent: 20,
                  ),
                  GestureDetector(
                      onTap: () async{
                        log('log out ');
                     await   AuthenticationManager().signOut();
                        userdata = User(username: '', password: '');
                        bottomIndex.value = 0;
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const Sign_in_up()),
                            (route) => false);
                      },
                      child: containerText(size: size, text: 'Sign Out')),
                  GestureDetector(
                      onTap: () async {
                        await deleteUser(userdata!.username);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const Sign_in_up()),
                            (route) => false);
                        bottomIndex.value = 0;
                      },
                      child: containerText(size: size, text: 'Delete Account')),
                  Text('Delete ${userdata!.username} permanently',
                      style: const TextStyle(color: kGrey, fontSize: 15))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
