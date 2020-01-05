import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: HomePage(),
        title: 'Timer',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
      )
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    int counter=0;
    int min=0;
    int sec=0,hrs=0;
    bool exit=false;
    Timer timer;
    @override
    void initState() { 
      super.initState();
      sec=0;
                   min=0;
                   hrs=0;
                   counter=0; 
                   exit=false;
    }
  Future clock()async{
    while(exit==false){
     await Future.delayed(const Duration(milliseconds: 30), (){ 
        counter+=3; 
       setState(() {
         if(counter==90){
           sec++;
           counter=0;
         }
        if(sec==60){
            min++;
            sec=0;
        }
        if (min==60){hrs++;
        sec=0;
        min=0;}
      });
      }); 
    }
   }
   
  




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Timer"),backgroundColor: Colors.deepPurple,),
      body: new Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/6,),),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Card(
                  color: Colors.white,
                 child: Container(
                   height: MediaQuery.of(context).size.height/3.5,
                   width:MediaQuery.of(context).size.width/1.1,
                   child: Center(child: new Text("$hrs:$min:$sec:$counter",style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width/6 ),))
                 ),
                )
              ],
            ),
            new Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/8.5,),),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(onPressed: () {
                  exit=false;
                  clock();
                },child: new Text("Start"),),
              new RaisedButton(onPressed: () {
                setState(() {
                 exit=true; 
                 
                });
              },child: new Text("Stop"),),
             
              new RaisedButton(onPressed: () {
                  setState(() {
                   sec=0;
                   min=0;
                   hrs=0;
                   counter=0; 
                   exit=true;
                  });
                },child: new Text("Refresh"),),
              ],
            )
            
          ],
        ),
      ),

    );
  }
}
