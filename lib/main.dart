import 'package:flutter/material.dart';
import 'package:travel_hive/screens/welcome.dart';
import 'package:travel_hive/screens/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Welcome(),
      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) => RegisterForm(),
      },
    );
  }
}