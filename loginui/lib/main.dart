
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'loginpage.dart';



void main(){ runApp(MyApp());}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
bool logged;
  
  @override
  Widget build(BuildContext context) {
  
    
    return MaterialApp(
    home:logged==true?MainPage():HomePage(),
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      fontFamily: "GoogleSans"
      
    ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: new AppBar(title: new Text("Welcome"),backgroundColor: Colors.deepPurple,),
     drawer:new Drawer(
       child: ListView(
         children: <Widget>[
           new ListTile(title: new Text("LogOut"),leading: Icon(Icons.close),onTap:() {
             
             Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){return HomePage();}));
             setState(() {
               
             });
             } 
             ),
         ],
       ),
     )
    );
  }
}
