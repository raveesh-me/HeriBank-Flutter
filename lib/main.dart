import 'package:flutter/material.dart';
import 'package:mobile_banking_system/src/widgets/home_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(),
      home: HomeScreen(),
    );
  }
}
