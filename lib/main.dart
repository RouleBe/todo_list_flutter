import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do_list/auth/auth_page.dart';
import 'package:to_do_list/auth/main_page.dart';
import 'package:to_do_list/screen/SignUP.dart';
import 'package:to_do_list/screen/add_note_screen.dart';
import 'package:to_do_list/screen/home.dart';
import 'package:to_do_list/screen/login.dart';
import 'package:to_do_list/widgets/task_widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_Screen(),
    );
  }
}
