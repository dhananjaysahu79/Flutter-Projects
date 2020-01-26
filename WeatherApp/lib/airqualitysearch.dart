//  https://api.waqi.info/feed/geo:22.8;86.20/?token=4beb9d4d7424de855a8a6c4b436bffdbf97b1ef7


import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import'dart:async';
import 'package:http/http.dart'as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'airqualitysearch.dart';
import 'linearbar.dart';
import 'main.dart';
import 'progress.dart';
class AqiSearch extends StatefulWidget {
   var longitude,latitude,location;
   AqiSearch(this.longitude,this.latitude,this.location);

  @override
   State<AqiSearch> createState() {return _AqiSearchState(this.longitude,this.latitude,this.location);}
}

class _AqiSearchState extends State<AqiSearch> {
  var latitude;
  var longitude;
  var conditions;
  var location;
  var co;
  var pm10;
  var so2;
  var o3;
  var pm25;
  var no2;
  _AqiSearchState(this.longitude,this.latitude,this.location);
  var decodedJson3;
  var aqi;
  
  @override
  void initState() { 
    super.initState();
     getAqi();
  }
   
   Future getAqi() async{
      var response= await http.get(Uri.encodeFull("https://api.waqi.info/feed/geo:$latitude;$longitude/?token=4beb9d4d7424de855a8a6c4b436bffdbf97b1ef7"),
       headers: {"results":"application/json"}
      );
      decodedJson3 = jsonDecode(response.body);
      setState(() {
        location=location.toUpperCase();
        aqi=decodedJson3["data"]["aqi"];
        try{
        co=decodedJson3["data"]["iaqi"]["co"]["v"];        
        }catch(Exception )  {}
        try{
         pm10=decodedJson3["data"]["iaqi"]["pm10"]["v"];
        }catch(Exception){}
         try{
          pm25=decodedJson3["data"]["iaqi"]["pm25"]["v"];
        }catch(Exception){}
         try{
         no2=decodedJson3["data"]["iaqi"]["no2"]["v"]; 
        }catch(Exception){}
         try{
         so2=decodedJson3["data"]["iaqi"]["so2"]["v"]; 
        }catch(Exception){}        
      });
   }
   
   calCondition(){
     if(aqi<=50){
       conditions="GOOD";
     }
     else if(aqi>=51&&aqi<=100){
       conditions="MODERATE";
     }
     else if(aqi<=101&&aqi>=150){
       conditions="NOT GOOD";
     }
     else if(aqi>=151&&aqi<=200){
       conditions="UNHEALTHY";
     }
     else if(aqi>=201&&aqi<=300){
       conditions="VERY\nUNHEALTHY";
     }
     else{
       conditions="HAZARDOUS";
     }
     return conditions;
    
   }
   calprogressBar() async{
    await Future.delayed(const Duration(milliseconds: 500),(){
     setState(() {
       
     });
    });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: decodedJson3==null?Center(child: CircularProgressIndicator()):Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
               Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/35)),
               
               //Text("$longitude , $latitude ,$co",style: TextStyle(color: Colors.white,fontSize: 34),),             
              Container (
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width,
                child: Stack(         
                  alignment: Alignment.center,        
                  children: <Widget>[
                   // calprogressBar(),
                    ProgressBar((aqi/5).round()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    Text(aqi.toString(),style: TextStyle(color: Colors.white,fontSize: 50),),
                    Text(calCondition(),textAlign: TextAlign.center,style: TextStyle(color: Colors.white,letterSpacing: 1),),
                    ],)
                    
                  ],
                ),
              ) ,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 40,
                    width:340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)
                        ),
                      gradient: LinearGradient(
                           stops: [0.0,0.9],
                         colors: [Color.fromARGB(210, 19, 206, 206),Color.fromARGB(210, 76, 240, 207),]
                    ),),
                    child: Center(child: Text("${location}-AQI",style: TextStyle(color: Colors.black,letterSpacing: 2,fontSize: 20,fontWeight: FontWeight.bold),)),
                  ),
                 
              ],),
              Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/50),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                 // Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/10)),
                  Text("CO Level",style: TextStyle(color: Colors.red,fontSize: 18),),
                  Text("${co==null?0:((co/400)*100).round()}%",style: TextStyle(color: Colors.white54,fontSize: 18),),
                  Text("$co",style: TextStyle(color: Colors.white54,fontSize: 18),)
                ],
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
               
                Container(
                height: MediaQuery.of(context).size.height/50,
                width: MediaQuery.of(context).size.width/2,
                child: LinearBar(co==null?-21:((co/400)*100).round()),
                )
              ],),
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/40)),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                
                  Text("PM10 Level",style: TextStyle(color: Colors.greenAccent,fontSize: 18),),
                  Text("${pm10==null?0:((pm10/300)*100).round()}%",style: TextStyle(color: Colors.white54,fontSize: 18),),
                  Text("$pm10",style: TextStyle(color: Colors.white54,fontSize: 18),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
               
                Container(
                height: MediaQuery.of(context).size.height/50,
                width: MediaQuery.of(context).size.width/2,
                child: LinearBar(pm10==null?-21:((pm10/300)*100).round()),
                )
              ],),
               Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/40)),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("PM25 Level",style: TextStyle(color: Colors.deepOrange,fontSize: 18),),
                  Text("${pm25==null?0:((pm25/300)*100).round()}%",style: TextStyle(color: Colors.white54,fontSize: 18),),
                  Text("$pm25",style: TextStyle(color: Colors.white54,fontSize: 18),)
                ],
              ),              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
               
                Container(
                height: MediaQuery.of(context).size.height/50,
                width: MediaQuery.of(context).size.width/2,
                child: LinearBar(pm25==null?-21:((pm25/300)*100).round()),
                )
              ],),
                 Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/40)),


               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                
                  Text("SO2 Level",style: TextStyle(color: Colors.cyan,fontSize: 18),),
                  Text("${so2==null?0:((so2/50)*100).round()}%",style: TextStyle(color: Colors.white54,fontSize: 18),),
                  Text("$so2",style: TextStyle(color: Colors.white54,fontSize: 18),)
                ],
              ),              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[               
                Container(
                height: MediaQuery.of(context).size.height/50,
                width: MediaQuery.of(context).size.width/2,
                child: LinearBar(so2==null?-21:((so2/50)*100).round()),
                )
              ],),
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/40)),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                 
                  Text("NO2 Level",style: TextStyle(color: Colors.purple,fontSize: 18),),
                  Text("${no2==null?0:((no2/50)*100).round()}%",style: TextStyle(color: Colors.white54,fontSize: 18),),
                  Text("$no2",style: TextStyle(color: Colors.white54,fontSize: 18),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
        
                Container(
                height: MediaQuery.of(context).size.height/50,
                width: MediaQuery.of(context).size.width/2,
                child: LinearBar(no2==null?-21:((no2/50)*100).round()),
                ),
              ],),

              Flexible(
                child: Text("**Note: All The Null Values are because of your nearest pollution station doesnot calculate those parameters ",
                textAlign:TextAlign.center,style: TextStyle(color: Colors.white24),),
              ),
               Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/50),),     
            ],
          ),
    );
  }
}