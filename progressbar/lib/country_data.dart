import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import'dart:async';
import 'package:http/http.dart'as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';

class CountryData extends StatefulWidget {
  CountryData({Key key}) : super(key: key);

  _CountryDataState createState() => _CountryDataState();
}

class _CountryDataState extends State<CountryData> {
  TextEditingController t1 =TextEditingController();
   var url ="56ea943804a332dfedff52ba6de1543a";
   var loc="jamshedpur";
   var decodedJson;
   var humidity;
   var wind;
   var sunset;
   var sunrise;
   var temp;
   var type;
   var temp_min;
   var temp_max;
   var location;
   var decodedJson2;
   var day1;
   var sday1;
   var sday2;
   var sday3;
   var sday4;
   var sday5;
   var day5;
   var date1;
   var date5;
   var month1;
   var month5;
   List<String> dailymin_temp=new List(5);
   List<String> dailymax_temp=new List(5);


   @override
  void initState() {
    super.initState();

    fetchData();
    fetchForecastData();
  }

  Future fetchData() async {
    var res = await http.get(Uri.encodeFull("https://api.openweathermap.org/data/2.5/weather?q=$loc&units=imperial&appid=56ea943804a332dfedff52ba6de1543a"),
   headers: {"results":"application/json"}
    );
    decodedJson = jsonDecode(res.body);
    setState(() {
     type=decodedJson["weather"][0]["description"];
     temp=decodedJson["main"]["temp"];
     temp=tempConverter(temp);
     humidity=decodedJson["main"]["humidity"];
     temp_min=decodedJson["main"]["temp_min"];
     temp_min=tempConverter(temp_min);
     temp_max=decodedJson["main"]["temp_max"];
     temp_max=tempConverter(temp_max);
     wind=decodedJson["wind"]["speed"];
     location=decodedJson["name"];
     sunrise=decodedJson["sys"]["sunrise"];
     sunset=decodedJson["sys"]["sunset"];
    
    });
  }

   Future fetchForecastData() async {
    var res1 = await http.get(Uri.encodeFull("http://api.openweathermap.org/data/2.5/forecast?q=$loc&units=imperial&mode=json&appid=56ea943804a332dfedff52ba6de1543a"),
   headers: {"results":"application/json"}
    );
    decodedJson2 = jsonDecode(res1.body);
    setState(() {
      var format1 =DateFormat("d");
      var format2 =DateFormat("MMM");
      var format3=DateFormat("EEEE");
      var format4=DateFormat("EEE");
      date1=format1.format(DateTime.fromMillisecondsSinceEpoch(decodedJson2["list"][1]["dt"] * 1000));
      date5=format1.format(DateTime.fromMillisecondsSinceEpoch(decodedJson2["list"][33]["dt"] * 1000));
      month1=format2.format(DateTime.fromMillisecondsSinceEpoch(decodedJson2["list"][1]["dt"] * 1000));
      month5=format2.format(DateTime.fromMillisecondsSinceEpoch(decodedJson2["list"][33]["dt"] * 1000));
      day1=format3.format(DateTime.fromMillisecondsSinceEpoch(decodedJson2["list"][1]["dt"] * 1000));
      day5=format3.format(DateTime.fromMillisecondsSinceEpoch(decodedJson2["list"][33]["dt"] * 1000));
      sday1=format4.format(DateTime.fromMillisecondsSinceEpoch(decodedJson2["list"][1]["dt"] * 1000)).toUpperCase();
      sday2=format4.format(DateTime.fromMillisecondsSinceEpoch(decodedJson2["list"][9]["dt"] * 1000)).toUpperCase();
      sday3=format4.format(DateTime.fromMillisecondsSinceEpoch(decodedJson2["list"][17]["dt"] * 1000)).toUpperCase();
      sday4=format4.format(DateTime.fromMillisecondsSinceEpoch(decodedJson2["list"][25]["dt"] * 1000)).toUpperCase();
      sday5=format4.format(DateTime.fromMillisecondsSinceEpoch(decodedJson2["list"][33]["dt"] * 1000)).toUpperCase();
      dailymin_temp[0]=tempConverter(decodedJson2["list"][1]["main"]["temp_min"]).toString();
      dailymin_temp[1]=tempConverter(decodedJson2["list"][9]["main"]["temp_min"]).toString();
      dailymin_temp[2]=tempConverter(decodedJson2["list"][17]["main"]["temp_min"]).toString();
      dailymin_temp[3]=tempConverter(decodedJson2["list"][25]["main"]["temp_min"]).toString();
      dailymin_temp[4]=tempConverter(decodedJson2["list"][33]["main"]["temp_min"]).toString();
      dailymax_temp[0]=tempConverter(decodedJson2["list"][4]["main"]["temp_max"]).toString();
      dailymax_temp[1]=tempConverter(decodedJson2["list"][13]["main"]["temp_max"]).toString();
      dailymax_temp[2]=tempConverter(decodedJson2["list"][21]["main"]["temp_max"]).toString();
      dailymax_temp[3]=tempConverter(decodedJson2["list"][29]["main"]["temp_max"]).toString();
      dailymax_temp[4]=tempConverter(decodedJson2["list"][37]["main"]["temp_max"]).toString();
    });
  }

 tempConverter(var t){
     t=5/9*(t-32);
     t=t.round()+1;
     return t;
 }

 search(){
 setState(() {
   loc=t1.text.toString();
   print(loc);
   fetchData();
   fetchForecastData();
   t1.text="";
 });
 }
String readTimestamp(int timestamp) {
    var now = new DateTime.now();
    var format = new DateFormat('HH:mm a');
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' DAY AGO';
      } else {
        time = diff.inDays.toString() + ' DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
      } else {

        time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
      }
    }

    return time;
  }




  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent), 
      child: decodedJson==null?Center(child:CircularProgressIndicator()):Scaffold(
    body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/82),),
          Row(
            children: <Widget>[
                    Container(
                  color: Colors.white.withOpacity(0),
                  height: MediaQuery.of(context).size.height/8,
                  width: MediaQuery.of(context).size.width,
                  child:Center(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                               Card(
             elevation: 10,
             color: Colors.black54,
             //color: Color.fromARGB(255, 16, 19, 20),
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
             child: Container(
      
           width: MediaQuery.of(context).size.width/1.4,
            height: MediaQuery.of(context).size.height/17,
            child: Center(
             child: TextField(
               controller: t1,   onSubmitted: search(),           
               style: TextStyle(color: Colors.white),
           decoration: InputDecoration(
             prefixIcon: Icon(Icons.search,color: Colors.white,),
             hintText: "Search Location..",
             labelStyle: TextStyle(color: Colors.white),
             border: InputBorder.none,
             hintStyle: TextStyle(
                 color: Colors.white,
                 //fontWeight: FontWeight.bold,
                 fontSize: MediaQuery.of(context).size.height/41)
                 ,),
                ),
              ),
             ),
           ),
          //  InkWell(
          //    onTap: search(),
          //      child: Card(
          //      elevation: 10,
          //      color: Colors.black54,
          //      child: Container(
          //        decoration: BoxDecoration(
          //          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
          //         gradient: LinearGradient(                 
          //               colors: <Color>[
          //                 Color.fromARGB(210, 92, 226, 201),
          //                 Color.fromARGB(210, 75, 201, 207)
          //                 // Color.fromARGB(200, 184, 30, 160),
          //                 // Color.fromARGB(200, 60, 17, 109),
          //               ],
          //               stops: [0,0.8],
          //               begin: Alignment.topLeft,
          //               end: Alignment.bottomRight)

          //        ),
          //        height: MediaQuery.of(context).size.height/17,
          //        width:  MediaQuery.of(context).size.width/10,
          //        child: Center(child: Text("OK",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),
          //      ),
          //    ),
          //  ),
                            ],
                          ),
                        ),
           Text("AQ\nWeather",style:TextStyle(
                   color:Colors.greenAccent,
                   fontWeight: FontWeight.bold,
                   fontSize: 18
                     ))
                       ],
                     ),
                  ),
                ),
            ],
          ),
          Row(
            children: <Widget>[
              Stack(
               children: <Widget>[
                 Container(
                  height: MediaQuery.of(context).size.height/3.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("Assets/images/greengrass.jpg")
                    )
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/3.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color.fromARGB(210, 92, 226, 201),
                        Color.fromARGB(210, 75, 201, 207)
                        // Color.fromARGB(200, 184, 30, 160),
                        // Color.fromARGB(200, 60, 17, 109),
                      ],
                      stops: [0,0.8],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                      )
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      // Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/32),),
                      Container(
                        height: MediaQuery.of(context).size.height/3.3,
                        width: MediaQuery.of(context).size.width/12,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height/3.3,
                        width: MediaQuery.of(context).size.width/1.19,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/32),),
                            Row(
                          children: <Widget>[
                              Text("Weather Forecast",
                              style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,),                        
                              ),
                              
                          ],
                        ),
                         Row(
                          children: <Widget>[
                              Text("Forecast from $day1 $date1 $month1 to $day5 $date5 $month5",
                              style: TextStyle(fontSize: 13),                        
                              ),
                          
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/27),),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           
                             children: <Widget>[
                               Container(
                                   height: MediaQuery.of(context).size.height/6,
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: <Widget>[
                                       Row(
                                         children: <Widget>[
                                           Text("$sday1",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)
                                         ],
                                       ),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.wb_sunny,size: 28,)
                                        ],
                                      ),
                                      Row(
                                         children: <Widget>[
                                          Text(dailymin_temp[0]+"°/"+dailymax_temp[0]+"°")
                                         ],
                                       ),
                                     ],
                                   ),
                                 ),

                                Container(
                                 height: MediaQuery.of(context).size.height/6,
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: <Widget>[
                                     Row(
                                       children: <Widget>[
                                         Text("$sday2",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)
                                       ],
                                     ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.wb_sunny,size: 28,)
                                      ],
                                    ),
                                    Row(
                                       children: <Widget>[
                                     Text(dailymin_temp[1]+"°/"+dailymax_temp[1]+"°")
                                       ],
                                     ),
                                   ],
                                 ),
                               ),

                                Container(
                                 height: MediaQuery.of(context).size.height/6,
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: <Widget>[
                                     Row(
                                       children: <Widget>[
                                        Text("$sday3",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)
                                       ],
                                     ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.wb_sunny,size: 28,)
                                      ],
                                    ),
                                    Row(
                                       children: <Widget>[
                                         Text(dailymin_temp[2]+"°/"+dailymax_temp[2]+"°")
                                       ],
                                     ),
                                   ],
                                 ),
                               ),

                                Container(
                                 height: MediaQuery.of(context).size.height/6,
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: <Widget>[
                                     Row(
                                       children: <Widget>[
                                         Text("$sday4",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)
                                       ],
                                     ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.wb_sunny,size: 28,)
                                      ],
                                    ),
                                    Row(
                                       children: <Widget>[
                                         Text(dailymin_temp[3]+"°/"+dailymax_temp[3]+"°")
                                       ],
                                     ),
                                   ],
                                 ),
                               ),

                                Container(
                                 height: MediaQuery.of(context).size.height/6,
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: <Widget>[
                                     Row(
                                       children: <Widget>[
                                         Text("$sday5",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)
                                       ],
                                     ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.wb_sunny,size: 28,)
                                      ],
                                    ),
                                    Row(
                                       children: <Widget>[
                                         Text(dailymin_temp[4]+"°/"+dailymax_temp[4]+"°")
                                       ],
                                     ),
                                   ],
                                 ),
                               )
                             ],
                           )   
                          ],
                        ),
                      )
                    ],
                  ),
                )
               ],
              )
            ],
          ),
          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/28),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/22),),
              Expanded(child: 
              Text("$location",
              style: TextStyle(
                color:Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30

                 ),
              )),
              Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/22),),
              IconButton(icon: Icon(Icons.location_on,color: Colors.white,size: 18,), onPressed: () {},),
              IconButton(icon: Icon(Icons.replay,color: Colors.white,size: 18,), onPressed: () {},)
            ],
          ),
          
          Row(
            children: <Widget>[
               Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/21),),
              Expanded(child: Text((type==null)?"null":type.toString(),
              style: TextStyle(
                color: Colors.white54,
                fontSize: 16
              ),
              ))
            ],
          ),
          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/34),),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Card(
               elevation: 6,
               color: Colors.black,
               child: 
               Container(
                 height: MediaQuery.of(context).size.height/4.8,
                 width: MediaQuery.of(context).size.width/1.09,
                 child: Row(
                   children: <Widget>[
                     Container(
                      height: MediaQuery.of(context).size.height/4.8,
                      width: MediaQuery.of(context).size.width/140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          bottomLeft: Radius.circular(7)
                          ),
                        gradient: LinearGradient(
                          colors: <Color>[
                        Color.fromARGB(210, 19, 206, 206),
                        Color.fromARGB(210, 76, 240, 207),
                         //Color.fromARGB(200, 184, 30, 160),
                         //Color.fromARGB(200, 60, 17, 109),
                      ],
                      stops: [0,0.5],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                        )
                      ),
                     ),
                     Container(
                       height: MediaQuery.of(context).size.height/4.8,
                      width: MediaQuery.of(context).size.width/13,
                     ),
                     Container(
                       width: MediaQuery.of(context).size.width/1.3,
                       child: Column(
                         children: <Widget>[
                           Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/50),),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: <Widget>[
                              Text(temp==null?" ":temp.toString()+"°C",
                              style: TextStyle(
                                fontSize: 65,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              )
                              ,),
                              Icon(MdiIcons.cloud,color:Colors.blueAccent,size: 60,)
                           ],
                           ),
                           Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/40),),
                           Row(
                             children: <Widget>[
                               Container(
                                 color: Colors.white,
                                 height: 0.3,
                                 width:  MediaQuery.of(context).size.width/1.3,
                               )
                             ],
                           ),
                            Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/100),),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[
                               Expanded(child: Text("Today in the City $location is $type with Temperature max "+dailymax_temp[0] +"°C and temperature min $temp_min°C",
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 13,
                                 fontWeight: FontWeight.bold
                                 ),))
                             ],
                           )
                         ],
                       ),
                     )
                   ],
                 ),
               ),
             )
           ],
         ),
          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/45),),
         Container(
            height: MediaQuery.of(context).size.height/7.4,
            width: MediaQuery.of(context).size.width/1.07,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Card(elevation: 2,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(26)
                   )
                   ),
                 color: Colors.black,
                 child: Container(                 
                  height: MediaQuery.of(context).size.height/7.2,
                  width: MediaQuery.of(context).size.width/4.8, 
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(MdiIcons.waterOutline,color:Colors.blue,size: 28,),
                      Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/70),),
                      Text("HUMIDITY",style:TextStyle(color:Colors.blue,fontSize:10,fontWeight:FontWeight.bold)),
                      Text((humidity==null)?"null":humidity.toString()+" %",style:TextStyle(color:Colors.blue,fontSize:10,fontWeight:FontWeight.bold)),
                    ],
                  ),
                 ),
               ),
                Card(elevation: 2,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                 color: Colors.black,
                 child: Container(                 
                  height: MediaQuery.of(context).size.height/7.2,
                  width: MediaQuery.of(context).size.width/4.8, 
                   child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Icon(MdiIcons.weatherWindy,color:Colors.greenAccent,size: 28,),
                       Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/70),),
                      Text("WIND",style:TextStyle(color:Colors.greenAccent,fontSize:10,fontWeight:FontWeight.bold)),
                      Text("$wind KMH",style:TextStyle(color:Colors.greenAccent,fontSize:10,fontWeight:FontWeight.bold)),
                     ],
                   ),
                 ),
               ),
                Card(elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                 color: Colors.black,
                 child: Container(                 
                  height: MediaQuery.of(context).size.height/7.2,
                  width: MediaQuery.of(context).size.width/4.8, 
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(MdiIcons.weatherSunsetUp,color:Colors.deepOrangeAccent,size: 28,),
                      Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/70),),
                      Text("SUNRISE",style:TextStyle(color:Colors.deepOrangeAccent,fontSize:10,fontWeight:FontWeight.bold)),
                      Text(readTimestamp(sunrise)==null?"":readTimestamp(sunrise),style:TextStyle(color:Colors.deepOrangeAccent,fontSize:10,fontWeight:FontWeight.bold)),
                    ],
                  ),
                 ),
               ),
                Card(elevation: 2,
                  shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.only(
                     bottomRight: Radius.circular(26)
                   )),
                 color: Colors.black,
                 child: Container(                 
                  height: MediaQuery.of(context).size.height/7.2,
                  width: MediaQuery.of(context).size.width/4.8, 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(MdiIcons.weatherSunsetDown,color:Colors.purple,size: 28,),
                      Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/70),),
                      Text("SUNSET",style:TextStyle(color:Colors.purple,fontSize:10,fontWeight:FontWeight.bold)),
                      Text(readTimestamp(sunset),style:TextStyle(color:Colors.purple,fontSize:10,fontWeight:FontWeight.bold)),

                    ],
                  ),
                 ),
               ),
             ],
           ),
         )
        ],
      ),
    ),
      ),
    );
  }
}