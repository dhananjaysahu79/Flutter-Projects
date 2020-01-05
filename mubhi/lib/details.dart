import 'package:flutter/material.dart';
import 'player.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'package:dartpedia/dartpedia.dart' as wiki;

class MovieDetails extends StatefulWidget {
  final int index;
  MovieDetails(this.index); 

  @override
  _MovieDetailsState createState() => _MovieDetailsState(index);
}

class _MovieDetailsState extends State<MovieDetails> {
  bool ispressed=false;
var name=new List(4);
List reviews=new List(4);
List duration=new List(4);
List gen1=new List(4);
List gen2=new List(4);
List gen3=new List(4);
List imdb=new List(4);
List rottentom=new List(4);
List metacritic=new List(4);
List rd=new List(4);
List director=new List(4);
List writer=new List(4);
List storyline=new List(4);
var img =new List(4);
var width1=4.0;
var width2=4.0;
var width3=4.0;
//var wikipediapage;
   int index;
  _MovieDetailsState(this.index);
 @override
  initState(){ 
   super.initState(); 
   
   name=["Joker (2019)","Avengers-Endgame","Hobbs & Shaw","Alita-Battle Angel"];
    img=["assets/images/joker.jpg","assets/images/avengers.jpg","assets/images/hobs.jpg","assets/images/alita.jpg"];
    reviews=["317K","580K","88K","165K"];
    duration=["122 min","182 min","137 min","122 min"];
    gen1=["Crime","Fantasy","Action","Action"];
    gen2=["Drama","Sci-Fi","Adventure","Animation"];
    gen3=["Thriller","Action","Crime","Sci-Fi"];
    imdb=["8.9","8.5","6.6","7.4"];
    rottentom=["68","94","67","61"];
    metacritic=["59","78","60","53"];
    rd=["4 Oct 2019","26 April 2019","2 August 2019","14 Feb 2019"];
    director=["Todd Phillips","Anthony Russo,Joe Russo","David Leitch","Robert Rodriguez"];
    writer=["Todd Phillips, Scott Silver, Bob Kane","Cristopher Markus(screenplay by),Stephen McFeely(Screenplay by),Stanlee(based on the Marvel comics by)","Chris Morgan,Drew Pearce,Gary Scott Thompson","James Cameron,Laeta Kalogridis,Yukito Kishiro"];
    storyline[0]="In Gotham City,mentally-troubled comedian Arthur Fleck is diregarded and mistreated by Society.He Then embarks on a downward spiral of revolution and bloody crime.This path brings him face-to-face with his alter-ego:'TheJoker'";
    storyline[1]="After devastating events of Avengers:Infinty War (2018),the universe is in ruins.With the help of remaining allies,the Avenger assemble once more in order to reverse Thanos'actions and restore balance to the Universe.";
    storyline[2]="Lawman Luke Hobbs and outcast Deckard Shaw form an unlikely alliance with a cyber-geneticallu enhanced villain threstens the future of humanity";
    storyline[3]="A deactivated Cyborg is revived,but cannot remember anything of her past life and goes on a quest to find out who she is."; 
    //wikipediapage =await wiki.page(name[index]);
  returnwidth();

 } 
 Future returnwidth() async {
   await Future.delayed(const Duration(microseconds: 500),(){
   setState(() {
     width1=(double.parse(imdb[index])*25) as double;
     width2=(double.parse(rottentom[index])*2.5) as double;
     width3=(double.parse(metacritic[index])*2.5) as double;
   });
   });
   
 }


 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 2),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height/3.2,
                width: MediaQuery.of(context).size.width/1.01,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    stops: [0,0.2],
                    colors: <Color>[Colors.black,Colors.black26]
                    ),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black54, BlendMode.srcOver),
                    alignment: Alignment.topCenter,
                    image: AssetImage(img[index]),
                    fit: BoxFit.cover
                    )
                ),
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 25),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), 
                        onPressed: ()=>{Navigator.of(context).push(MaterialPageRoute<Null>(builder:(BuildContext context){return HomePage();}))},
                        ),
                         Padding(padding: EdgeInsets.only(left: 280),),
                         IconButton(icon: Icon(Icons.more_horiz,color: Colors.white,), onPressed: () {},),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 35),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                         Padding(padding: EdgeInsets.only(left: 35),),
                        Expanded(
                          child: Text(
                           name[index],
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white
                            ),

                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 35),),
                        RawMaterialButton(
                          onPressed: () {},
                          fillColor: Colors.orange,
                          shape: CircleBorder(),
                          child: Icon(Icons.play_arrow,size: 30,),
                          padding: EdgeInsets.all(13),
                          ),
                          Padding(padding: EdgeInsets.only(right: 14),),
                      ],
                    ),
                    
                    Row(
                      children: <Widget>[
                         Padding(padding: EdgeInsets.only(left: 35),),
                        Text(
                         reviews[index]+" reviews",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white70
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 35),),
                         Text(
                         duration[index],
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white70
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 27),),
                         Chip(
                           backgroundColor: Colors.green,       
                           padding: EdgeInsets.only(left:25,right:25,),  
                           labelPadding: EdgeInsets.only(top: -3,bottom: -3),
                           label: Text(gen1[index],
                           style: TextStyle(
                             color: Colors.white,   
                             fontSize: 12                          
                           ),), 
                         ),
                         Padding(padding: EdgeInsets.only(left: 7),),
                         Chip(
                           backgroundColor: Colors.green,       
                           padding: EdgeInsets.only(left:25,right:25,),  
                           labelPadding: EdgeInsets.only(top: -3,bottom: -3),
                           label: Text(gen2[index],
                           style: TextStyle(
                             fontSize: 12,
                             color: Colors.white,                             
                           ),), 
                         ),
                         Padding(padding: EdgeInsets.only(left: 7),),
                         Chip(
                           backgroundColor: Colors.green,       
                           padding: EdgeInsets.only(left:25,right:25,),  
                           labelPadding: EdgeInsets.only(top: -3,bottom: -3),
                           label: Text(gen3[index],
                           style: TextStyle(
                             fontSize: 12,
                             color: Colors.white,                             
                           ),), 
                         ),
                      ],
                    ),
                   
                  ],
                ),
              ),

            ],
          ),
         // Padding(padding: EdgeInsets.only(top: 22),),
          Expanded(
            child: ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 22),),
                    Container(
                      height: MediaQuery.of(context).size.height/35,
                      width: MediaQuery.of(context).size.width/4,
                      decoration: BoxDecoration(
                        color: Colors.red[700],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)
                          )
                      ),
                      child: Center(child: Text("IMDb")),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/35,
                      width: MediaQuery.of(context).size.width/100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          
                          )
                      ),
                    ),
                    AnimatedContainer(
                      height: MediaQuery.of(context).size.height/35,
                      width: width1,
                      decoration: BoxDecoration(
                        color: Colors.red[700],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5)
                          )
                      ), duration: Duration(seconds: 5),curve: Curves.fastOutSlowIn,
                    ),
                    Padding(padding: EdgeInsets.only(left: 8),),
                    Text(imdb[index]+"/10",)
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 12),),

                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 22),),
                    Container(
                      height: MediaQuery.of(context).size.height/35,
                      width: MediaQuery.of(context).size.width/4,
                      decoration: BoxDecoration(
                        color: Colors.red[700],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)
                          )
                      ),
                      child: Center(child: Text("RottenTomato")),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/35,
                      width: MediaQuery.of(context).size.width/100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          
                          )
                      ),
                    ),
                    AnimatedContainer(
                      height: MediaQuery.of(context).size.height/35,
                      width: width2,
                      decoration: BoxDecoration(
                        color: Colors.red[700],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5)
                          )
                      ), duration: Duration(seconds: 5),curve: Curves.fastOutSlowIn,
                    ),
                    Padding(padding: EdgeInsets.only(left: 8),),
                    Text(rottentom[index]+"%")
                  ],
                ),

                  Padding(padding: EdgeInsets.only(top: 12),),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 22),),
                    Container(
                      height: MediaQuery.of(context).size.height/35,
                      width: MediaQuery.of(context).size.width/4,
                      decoration: BoxDecoration(
                        color: Colors.red[700],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)
                          )
                      ),
                      child: Center(child: Text("Metacritic")),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/35,
                      width: MediaQuery.of(context).size.width/100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          
                          )
                      ),
                    ),
                    AnimatedContainer(
                      height: MediaQuery.of(context).size.height/35,
                      width: width3,
                      decoration: BoxDecoration(
                        color: Colors.red[700],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5)
                          )
                      ), duration: Duration(seconds: 5),curve: Curves.fastOutSlowIn,
                    ),
                    Padding(padding: EdgeInsets.only(left: 8),),
                    Text(metacritic[index]+"%")
                  ],
                )
             
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //     Text(imdb[index]+"\nIMDb",
          //     textAlign: TextAlign.center,
          //     style: TextStyle(color: Colors.deepPurple,fontSize: 18),
          //     ),
          //     Padding(padding: EdgeInsets.only(left: 1),),
          //     Text(rottentom[index]+"\nRottenTomatoes",
          //     textAlign: TextAlign.center,
          //     style: TextStyle(color: Colors.deepPurple,fontSize: 18),
          //     ),
          //     Text(metacritic[index]+"\nMetacritic",
          //     textAlign: TextAlign.center,
          //     style: TextStyle(color:Colors.deepPurple,fontSize: 18),
          //     ),
              
          //   ],
          // ),
          ,Padding(padding: EdgeInsets.only(top: 40),),
          Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 20),),
              Expanded(
                child: Column(
                  children: <Widget>[

                    Row(
                      children: <Widget>[
                        Text("Release Date :",
                        style:TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18
                        )
                        ),
                         Text(rd[index],
                        style:TextStyle(
                           color: Colors.black,
                            fontSize: 16,
                            fontFamily: "GoogleSans"
                        )
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 20),),
                    Row(
                      children: <Widget>[
                        Text("Director :",
                        style:TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18
                        )
                        ),
                         Text(director[index],
                        style:TextStyle(
                          color: Colors.black,
                           fontSize: 16,
                           fontFamily: "GoogleSans"
                        )
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 20),),
                    Row(                      
                      children: <Widget>[                        
                        Text("Writer :",
                          style:TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 18
                          )
                          ),
                         
                      ],
                    ),
                    Row(                      
                      children: <Widget>[                        
                        Flexible(
                           fit: FlexFit.tight,
                          child: Text(writer[index],
                        style:TextStyle(
                            color: Colors.black,
                             fontSize: 16,
                             fontFamily: "GoogleSans"
                        )
                        ),
                         ), 
                         
                      ],
                    ),

                  ],
                ),
                ),
              Container(
                height: MediaQuery.of(context).size.height/5,
                width: MediaQuery.of(context).size.width/4,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius:BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(fit: BoxFit.fill,image: AssetImage(img[index]))
                  
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 30),),
            ],
          ),
           Padding(padding: EdgeInsets.only(top: 15),),
                   Row(
        
                      children: <Widget>[    
                      Padding(padding: EdgeInsets.only(left: 20),),              
                        Text("Storyline :",
                          style:TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 18
                          )
                          ),
                         
                      ],
                    ),
                    Row(
        
                      children: <Widget>[    
                      Padding(padding: EdgeInsets.only(left: 20),),              
                       Flexible(
                           fit: FlexFit.tight,
                          child: Text(storyline[index],
                        style:TextStyle(
                            color: Colors.black,
                             fontSize: 16,
                             fontFamily: "GoogleSans"
                        )
                        ),
                         ), 
                        //   Flexible(
                        //    fit: FlexFit.tight,
                        //   child: GestureDetector(
                        //     onTap: (){launch('https://wikipedia/'+name[index]);},
                        //  child: Text(storyline[index],
                        // style:TextStyle(
                        //       color: Colors.black,
                        //        fontSize: 16,
                        //        fontFamily: "GoogleSans"
                        // )
                        // ),
                        //   ),
                        //  ), 
                         
                      ],
                    ),
           ],
            ),
          ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.2)
              ),
              height: MediaQuery.of(context).size.height/12,
              width: MediaQuery.of(context).size.width/5,
              child: IconButton(
                icon:ispressed?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border), 
                onPressed: () {
                setState(() {
                 if(ispressed==true) {
                   ispressed=false;
                 }
                 else{
                 ispressed=true; 
                 }
                });
              },),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.2)
              ),
              height: MediaQuery.of(context).size.height/12,
              width: MediaQuery.of(context).size.width/5,
              child: Icon(Icons.message),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  stops: [0,0.9],
                  begin: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 88, 77, 182),
                    Color.fromARGB(255, 86, 155, 248)
                  ]
                )
              ),
              height: MediaQuery.of(context).size.height/12,
              width: MediaQuery.of(context).size.width/2.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.file_download,color: Colors.black,),
                  Text("Download",style: TextStyle(fontSize: 18,),)
                ],
              ),
            ),
        ],
      ),
      Padding(padding: EdgeInsets.only(bottom: 10),),  
        ],
     ),
    );
  }
}