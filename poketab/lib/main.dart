import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:poketab/Homepage.dart';
import 'poketab.dart';
import 'pokedetail.dart';
import 'dart:async';


void main()=> runApp(MyApp());
class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
       return StreamBuilder(
         initialData: false,
         stream: bloc.isenabled,
         builder: (context, snapshot) {
           return MaterialApp(
             home: HomePage(snapshot.data),
             debugShowCheckedModeBanner: false,
             theme: (snapshot.data)?ThemeData.dark():ThemeData.light(),
           );
         },);
  }
}



class Bloc{
final tcontroller = StreamController<bool>();
get changeTheme =>tcontroller.sink.add;
get isenabled =>tcontroller.stream;
}
final bloc= Bloc();