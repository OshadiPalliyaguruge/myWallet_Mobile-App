import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_wallet/screens/homePage.dart';

import 'firebase_options.dart';

Future<void> main() async {
  runApp(const MyApp());

  // Initialize Firebase asynchronously
//await keyword ensures that the application will wait for Firebase initialization to complete before proceeding.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}