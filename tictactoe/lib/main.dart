import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: "TicTacToe",
      debugShowCheckedModeBanner: false,
     // theme: ThemeData.dark(),
     theme: new ThemeData(
       fontFamily: "GoogleSans"
     ),
    );
  }
}

class HomePage extends StatefulWidget {

  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool ispressed1=false;
  bool ispressed2=false;
  bool ispressed3=false;
  bool ispressed4=false;
  bool ispressed5=false;
  bool ispressed6=false;
  bool ispressed7=false;
  bool ispressed8=false;
  bool ispressed9=false;
  int counter =1;
  int butcount1=0;
  int butcount2=0;
  int butcount3=0;
  int butcount4=0;
  int butcount5=0;
  int butcount6=0;
  int butcount7=0;
  int butcount8=0;
  int butcount9=0;
  List<String> a=new List(9);
  var win;
  bool run1=true;
   bool run2=true;
  bool run3=true;
   bool run4=true;
   bool run5=true;
   bool run6=true;
   bool run7=true;
   bool run8=true;
   bool run9=true;
   String winmsg='';
   int total_matches=0;
   int ties=0;
   int xscore=0;
   int oscore=0;

  _icon(){
    
     Icon icon =Icon(Icons.pin_drop,color: Colors.black,size: MediaQuery.of(context).size.width/9.5);
     return icon; 
    
  }
  iconcross(){
    Icon icon =Icon(Icons.close,color: Colors.green,size: MediaQuery.of(context).size.width/9.5);  
     return icon;
  }
  iconzero(){
    Icon icon =Icon(Icons.blur_circular,color: Colors.red,size: MediaQuery.of(context).size.width/9.5);
    return icon;
  }
  iconpin(){
    Icon icon =Icon(Icons.pin_drop,color: Colors.black,size: MediaQuery.of(context).size.width/9.5);
     return icon;
  }

   but1(){
   if(run1==true)
   {
         if(butcount1.isEven){
          Icon icon= iconzero();
            a[0]='o';
            winner();
            return icon;  
          }
         else{
           Icon icon =iconcross();
           a[0]='x';
           winner();
           return icon;
         }
   }
   else{
     //Icon icon=iconpin();
     Icon icon =Icon(Icons.pin_drop,color: Colors.black,size: MediaQuery.of(context).size.width/9.5);
     return icon;
   }  
  }

  but2(){
  if(run2==true)
   {
         if(butcount2.isEven){
           Icon icon= iconzero();
            a[1]='o';
            winner();  
            return icon;
          }
         else{
           Icon icon =iconcross();
           a[1]='x';
           winner();
           return icon;
         }
   }
   else{
   // Icon icon= iconpin();
   Icon icon =Icon(Icons.pin_drop,color: Colors.black,size: MediaQuery.of(context).size.width/9.5);
    return icon;
   }  
  }
  
  but3(){
   if(run3==true)
   {
         if(butcount3.isEven){
           Icon icon= iconzero();
            a[2]='o';
            winner();  
            return icon;
          }
         else{
          Icon icon = iconcross();
           a[2]='x';
           winner();
           return icon;
         }
   }
   else{
   // Icon icon= iconpin();
   Icon icon =Icon(Icons.pin_drop,color: Colors.black,size: MediaQuery.of(context).size.width/9.5);
    return icon;
   }  
  }

  but4(){
   if(run4==true)
   {
         if(butcount4.isEven){
           Icon icon = iconzero();
            a[3]='o';
            winner();
            return icon;  
          }
         else{
           Icon icon=iconcross();
           a[3]='x';
           winner();
           return icon;
         }
   }
   else{
  //  Icon icon= iconpin();
  Icon icon =Icon(Icons.pin_drop,color: Colors.black,size: MediaQuery.of(context).size.width/9.5);
    return icon;
   }  
  }

  but5(){
   if(run5==true)
   {
         if(butcount5.isEven){
           Icon icon= iconzero();
            a[4]='o';
            winner();
            return icon;  
          }
         else{
          Icon icon= iconcross();
           a[4]='x';
           winner();
           return icon;
         }
   }
   else{
     //Icon icon =iconpin();
     Icon icon =Icon(Icons.pin_drop,color: Colors.black,size: MediaQuery.of(context).size.width/9.5);
     return icon;
   }  
  }

  but6(){
   if(run6==true)
   {
         if(butcount6.isEven){
          Icon icon=  iconzero();
            a[5]='o';
            winner();  
            return icon;
          }
         else{
          Icon icon = iconcross();
           a[5]='x';
           winner();
           return icon;
         }
   }
   else{
    //Icon icon= iconpin();
    Icon icon =Icon(Icons.pin_drop,color: Colors.black,size: MediaQuery.of(context).size.width/9.5);
    return icon;
   }  
  }

  but7(){
   if(run7==true)
   {
         if(butcount7.isEven){
          Icon icon=  iconzero();
            a[6]='o';
            winner();  
            return icon;
          }
         else{
          Icon icon= iconcross();
           a[6]='x';
           winner();
           return icon;
         }
   }
   else{
    //Icon icon= iconpin();
    Icon icon =Icon(Icons.pin_drop,color: Colors.black,size: MediaQuery.of(context).size.width/9.5);
    return icon;
   }  
  }

  but8(){
   if(run8==true)
   {
         if(butcount8.isEven){
           Icon icon= iconzero();
            a[7]='o';
            winner();
            return icon;  
          }
         else{
           Icon icon=  iconcross();
           a[7]='x';
           winner();
           return icon;
         }
   }
   else{
    //Icon icon= iconpin();
    Icon icon =Icon(Icons.pin_drop,color: Colors.black,size: MediaQuery.of(context).size.width/9.5);
    return icon;
   }  
  }

  but9(){
   if(run9==true)
   {
         if(butcount9.isEven){
          Icon icon =  iconzero();
            a[8]='o';
            winner(); 
            return icon; 
          }
         else{
          Icon icon= iconcross();
           a[8]='x';
           winner();
           return icon;
         }
   }
   else{
   // Icon icon= iconpin();
   Icon icon =Icon(Icons.pin_drop,color: Colors.black,size: MediaQuery.of(context).size.width/9.5);
    return icon;
   }  
  }

  winner(){
    setState(() {
     if(win=='X'||win=='O'){
       
          if(butcount1==0){
           run1=false;
           
          }
          if(butcount2==0){
           run2=false;
            
          }
          if(butcount3==0){
           run3=false;
            
          }
          if(butcount4==0){
           run4=false;
           
          }
          if(butcount5==0){
           run5=false;
           
          }
          if(butcount6==0){
           run6=false;
            
          }
          if(butcount7==0){
           run7=false;
            
          }
          if(butcount8==0){
           run8=false;
            
          }
          if(butcount9==0){
           run9=false;
            
          }
      
    }
    else if(a[0]=='x'&&a[4]=='x'&&a[8]=='x'){  //diagonal checking
     win='X';
     winmsg="X won the match";
     total_matches=total_matches+1;
     xscore++;
    }
    else if(a[0]=='o'&&a[4]=='o'&&a[8]=='o'){//diagonal checking
     win='O';
     winmsg="O won the match";
     total_matches=total_matches+1;
     oscore++;
    }
    else if(a[2]=='x'&&a[4]=='x'&&a[6]=='x'){//diagonal checking
     win='X';
     winmsg="X won the match";
     total_matches=total_matches+1;
     xscore++;
    }
    else if(a[2]=='o'&&a[4]=='o'&&a[6]=='o'){//diagonal checking
     win='O';
     winmsg="O won the match";
     total_matches=total_matches+1;
     oscore++;
    }
    else if(a[0]=='x'&&a[1]=='x'&&a[2]=='x'){//row checking
     win='X';
     winmsg="X won the match";
     total_matches=total_matches+1;
     xscore++;
    }
    else if(a[0]=='o'&&a[1]=='o'&&a[2]=='o'){//row checking
     win='O';
     winmsg="O won the match";
     total_matches=total_matches+1;
     oscore++;
    }
    else if(a[3]=='x'&&a[4]=='x'&&a[5]=='x'){//row checking
     win='X';
     winmsg="X won the match";
     total_matches=total_matches+1;
     xscore++;
    }
    else if(a[3]=='o'&&a[4]=='o'&&a[5]=='o'){//row checking
     win='O';
     winmsg="O won the match";
     total_matches=total_matches+1;
     oscore++;
    }
    else if(a[6]=='x'&&a[7]=='x'&&a[8]=='x'){//row checking
     win='X';
     winmsg="X won the match";
     total_matches=total_matches+1;
     xscore++;
    }
    else if(a[6]=='o'&&a[7]=='o'&&a[8]=='o'){//row checking
     win='O';
     winmsg="O won the match";
     total_matches=total_matches+1;
     oscore++;
    }
    else if(a[0]=='x'&&a[3]=='x'&&a[6]=='x'){//column checking
     win='X';
     winmsg="X won the match";
     total_matches=total_matches+1;
     xscore++;
    }
    else if(a[0]=='o'&&a[3]=='o'&&a[6]=='o'){//column checking
     win='O';
     winmsg="O won the match";
     total_matches=total_matches+1;
     oscore++;
    }
    else if(a[1]=='x'&&a[4]=='x'&&a[7]=='x'){//column checking
     win='X';
     winmsg="X won the match";
     total_matches=total_matches+1;
     xscore++;
    }
    else if(a[1]=='o'&&a[4]=='o'&&a[7]=='o'){//column checking
     win='O';
     winmsg="O won the match";
     total_matches=total_matches+1;
     oscore++;
    }
    else if(a[2]=='x'&&a[5]=='x'&&a[8]=='x'){//column checking
     win='X';
     winmsg="X won the match";
     total_matches=total_matches+1;
     xscore++;
    }
    else if(a[2]=='o'&&a[5]=='o'&&a[8]=='o'){//column checking
     win='O';
     winmsg="O won the match";
     total_matches=total_matches+1;
     oscore++;
    }
   
    else if(total_matches.isOdd && counter==9&& win==null){
    win="Its a Tie";
    winmsg="Its a Tie";
    total_matches=total_matches+1;
    ties++;
    }
    else if(total_matches.isEven && counter==10&& win==null){
    win="Its a Tie";
    winmsg="Its a Tie";
    total_matches=total_matches+1;
    ties++;
    }
    
   });

  }

  clear(){
    setState(() {
      ispressed1=false;
                ispressed2=false;
                ispressed3=false;
                ispressed4=false;
                ispressed5=false;
                ispressed6=false;
                ispressed7=false;
                ispressed8=false;
                ispressed9=false;
                if(total_matches.isOdd){
                counter =0;
                }
                else{
                  counter=1;
                }

                butcount1=0;
                butcount2=0;
                butcount3=0;
                butcount4=0;
                butcount5=0;
                butcount6=0;
                butcount7=0;
                butcount8=0;
                butcount9=0;
                a=new List(9);
                win=null;
                run1=true;
                 run2=true;
                  run3=true;
                   run4=true;
                    run5=true; run6=true; run7=true; run8=true; run9=true;
                    winmsg=''; 
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: new AppBar(title: new Text("TicTacToe",style: TextStyle(fontSize:  MediaQuery.of(context).size.height/30,fontWeight: FontWeight.bold,letterSpacing: 1),),backgroundColor: Colors.cyan,actions: <Widget>[new IconButton(icon: Icon(Icons.refresh), onPressed: () {
          clear();
          setState(() {
            xscore=0;
            oscore=0;
            total_matches=0;
            ties=0;
          });
        },)],),
        body: Container(
    decoration: new BoxDecoration(image: DecorationImage(alignment: Alignment.centerRight,image: new AssetImage("assets/IMG_20190805_231751.jpg"))),
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Card(
              child: Container(height: MediaQuery.of(context).size.height/30,width: MediaQuery.of(context).size.width/4,
                color: Colors.cyan,child: new Text("Team X : $xscore",style: TextStyle(fontSize: MediaQuery.of(context).size.height/35),),),
            ),
             new Card(
              child: Container(height: MediaQuery.of(context).size.height/30,width: MediaQuery.of(context).size.width/4,
                color: Colors.cyan,child: new Text("Team O : $oscore",style: TextStyle(fontSize: MediaQuery.of(context).size.height/35),),),
            )
          ],
        ),
        new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height/11.2),),
       new Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
           new Text(""),
          new RaisedButton(elevation: 0,color: Colors.white,onPressed: () {
            
             setState(() {
               if(ispressed1==false){
                  winner();
             ispressed1=true;
             butcount1=counter;
             counter++;
            // winner();
              } 
             });
            
          },child:(ispressed1)?but1():_icon(),padding: EdgeInsets.all(MediaQuery.of(context).size.width/16),),
           new RaisedButton(elevation: 0,color: Colors.white,onPressed: () {
             
               setState(() {
                if(ispressed2==false){
                   winner();
              ispressed2=true;
              butcount2=counter;
              counter++;
             // winner();
              }  
               });
            
           },child: (ispressed2)?but2():_icon(),padding: EdgeInsets.all(MediaQuery.of(context).size.width/16),),
           new RaisedButton(elevation: 0,color: Colors.white,onPressed: () {
             setState(() {
               if(ispressed3==false){
                  winner();
              ispressed3=true;
              butcount3=counter;
              counter++;
             // winner();
              } 
             });
           },child: (ispressed3)?but3():_icon(),padding: EdgeInsets.all(MediaQuery.of(context).size.width/16),),
          new Text(""),


         ],
       ),
       new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height/55),),
       new Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
           new Text(""),
           new RaisedButton(elevation: 0,color: Colors.white,onPressed: () {
             setState(() {
               if(ispressed4==false){
                  winner();
              ispressed4=true;
              butcount4=counter;
              counter++;
              //winner();
              } 
             });
           },child: (ispressed4)?but4():_icon(),padding: EdgeInsets.all(MediaQuery.of(context).size.width/16),),
           new RaisedButton(elevation: 0,color: Colors.white,onPressed: () {
             setState(() {

              if(ispressed5==false){
                 winner();
              ispressed5=true;
              butcount5=counter;
              counter++;
              //winner();
              } 
             });
           },child: (ispressed5)?but5():_icon(),padding: EdgeInsets.all(MediaQuery.of(context).size.width/16),),
           new RaisedButton(elevation: 0,color: Colors.white,onPressed: () {
             setState(() {
               if(ispressed6==false){
                  winner();
              ispressed6=true;
              butcount6=counter;
              counter++;
              //winner();
              } 
             });
           },child: (ispressed6)?but6():_icon(),padding: EdgeInsets.all(MediaQuery.of(context).size.width/16),),
           new Text("")
         ],
       ),
       new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height/50),),
       new Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
           new Text(""),
           new RaisedButton(elevation: 0,color: Colors.white,onPressed: () {
             setState(() {
               if(ispressed7==false){
                  winner();
              ispressed7=true;
              butcount7=counter;
              counter++;
              //winner();
              } 
             });
           },child: (ispressed7)?but7():_icon(),padding: EdgeInsets.all(MediaQuery.of(context).size.width/16),),
           new RaisedButton(elevation: 0,color: Colors.white,onPressed: () {
             setState(() {
               if(ispressed8==false){
                  winner();
              ispressed8=true;
              butcount8=counter;
              counter++;
              //winner();
              } 
             });
           },child: (ispressed8)?but8():_icon(),padding: EdgeInsets.all(MediaQuery.of(context).size.width/16),),
           new RaisedButton(elevation: 0,color: Colors.white,onPressed: () {
             setState(() {
               if(ispressed9==false){
                  winner();
              ispressed9=true;
              butcount9=counter;
              counter++;
              //winner();
              } 
             });
           },child: (ispressed9)?but9():_icon(),padding: EdgeInsets.all(MediaQuery.of(context).size.width/16),),
          new Text(""),
         ],
       ),
       new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/20,),),
       new Text("$winmsg"),
       new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/20,),),
      new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
           new Card(
              child: Container(height: MediaQuery.of(context).size.height/22,width: MediaQuery.of(context).size.width/3.5,
                color: Colors.cyan,child: Center(child: new Text("Total Matches : $total_matches",style: TextStyle(fontSize: MediaQuery.of(context).size.height/50),)),),
            ),
             new Card(
              child: Container(height: MediaQuery.of(context).size.height/22,width: MediaQuery.of(context).size.width/4,
                color: Colors.cyan,child: Center(child: new Text("Ties : $ties",style: TextStyle(fontSize: MediaQuery.of(context).size.height/50),)),),
            ),
             new RaisedButton(onPressed: () {
               if(win!=null)
               clear();
             },child: new Text("Next Match"),)
        ],
      )

      ],
    ),
        ),
      );
  }
}