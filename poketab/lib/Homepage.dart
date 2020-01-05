
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'poketab.dart';
import 'main.dart' as main;




class HomePage extends StatelessWidget {
  final bool darktheme;

  HomePage(this.darktheme) : super();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       drawer: Drawer(elevation: 0,child: ListView(
         children: <Widget>[
           new ListTile(
             title: Text("DarkTheme"),
             trailing: Switch(value: darktheme, onChanged: main.bloc.changeTheme),
           )
         ],
       ),),
       appBar: AppBar(
         leading: Builder(builder: (context) =>IconButton(
           icon:Icon(Icons.view_headline,color: (darktheme)?Colors.white:Colors.black,size: 27,), 
           onPressed: ()=> Scaffold.of(context).openDrawer()
         )
         ),
         elevation: 0,
         backgroundColor: Colors.transparent,
         ),
       floatingActionButton: FloatingActionButton(
         onPressed: () {
           
         },
         backgroundColor: Colors.red,
         highlightElevation: 20,
         elevation: 5,
         focusElevation: 12,
        child:  Image.asset("assets/images/pokeball.png"),   
         ),
       resizeToAvoidBottomInset: false,
       resizeToAvoidBottomPadding: false,
        // backgroundColor: Colors.white,
         body: new Container(
           
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height,
           child: new Column(
        children: <Widget>[
        new Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/40)),
        
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Which Pokemon Are You \nLooking For ?",style: TextStyle(fontSize:MediaQuery.of(context).size.height/22,fontWeight: FontWeight.bold,fontFamily: "GoogleSans"),)
          ],
        ),
        new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height/30),),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Center(
               child: Card(
                 elevation: 0,
                 color: Colors.black12,
                 shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                 child: Container(
                  
                   width: MediaQuery.of(context).size.width/1.16,
                   height: MediaQuery.of(context).size.height/17,
                   child: Center(
                     child: TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.search),hintText: "Search Pokemon,Ability,Type etc..",border: InputBorder.none,hintStyle: TextStyle(fontFamily: "GoogleSans",fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height/42),),
                     ),
                   ),
                 ),
               ),
             )
           ],
        ),
         new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height/30),),
         new Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
                InkWell(
                onTap:()=>{Navigator.of(context).push(MaterialPageRoute<Null>(builder:(BuildContext context){return PokeTab();}))},
                 child:  Card(
                 elevation: 10,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                 
                 child: Container(
                   
                   decoration: BoxDecoration(
                     borderRadius:  BorderRadius.circular(13),
                     image: DecorationImage(colorFilter: ColorFilter.mode(Colors.cyan,BlendMode.color),image: AssetImage("assets/images/334ed889d7448c4c1e0829e19f0894f1.jpg"),fit: BoxFit.cover)),
                    width: MediaQuery.of(context).size.width/3,
                    height: MediaQuery.of(context).size.height/12,
                    child: Center(child: new Text("\n\nPokeTab",style: TextStyle(fontSize:MediaQuery.of(context).size.height/40,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "GoogleSans"),)),
                 ),
               ),
             ),
              new Card(
               elevation: 10,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
               color: Colors.blueAccent,
               child: Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.height/12,
                  child: Center(child: new Text("Items",style: TextStyle(fontSize:MediaQuery.of(context).size.height/40,fontWeight: FontWeight.bold,color: Colors.white70,fontFamily: "GoogleSans"),)),
               ),
             )
           ],
         ),
         new Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
             new Card(
               elevation: 10,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
               color: Colors.pinkAccent,
               child: Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.height/12,
                  child: Center(child: new Text("Locations",style: TextStyle(fontSize:MediaQuery.of(context).size.height/40,fontWeight: FontWeight.bold,color: Colors.white70,fontFamily: "GoogleSans"),)),
               ),
             ),
              new Card(
               elevation: 10,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
               color: Colors.cyan,
               child: Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.height/12,
                  child: Center(child: new Text("Abilities",style: TextStyle(fontSize:MediaQuery.of(context).size.height/40,fontWeight: FontWeight.bold,color: Colors.white70,fontFamily: "GoogleSans"),)),
               ),
             )
           ],
         ),
         new Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
             new Card(
               elevation: 10,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
               color: Colors.blueGrey,
               child: Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.height/12,
                  child: Center(child: new Text("TypeChart",style: TextStyle(fontSize:MediaQuery.of(context).size.height/40,fontWeight: FontWeight.bold,color: Colors.white70,fontFamily: "GoogleSans"),)),
               ),
             ),
              new Card(
               elevation: 10,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
               color: Colors.deepPurple,
               child: Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.height/12,
                  child: Center(child: new Text("Moves",style: TextStyle(fontSize:MediaQuery.of(context).size.height/40,fontWeight: FontWeight.bold,color: Colors.white70,fontFamily: "GoogleSans"),)),
               ),
             )
           ],
         ),
         new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height/30),),
          new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/30),),
            new Text("Your Recently viewed",style: TextStyle(fontSize:MediaQuery.of(context).size.height/30,fontWeight: FontWeight.bold,fontFamily: "GoogleSans"),)
          ],
        ),
        new SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                 width: MediaQuery.of(context).size.width/1.1,
                 height: MediaQuery.of(context).size.height/6,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    new Card(
               elevation: 0,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
               color: Colors.cyan,
               child: Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(13),
                   image: DecorationImage(image: AssetImage("assets/images/033e2a2912f129e645d65fd95f16041c.jpg"),fit: BoxFit.fill)
                 ),
                  width: MediaQuery.of(context).size.width/2.34,
                  height: MediaQuery.of(context).size.height/7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text("Pikachu",style: TextStyle(fontSize:MediaQuery.of(context).size.height/40,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: "GoogleSans"),)
                    ],
                  )
               ),
             ),
             new Card(
               elevation: 0,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
               color: Colors.cyan,
               child: Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(13),
                   image: DecorationImage(image: AssetImage("assets/images/012737df6ee592b122ad34fa8605275d.jpg"),fit: BoxFit.fill)
                 ),
                  width: MediaQuery.of(context).size.width/2.34,
                  height: MediaQuery.of(context).size.height/7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text("Bulbasaur",style: TextStyle(fontSize:MediaQuery.of(context).size.height/40,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: "GoogleSans"),)
                    ],
                  )
               ),
             ),
             new Card(
               elevation: 0,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
               color: Colors.cyan,
               child: Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(13),
                   image: DecorationImage(image: AssetImage("assets/images/39b11b924863a45c1c9d4c82d825b85c.jpg"),fit: BoxFit.fill)
                 ),
                  width: MediaQuery.of(context).size.width/2.34,
                  height: MediaQuery.of(context).size.height/7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text("Squirtle",style: TextStyle(fontSize:MediaQuery.of(context).size.height/40,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: "GoogleSans"),)
                    ],
                  )
               ),
             )
                  ],
                ),
              )
            ],
          ),
        )
      ],
           ),
         ),
       );
  }
}