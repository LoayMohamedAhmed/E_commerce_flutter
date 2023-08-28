import 'package:ecommerce/Pages/pre_signin.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Pages/login.dart';
import 'pages/Initial_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:home(),
    );
  }
}

