import 'package:flutter/material.dart';
import 'details.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   String text = "Popular";
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     // backgroundColor: Color.fromARGB(255, 18, 15, 42),
      body:Column(
            children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/4.5,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)),
         //color: Colors.deepPurple
         gradient: LinearGradient(
                  stops: [0,0.9],
                  begin: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 88, 77, 182),
                   // Color.fromARGB(255, 86, 155, 248)
                   Colors.pink
                  ]
                )
        ),
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(20),),
            Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
       Center(
           child: Card(
             elevation: 0,
             color: Colors.white,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
             child: Container(
      
       width: MediaQuery.of(context).size.width/1.16,
       height: MediaQuery.of(context).size.height/17,
       child: Center(
         child: TextField(
           decoration: InputDecoration(
             prefixIcon: Icon(Icons.search),
             hintText: "Search Movies,Series etc..",
             border: InputBorder.none,
             hintStyle: TextStyle(
               color: Colors.black38,
               fontWeight: FontWeight.bold,
               fontSize: MediaQuery.of(context).size.height/41)
               ,),
         ),
       ),
             ),
           ),
         )
      ],
            ),Padding(padding: EdgeInsets.all(10),),
            Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FilterChip(
          backgroundColor: Colors.white10,
          disabledColor: Colors.orange,
          selectedColor: Colors.orange,
          selected: text=="Popular",
          label: Text("Popular"), 
          onSelected: (bool value) {
            setState(() {
             text="Popular" ;
            });
          },),
          FilterChip(
          backgroundColor: Colors.white10,
          disabledColor: Colors.orange,
          selectedColor: Colors.orange,
          selected: text=="Trending",
          label: Text("Trending"), 
          onSelected: (bool value) {
            setState(() {
             text="Trending" ;
             value=true;
            });
          },),
          FilterChip(
          backgroundColor: Colors.white10,
          disabledColor: Colors.orange,
          selectedColor: Colors.orange,
          selected: text=="Recent",
          label: Text("Recent"), 
          onSelected: (bool value) {
            setState(() {
             text="Recent" ;
            });
          },),
          Padding(padding: EdgeInsets.only(right: 45),),
      ],
            )
          ],
        )
        ),
       Row(
         children: <Widget>[
           Padding(padding: EdgeInsets.only(left: 25,top: 60),),
           Text(text,
           style:TextStyle(
             color:Colors.black,              
             fontSize: 22
           )
           )
         ],
       ),
       Container(
         child: Expanded(
            child: ListView(
             //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
              InkWell(
                onTap:(){Navigator.push(context,MaterialPageRoute(builder:(context)=> MovieDetails(0)));},
                child: Card(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
               elevation: 1,
               child: Container(
                 height: MediaQuery.of(context).size.height/6,
                 width: MediaQuery.of(context).size.width/1.07,
                 child: Row(
                   children: <Widget>[
                     Padding(padding: EdgeInsets.only(left:10),),
                     Container(
                       height: MediaQuery.of(context).size.height/7,
                       width: MediaQuery.of(context).size.height/7,
                       decoration: BoxDecoration(
                         borderRadius:  BorderRadius.all(Radius.circular(13)),
                         image: DecorationImage(
                           image: AssetImage("assets/images/joker.jpg"),
                           fit: BoxFit.cover
                           )
                       ),
                     ),
                     Padding(padding: EdgeInsets.only(left:28),),
                     Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Row(
                             
                             children: <Widget>[
                                Padding(padding: EdgeInsets.only(top:20,left: 218),),
                                Icon(Icons.more_horiz,color:Colors.black54,size:18),
                             ],
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: <Widget>[
                               //Padding(padding: EdgeInsets.only(left:24),),
                               Text("Joker(2019)",
                                style: TextStyle(
                                  fontSize: 20
                                ),
                               ),

                             ],
                           ),
                           Padding(padding: EdgeInsets.only(top: 5),),
                           Row(
                             children: <Widget>[
                               Icon(Icons.star,color:Colors.green,size:18),
                               Icon(Icons.star,color:Colors.green,size:18),
                               Icon(Icons.star,color:Colors.green,size:18),
                               Icon(Icons.star,color:Colors.green,size:18),
                               Icon(Icons.star_half,color:Colors.green,size:18)
                             ],
                           ),
                           Padding(padding: EdgeInsets.only(top: 35),),
                           Row(
                             children: <Widget>[                                       
                               Icon(Icons.file_download,color:Colors.black,size:12),
                               Text("  2900",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38
                                ),
                               ),
                               Padding(padding: EdgeInsets.only(left:28),),
                               Icon(Icons.favorite,color:Colors.red,size:12),
                               Text("  1500",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38
                                ),
                               ),
                                Padding(padding: EdgeInsets.only(left:28),),
                               Icon(Icons.comment,color:Colors.black,size:12),
                               Text("  23",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38
                                ),
                               ),
                             ],
                           )
                         ],
                       ),
                     )
                   ],
                 ),

               ),
             ),
           )
         ],
       ),
         Padding(padding: EdgeInsets.only(top:28),),
         Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           InkWell(
              onTap:(){Navigator.push(context,MaterialPageRoute(builder:(context)=> MovieDetails(1)));},
             child: Card(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
               elevation: 1,
               child: Container(
                 height: MediaQuery.of(context).size.height/6,
                 width: MediaQuery.of(context).size.width/1.07,
                 child: Row(
                   children: <Widget>[
                     Padding(padding: EdgeInsets.only(left:10),),
                     Container(
                       height: MediaQuery.of(context).size.height/7,
                       width: MediaQuery.of(context).size.height/7,
                       decoration: BoxDecoration(
                         borderRadius:  BorderRadius.all(Radius.circular(13)),
                         image: DecorationImage(
                           image: AssetImage("assets/images/avengers.jpg"),
                           fit: BoxFit.cover
                           )
                       ),
                     ),
                     Padding(padding: EdgeInsets.only(left:28),),
                     Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Row(
                             
                             children: <Widget>[
                                Padding(padding: EdgeInsets.only(top:20,left: 218),),
                                Icon(Icons.more_horiz,color:Colors.black54,size:18),
                             ],
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: <Widget>[
                               //Padding(padding: EdgeInsets.only(left:24),),
                               Text("Avengers-Endgame",
                                style: TextStyle(
                                  fontSize: 20
                                ),
                               ),

                             ],
                           ),
                           Padding(padding: EdgeInsets.only(top: 5),),
                           Row(
                             children: <Widget>[
                               Icon(Icons.star,color:Colors.green,size:18),
                               Icon(Icons.star,color:Colors.green,size:18),
                               Icon(Icons.star,color:Colors.green,size:18),
                               Icon(Icons.star,color:Colors.green,size:18),
                               Icon(Icons.star_half,color:Colors.green,size:18)
                             ],
                           ),
                           Padding(padding: EdgeInsets.only(top: 35),),
                           Row(
                             children: <Widget>[                                       
                               Icon(Icons.file_download,color:Colors.black,size:12),
                               Text("  4531",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38
                                ),
                               ),
                               Padding(padding: EdgeInsets.only(left:28),),
                               Icon(Icons.favorite,color:Colors.red,size:12),
                               Text("  3121",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38
                                ),
                               ),
                                Padding(padding: EdgeInsets.only(left:28),),
                               Icon(Icons.comment,color:Colors.black,size:12),
                               Text("  173",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38
                                ),
                               ),
                             ],
                           )
                         ],
                       ),
                     )
                   ],
                 ),

               ),
             ),
           )
         ],
       ),
        Padding(padding: EdgeInsets.only(top:28),),
        Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           InkWell(
              onTap:(){Navigator.push(context,MaterialPageRoute(builder:(context)=> MovieDetails(2)));},
               child: Card(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
               elevation: 1,
               child: Container(
                 height: MediaQuery.of(context).size.height/6,
                 width: MediaQuery.of(context).size.width/1.07,
                 child: Row(
                   children: <Widget>[
                     Padding(padding: EdgeInsets.only(left:10),),
                     Container(
                       height: MediaQuery.of(context).size.height/7,
                       width: MediaQuery.of(context).size.height/7,
                       decoration: BoxDecoration(
                         borderRadius:  BorderRadius.all(Radius.circular(13)),
                         image: DecorationImage(
                           image: AssetImage("assets/images/hobs.jpg"),
                           fit: BoxFit.cover
                           )
                       ),
                     ),
                     Padding(padding: EdgeInsets.only(left:28),),
                     Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Row(
                             
                             children: <Widget>[
                                Padding(padding: EdgeInsets.only(top:20,left: 218),),
                                Icon(Icons.more_horiz,color:Colors.black54,size:18),
                             ],
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: <Widget>[
                               //Padding(padding: EdgeInsets.only(left:24),),
                               Text("Hobbs & Shaw",
                                style: TextStyle(
                                  fontSize: 20
                                ),
                               ),

                             ],
                           ),
                           Padding(padding: EdgeInsets.only(top: 5),),
                           Row(
                             children: <Widget>[
                               Icon(Icons.star,color:Colors.green,size:18),
                               Icon(Icons.star,color:Colors.green,size:18),
                               Icon(Icons.star,color:Colors.green,size:18),
                               Icon(Icons.star,color:Colors.green,size:18),
                               Icon(Icons.star_border,color:Colors.green,size:18)
                             ],
                           ),
                           Padding(padding: EdgeInsets.only(top: 35),),
                           Row(
                             children: <Widget>[                                       
                               Icon(Icons.file_download,color:Colors.black,size:12),
                               Text("  2100",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38
                                ),
                               ),
                               Padding(padding: EdgeInsets.only(left:28),),
                               Icon(Icons.favorite,color:Colors.red,size:12),
                               Text("  500",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38
                                ),
                               ),
                                Padding(padding: EdgeInsets.only(left:28),),
                               Icon(Icons.comment,color:Colors.black,size:12),
                               Text("  20",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38
                                ),
                               ),
                             ],
                           )
                         ],
                       ),
                     )
                   ],
                 ),

               ),
             ),
           )
         ],
       ),
         Padding(padding: EdgeInsets.only(top:28),),
         Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           InkWell(
              onTap:(){Navigator.push(context,MaterialPageRoute(builder:(context)=> MovieDetails(3)));},
                child: Card(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
               elevation: 1,
               child: Container(
                 height: MediaQuery.of(context).size.height/6,
                 width: MediaQuery.of(context).size.width/1.07,
                 child: Row(
                   children: <Widget>[
                     Padding(padding: EdgeInsets.only(left:10),),
                     Container(
                       height: MediaQuery.of(context).size.height/7,
                       width: MediaQuery.of(context).size.height/7,
                       decoration: BoxDecoration(
                         borderRadius:  BorderRadius.all(Radius.circular(13)),
                         image: DecorationImage(
                           image: AssetImage("assets/images/alita.jpg"),
                           fit: BoxFit.cover
                           )
                       ),
                     ),
                     Padding(padding: EdgeInsets.only(left:28),),
                     Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Row(
                             
                             children: <Widget>[
                                Padding(padding: EdgeInsets.only(top:20,left: 218),),
                                Icon(Icons.more_horiz,color:Colors.black54,size:18),
                             ],
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: <Widget>[
                               //Padding(padding: EdgeInsets.only(left:24),),
                               Text("Alita-Battle Angel",
                                style: TextStyle(
                                  fontSize: 20
                                ),
                               ),

                             ],
                           ),
                           Padding(padding: EdgeInsets.only(top: 5),),
                           Row(
                             children: <Widget>[
                               Icon(Icons.star,color:Colors.green,size:18),
                               Icon(Icons.star,color:Colors.green,size:18),
                               Icon(Icons.star,color:Colors.green,size:18),
                               Icon(Icons.star_half,color:Colors.green,size:18),
                               Icon(Icons.star_border,color:Colors.green,size:18)
                             ],
                           ),
                           Padding(padding: EdgeInsets.only(top: 35),),
                           Row(
                             children: <Widget>[                                       
                               Icon(Icons.file_download,color:Colors.black,size:12),
                               Text("  900",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38
                                ),
                               ),
                               Padding(padding: EdgeInsets.only(left:28),),
                               Icon(Icons.favorite,color:Colors.red,size:12),
                               Text("  150",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38
                                ),
                               ),
                                Padding(padding: EdgeInsets.only(left:28),),
                               Icon(Icons.comment,color:Colors.black,size:12),
                               Text("  28",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38
                                ),
                               ),
                             ],
                           )
                         ],
                       ),
                     )
                   ],
                 ),

               ),
             ),
           )
         ],
       )
             ],
             
           ),
         ),
       )
            ],
          )
    );
  }
}