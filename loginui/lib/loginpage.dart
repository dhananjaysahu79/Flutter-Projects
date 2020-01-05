import 'package:loginui/main.dart';

import 'main.dart' as globals;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
final TextEditingController t1= new TextEditingController();
final TextEditingController t2= new TextEditingController();
bool passvisible;
int v=0;

void check(){

  setState(() {
    if (t1.text=="dhananjaysahu79@gmail.com"&&t2.text=="beastincarnate") {
  v=1;
 }
  });
  
}
Future <void> _showDialog(){
 return showDialog<void>(
context:context,
builder:(BuildContext){
  return AlertDialog(
    title: new Text("Oopps"),
    content: new Text("Email ID/Password mismatches"),
    actions: <Widget>[
      new FlatButton(
        child: new Text("OK"),
        onPressed: (){Navigator.of(context).pop();},
      )
    ],
  );
}
 );
}
 @override
void initState() { 
  passvisible=true;
  
}

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
          body: new Stack(
children: <Widget>[
   new Container(
       height: MediaQuery.of(context).size.height,
       width:MediaQuery.of(context).size.width ,
           child: new DecoratedBox(
             decoration: new BoxDecoration(
image: DecorationImage(
  image: new AssetImage("assets/IMG-20190720-WA0008.jpg",),fit: BoxFit.fitHeight,
)
             ),
           )
        ),

  Positioned(
      top: MediaQuery.of(context).size.height/16,
      left: -5,
        child: new Container(
        //color: Colors.white,
        height: MediaQuery.of(context).size.height/15,
         width:MediaQuery.of(context).size.width/3 ,
         child: Card(
           color: Colors.black,
           elevation: 16,
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25))),
         child: Center(child: new Text("LearniFy",style: TextStyle(letterSpacing: 1,fontSize:MediaQuery.of(context).size.height/23,fontWeight:FontWeight.bold,color: Colors.white),)),
         ),
      ),
 ),
  new Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height/12),
  ),
  new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
          child: new Container(
            
             height: MediaQuery.of(context).size.height/3.1,
         width:MediaQuery.of(context).size.width/1.05 ,
         child: new Card(
           color: Colors.white,
           child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[

               new Text(""),
               new Row(
                 children: <Widget>[
                   new Text(" Login",style:TextStyle(fontSize: MediaQuery.of(context).size.height/26,fontWeight: FontWeight.bold))
                 ],
               ),
               new Text(""),
               new Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   Container(
                     height: MediaQuery.of(context).size.height/15,
                     width: MediaQuery.of(context).size.width/1.15,
                     child: new TextField(controller: t1,style: TextStyle(fontSize:MediaQuery.of(context).size.height/34),decoration: InputDecoration(hintText: "  Email-ID/Phone No",counterText: '',prefixIcon: Icon(Icons.email)) )),

                   
                 ],
               ),

                new Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   Container(
                     height: MediaQuery.of(context).size.height/15,
                     width: MediaQuery.of(context).size.width/1.15,
                     child: new TextField(obscureText:passvisible ,controller: t2,style: TextStyle(fontSize:MediaQuery.of(context).size.height/34),decoration: InputDecoration(hintText: "  Password",counterText: '',prefixIcon: Icon(Icons.lock),suffixIcon:IconButton(icon: Icon(passvisible?Icons.visibility_off:Icons.visibility), onPressed: () {setState(() {
                      passvisible=!passvisible; 
                     });},))
                     )
                     ),
                   
                 ],
               ),
               new Text(""),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget>[
                   new Text("  Forgot Password??",style:TextStyle(fontSize:MediaQuery.of(context).size.height/40) ,),
                 ],
               ),
               new Text("")



             ],
           ),
         ),
          ),
        ),
      
        
      ],
      
  ),
  Positioned(
      top:MediaQuery.of(context).size.height/1.46, 
      left:MediaQuery.of(context).size.width/3.2 ,
        child: new RaisedButton(onPressed: () {check();
          if(v==1){
          
          Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){return MainPage();}));
        
        }
      
        else{_showDialog();}
        setState(() {
         v=0; 
         
        });},
color: Colors.green,
child: new Text("Sign In",style: TextStyle(fontSize: MediaQuery.of(context).size.height/28,color: Colors.white,letterSpacing: 1,),),
textColor: Colors.white,
splashColor: Colors.blue,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),),
padding: EdgeInsets.only(left:MediaQuery.of(context).size.width/10 ,right:MediaQuery.of(context).size.width/10,top: MediaQuery.of(context).size.height/60,bottom: MediaQuery.of(context).size.height/60),
elevation: 8,
          ),
  ),
new Positioned(
   top:MediaQuery.of(context).size.height/1.28, 
      width:MediaQuery.of(context).size.width,
  child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Container(
          height:MediaQuery.of(context).size.height/11, 
      width:MediaQuery.of(context).size.width/6 ,
          child: Card(
            elevation: 8,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: new IconButton(icon: Image.asset("assets/1024px-Google_Plus_logo_2015.svg.png"),iconSize: 2, onPressed: () {},)
          ),
        ),
        new Container(
          height:MediaQuery.of(context).size.height/11, 
      width:MediaQuery.of(context).size.width/6 ,
          child: Card(
            elevation: 8,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: new IconButton(icon: Image.asset("assets/fb-logo.png"),iconSize: 5, onPressed: () {},)
          ),
        ),
        new Container(
          height:MediaQuery.of(context).size.height/11, 
      width:MediaQuery.of(context).size.width/6 ,
          child: Card(
            elevation: 8,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: new IconButton(icon: Image.asset("assets/twitter-logo-final.png"),iconSize: 5, onPressed: () {},)
          ),
        )
      ],
  ),
),
new Positioned(
  top:MediaQuery.of(context).size.height/1.1,
 // child: Container(
      
  // height:MediaQuery.of(context).size.height/11, 
  //  width:MediaQuery.of(context).size.width/3 ,
      child: Row(
        children: <Widget>[
          new Text("   New In Learnify? ",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height/40),),
         new Text("Sign Up",style: TextStyle(color: Colors.green,fontSize:MediaQuery.of(context).size.height/33,fontWeight: FontWeight.bold ),)
        ],
      ),
 // ),
)
],




      ),
    );
          
  }
}