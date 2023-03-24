import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_base/avtor.dart';
import 'package:flutter_application_base/home.dart';
import 'package:flutter_application_base/reg.dart';
import 'package:flutter_application_base/welcome.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'firebaseApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'avto': (context) => AvtoPage(),
        'reg': (context) => RegPage(),
        'welcome': (context) => WelcomePage(),
        
      },
    );
  }
}