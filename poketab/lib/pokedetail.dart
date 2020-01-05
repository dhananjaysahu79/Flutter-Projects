import 'package:flutter/material.dart';
import 'pokedata.dart';
import 'poketab.dart';
import 'dart:math';
import 'package:matcher/matcher.dart';
Color c1;
String s;
int i;


class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;
  const PokeDetail({Key key, this.pokemon}) : super(key: key);
  

  colourchanger(){
     Color color=Colors.primaries[Random().nextInt(Colors.primaries.length)];
     
      c1=color; 
       s= pokemon.weaknesses.last;
     i= pokemon.weaknesses.indexOf(s)+1;
    
     return color;
     
   }

   weaknessindex(){
     s= pokemon.weaknesses.last;
     i= pokemon.weaknesses.indexOf(s)+1;
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
              child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height/57),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
               elevation: 10,color: colourchanger(),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
               child: Container(
                 height: 100,
                 width: MediaQuery.of(context).size.width/1.04,
                 child: Row( 
                   children: <Widget>[ 
                     Container( 
                       height: 100,
                       width:80,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.only(topRight: Radius.circular(65),bottomRight: Radius.circular(65),topLeft: Radius.circular(13),bottomLeft: Radius.circular(13)),
                         shape: BoxShape.rectangle,
                         color: Color.fromRGBO(252, 251, 227, 0.4),
                       ),
                   child:Container(
                     height: 10,width: 10,
                     decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(pokemon.img,scale: 0.1))),
                   )
                     ),
                     new Padding(padding: EdgeInsets.only(left:MediaQuery.of(context).size.height/40),),
                     Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height/90),),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget>[
                           new Text("#"+pokemon.num+"  "+pokemon.name,style: TextStyle(color: Colors.black,fontFamily: "GoogleSans",fontSize:MediaQuery.of(context).size.height/37,),)
                             
                           ],
                         ),
                         new Padding(padding: EdgeInsets.all(2),), 
                         new Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: <Widget>[
                             new Padding(padding: EdgeInsets.only(left: 20,right: 0,top: 0,bottom: 0),),
                              FilterChip(shape: RoundedRectangleBorder(side:BorderSide(),borderRadius: BorderRadius.circular(5)) ,backgroundColor: c1,label: Text(pokemon.type.first,style: TextStyle(color:Colors.black,fontFamily: "GoogleSans",fontSize:MediaQuery.of(context).size.height/46),), onSelected: (bool value) {},padding: EdgeInsets.only(left:15,right: 15,),labelPadding: EdgeInsets.only(bottom: -4,left: 25,right: 25,top: -4),),
                             new Padding(padding: EdgeInsets.only(right:MediaQuery.of(context).size.width/20),),
                             (pokemon.type.first==pokemon.type.last)?Padding(padding: EdgeInsets.all(0),):FilterChip(shape: RoundedRectangleBorder(side:BorderSide(),borderRadius: BorderRadius.circular(5)),backgroundColor: c1,label: Text(pokemon.type.last,style: TextStyle(color: Colors.black,fontFamily: "GoogleSans",fontSize:MediaQuery.of(context).size.height/46),), onSelected: (bool value) {},padding: EdgeInsets.only(left:15,right: 15),labelPadding: EdgeInsets.only(top: -3,bottom: -3,left: 25,right: 25)), 

                           ],
                         ),
                        
                       ],
                     ),
                     new Padding(padding: EdgeInsets.only(right:MediaQuery.of(context).size.height/60),),
                   ],
                 )
               ),
             )
                ],
              ),
               new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height/120),),
              Center(child: new Text("Species",style: TextStyle(fontFamily: "GoogleSans",fontSize: 20),)),
              new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height/120),),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height:  MediaQuery.of(context).size.width/1.12,
                      width: MediaQuery.of(context).size.width/1.04,
                      child: Column( 
                                      
                        children: <Widget>[
                          new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height/90),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FilterChip(backgroundColor: Colors.white,shape: RoundedRectangleBorder(side:BorderSide(),borderRadius: BorderRadius.circular(5)),label: Text(pokemon.height,style: TextStyle(color: Colors.black,fontFamily: "GooglSans"),), onSelected: (bool value) {},padding: EdgeInsets.only(bottom:-8,top:-8,left:15,right: 15,),labelPadding: EdgeInsets.only(bottom: -4,left: 25,right: 25,top: -4)),
                              FilterChip(backgroundColor: Colors.white,shape: RoundedRectangleBorder(side:BorderSide(),borderRadius: BorderRadius.circular(5)),label: Text(pokemon.weight,style: TextStyle(color: Colors.black,fontFamily: "GooglSans"),), onSelected: (bool value) {},padding: EdgeInsets.only(left:15,right: 15,),labelPadding: EdgeInsets.only(bottom: -4,left: 25,right: 25,top: -4))
                            ],
                          ),
                         
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Height",style: TextStyle(fontFamily: "GoogleSans",color: Colors.black),),
                              new Padding(padding: EdgeInsets.only(right:MediaQuery.of(context).size.width/3),),
                              Text("Weight",style: TextStyle(fontFamily: "GoogleSans",color: Colors.black),)
                            ],
                          ),
                          new Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/50),),
                          Row(
                            children: <Widget>[
                              Text("     Candy                     : "+pokemon.candy,style: TextStyle(fontFamily: "GoogleSans",color: Colors.black,fontSize: 17))
                            ],
                          ),
                          Divider(color: c1,),
                          Row(
                            children: <Widget>[
                              Text("     Spawn Chance     : "+pokemon.spawnChance,style: TextStyle(fontFamily: "GoogleSans",color: Colors.black,fontSize: 17))
                            ],
                          ),
                          Divider(color: c1,),
                          Row(
                            children: <Widget>[
                              Text("     Spawn Time           : "+pokemon.spawnTime,style: TextStyle(fontFamily: "GoogleSans",color: Colors.black,fontSize: 17))
                            ],
                          ),
                          Divider(color: c1,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("     Egg                           : "+pokemon.egg,style: TextStyle(fontFamily: "GoogleSans",color: Colors.black,fontSize: 17)),                  
                            ],
                          ),
                          Divider(color: c1,),
                          Row(
                            children: <Widget>[
                              Text("     Average Spawns  : ",style: TextStyle(fontFamily: "GoogleSans",color: Colors.black,fontSize: 17)),
                              FilterChip(backgroundColor: c1,label: Text("  ",style: TextStyle(fontSize: 0),), onSelected: (bool value) {},labelPadding: EdgeInsets.only(top:-11,bottom:-11,right:  double.parse(pokemon.avgSpawns)>200?200: double.parse(pokemon.avgSpawns)),),
                              Text("  "+pokemon.avgSpawns.toString(),style: TextStyle(fontFamily: "GoogleSans",color: Colors.black),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("     Candy Count        : ",style: TextStyle(fontFamily: "GoogleSans",color: Colors.black,fontSize: 17)),
                              FilterChip(backgroundColor: c1,label: Text("  ",style: TextStyle(fontSize: 0),), onSelected: (bool value) {},labelPadding: EdgeInsets.only(top:-11,bottom:-11,right:(pokemon.candyCount==null)?0.0: pokemon.candyCount*1.5 ),),
                              Text("  "+pokemon.candyCount.toString(),style: TextStyle(fontFamily: "GoogleSans",color: Colors.black),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("     Weakness             : ",style: TextStyle(fontFamily: "GoogleSans",color: Colors.black,fontSize: 17)),
                              FilterChip(backgroundColor: c1,label: Text("  ",style: TextStyle(fontSize: 0),), onSelected: (bool value) {},labelPadding: EdgeInsets.only(top:-11,bottom:-11,right:i*40.0 ),),
                              Text("  $i",style: TextStyle(fontFamily: "GoogleSans",color: Colors.black),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height/120),),
              Center(child: new Text("Weakness",style: TextStyle(fontFamily: "GoogleSans",fontSize: 20),)),
              new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height/120),),
              Card(
                color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height:  MediaQuery.of(context).size.width/3.4,
                      width: MediaQuery.of(context).size.width/1.04,
                      child: 
                         GridView.count(
                           childAspectRatio: 5,
                           children: pokemon.weaknesses.map((f)=>FilterChip(
                             avatarBorder: CircleBorder(),
                             avatar: DecoratedBox(
                               child: Icon(Icons.close,color:Colors.black),
                               
                               decoration: BoxDecoration(
                                 color: c1,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomLeft: Radius.circular(4))
                             ),),
                         backgroundColor: Colors.white,
                         shape: RoundedRectangleBorder(side:BorderSide(),borderRadius: BorderRadius.circular(5))
                         ,label: Text(f,style: TextStyle(color: Colors.black,fontFamily: "GooglSans"),), 
                         onSelected: (bool value) {},
                         padding: EdgeInsets.only(bottom:-8,top:-8,left:-8,right: 25,),
                         labelPadding: EdgeInsets.only(bottom: -4,left:15,right: 15,top: -4)),).toList(), crossAxisCount: 2,
                         ),
                    )
              ),              
            ],
          ),
        ),
      ),
    );
  }
}