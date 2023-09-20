import 'package:flutter/material.dart';
import 'package:to_do_list/screen/SignUP.dart';
import 'package:to_do_list/screen/home.dart';
import 'package:to_do_list/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp_Screen(),
    );
  }
}
