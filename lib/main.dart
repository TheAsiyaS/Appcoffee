import 'package:coffeeapp/Prersentation/Sign_Ui/Sign_in_up.dart';
import 'package:coffeeapp/Utensils/Common_colors.dart';
import 'package:coffeeapp/db/Dbfunction.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();
  await initializedDatabase();
  await initializesDatabase();
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
      home: const Sign_in_up(),
    );
  }
}
// 