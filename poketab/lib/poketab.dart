import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'pokedata.dart';
import 'package:http/http.dart'as http;
import 'pokedetail.dart';

 class PokeTab extends StatefulWidget {
   final PokeData poki;

  const PokeTab({Key key, this.poki}) : super(key: key);
   @override
   _PokeTabState createState() => _PokeTabState();
 }
 
 class _PokeTabState extends State<PokeTab> {
   var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  PokeData pokeData;
  Color c1;
 

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);
    pokeData= PokeData.fromJson(decodedJson);
    print(pokeData.toJson());
    setState(() {});
  }
   colourchanger(){
     Color color=Colors.primaries[Random().nextInt(Colors.primaries.length)];
     
      c1=color; 
    
     return color;
     
   }
    

   @override
   Widget build(BuildContext context) {
     return Scaffold(
         body:(pokeData==null)?Center(child: CircularProgressIndicator()):ListView(
           children:pokeData.pokemon.map((poki)=>Padding(padding: EdgeInsets.all(0),child:InkWell(
              onTap:(){Navigator.push(context,MaterialPageRoute(builder:(context)=> PokeDetail(pokemon: poki,)));},
             child:Card(
             elevation: 10,color: colourchanger(),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
             child: Container(
               height: 100,
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
                   decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(poki.img,scale: 0.1))),
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
                         new Text("#"+poki.num+"  "+poki.name,style: TextStyle(color: Colors.black,fontFamily: "GoogleSans",fontSize:MediaQuery.of(context).size.height/37,),)
                           
                         ],
                       ),
                       new Padding(padding: EdgeInsets.all(2),), 
                       new Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: <Widget>[
                           new Padding(padding: EdgeInsets.only(left: 20,right: 0,top: 0,bottom: 0),),
                            FilterChip(shape: RoundedRectangleBorder(side:BorderSide(),borderRadius: BorderRadius.circular(5)) ,backgroundColor: c1,label: Text(poki.type.first,style: TextStyle(color:Colors.black,fontFamily: "GoogleSans",fontSize:MediaQuery.of(context).size.height/46),), onSelected: (bool value) {},padding: EdgeInsets.only(left:15,right: 15,),labelPadding: EdgeInsets.only(bottom: -4,left: 25,right: 25,top: -4),),
                           new Padding(padding: EdgeInsets.only(right:MediaQuery.of(context).size.width/20),),
                           (poki.type.first==poki.type.last)?Padding(padding: EdgeInsets.all(0),):FilterChip(shape:RoundedRectangleBorder(side:BorderSide(),borderRadius: BorderRadius.circular(5)),backgroundColor: c1,label: Text(poki.type.last,style: TextStyle(color: Colors.black,fontFamily: "GoogleSans",fontSize:MediaQuery.of(context).size.height/46),), onSelected: (bool value) {},padding: EdgeInsets.only(left:15,right: 15),labelPadding: EdgeInsets.only(top: -3,bottom: -3,left: 25,right: 25)), 

                         ],
                       )
                     ],
                   ),
                   new Padding(padding: EdgeInsets.only(right:MediaQuery.of(context).size.height/60),),
                 ],
               )
             ),
           )))).toList()
         )
       );
   }
 }


//pokeData.pokemon.map((poki)=>con()).toList(); 