import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'consts/styles.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
late Size mq ;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent,titleTextStyle: TextStyle(color: Colors.black),iconTheme: IconThemeData(color: Colors.black)),
        // fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}

