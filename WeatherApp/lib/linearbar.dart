import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'utils.dart';

class LinearBar extends StatefulWidget {
  var aqi;
  LinearBar(this.aqi);

  _LinearBarState createState(){ return _LinearBarState(aqi);}
}

class _LinearBarState extends State<LinearBar> {
  int aqi;
  _LinearBarState(this.aqi);
 void initState() { 
    __refresh();
    
  }
   __refresh() async {
   await Future.delayed(const Duration(seconds:2),(){
      setState(() {
        
      });
   });
  }

  @override
  Widget build(BuildContext context) {
      
            return CustomPaint(
             child: Container(
               height: 200,
               width: 200,
             ),
             painter: RadialPainter(aqi),
            );
        
     
  }
}

class RadialPainter extends CustomPainter{
  var aqi;
  RadialPainter(this.aqi);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint=Paint()
    ..color=Colors.white12
    ..strokeCap=StrokeCap.round
    ..style=PaintingStyle.stroke
    ..strokeWidth=7;
    Offset p1 = Offset(-60, 2);
    Offset p2 = Offset(280, 2);
    canvas.drawLine(p1, p2, paint);

   Paint progresspaint=Paint()
    
    ..shader=LinearGradient(
      stops: [0.0,0.9],
      //colors: [Colors.red,Colors.deepPurple]
      colors: [Color.fromARGB(210, 19, 206, 206),Color.fromARGB(210, 76, 240, 207),]
    ).createShader(Rect.fromPoints(p1, p2))
    ..strokeCap=StrokeCap.round
    ..style=PaintingStyle.stroke
    
    ..strokeWidth=6;

  
  Offset p3= new Offset((aqi*28)/10, 2);
  canvas.drawLine(p1, p3, progresspaint); 
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return true;
  }
}