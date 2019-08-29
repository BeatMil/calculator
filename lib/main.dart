import 'package:flutter/material.dart';

import './cal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.light,
        backgroundColor: Colors.red,
        appBarTheme: AppBarTheme(color: Colors.black87),
        textTheme: TextTheme(title: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white54)
      ),
      home: Calculator(),
    );
  }
}
//MyHomePage(title: 'Flutter Calculator')


