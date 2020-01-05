import 'package:flutter/material.dart';
import 'package:mubhi/details.dart';
import 'player.dart';
void main()=> runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Montserrat"
      ),
    );
  }
}