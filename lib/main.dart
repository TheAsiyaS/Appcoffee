import 'package:coffeeapp/Navigation.dart';
import 'package:coffeeapp/Prersentation/Sign_Ui/Sign_in_up.dart';
import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/db/Authentication/UserAuthentcatio.dart';
import 'package:coffeeapp/db/Dbfunction.dart';
import 'package:coffeeapp/db/Model/UserModel.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();

  runApp(const MyApp());
}

User? userdata;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }

  Future<void> getuser() async {
    final authuser = await AuthenticationManager().getAuthenticatedUser();
    setState(() {
      userdata = authuser;
    });
  }

//[{id: 1, username: usercoffee, password: 456789}, {id: 2, username: coffeedb, password: db}, {id: 3, username: asi, password: 89}]
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: kblack,
          brightness: Brightness.dark,
        ),
        home: userdata == null ? const Sign_in_up() : const Navigationbar());
  }
}

//

