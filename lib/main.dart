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

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kblack,
        brightness: Brightness.dark,
      ),
      home: FutureBuilder<User?>(
        future: AuthenticationManager().getAuthenticatedUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            final authenticatedUser = snapshot.data;
            if (authenticatedUser != null) {
              return const Navigationbar();
            } else {
              return const Sign_in_up();
            }
          }
        },
      ),
    );
  }
}
//

