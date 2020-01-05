import 'package:flutter/material.dart';
import 'progress.dart';
import 'utils.dart' ;
import 'country_data.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:CountryData(),
     theme: ThemeData(
       
       fontFamily: "GoogleSans",
       scaffoldBackgroundColor: Color.fromARGB(255, 19, 28, 26)
     ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProgPage extends StatefulWidget {
  ProgPage({Key key}) : super(key: key);

  _ProgPageState createState() => _ProgPageState();
}

class _ProgPageState extends State<ProgPage> {
  int number;
  @override
  void initState() { 
    super.initState();
    timer();
  }
   timer() async {
    
    for(int i=1;i<=100;i++){
      await Future.delayed(const Duration(milliseconds: 500),(){
       setState(() {
        bloc1.counter();
        bloc2.counter();
       });
      });
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       children: <Widget>[
         Center(
         child: ProgressBar(number),
        ),
        StreamBuilder<Object>(
          stream: bloc1.number1,
          builder: (context, snapshot) {
            number=snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Processing",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("$number"+"%",style: TextStyle(fontSize: 25),),
                  ],
                )
              ],
            );
          }
        )
       ],
     )
    );
  }
}



