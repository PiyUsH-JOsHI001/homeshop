import 'package:flutter/material.dart';
import 'package:homeshop/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(order_screen());
}

class order_screen extends StatefulWidget {
  const order_screen({super.key});

  @override
  State<order_screen> createState() => _order_screenState();
}

class _order_screenState extends State<order_screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: home(),
    debugShowCheckedModeBanner: false,
    );
  }
}