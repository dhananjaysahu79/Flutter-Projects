import 'dart:async';
int number=0;
var num=0.01;
class Bloc1{
StreamController tcontroller1=StreamController();
Stream get number1 =>tcontroller1.stream;
void counter(){
  number=number+1;
  tcontroller1.sink.add(number);
}

}
final bloc1= Bloc1();
class Bloc2{
StreamController tcontroller2=StreamController();
Stream get number2 =>tcontroller2.stream;
void counter(){
  num=num+1;
  tcontroller2.sink.add(num);
}

}
final bloc2= Bloc2();


