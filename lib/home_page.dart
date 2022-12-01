import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);




  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String Output = "0";
  String _out ="0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  PressButton(String val){
   print(val);

   if(val == "C"){
     _out = "0";
     num1 = 0;
     num2 = 0;
     operand = "";

   }else if(val == "+" || val == "-" || val == "*" || val == "/" ){
    num1 = double.parse(Output);
    operand = val;
    _out = "0";
    Output = Output+val;
   }else if(val=="."){
     if (_out.contains(".")){
       return;
     }else{
       _out = _out+val;
     }
   }else if(val == "="){
     num2 = double.parse(Output);
     if(operand == "+"){
       _out = (num1 + num2).toString();

     }

     if(operand == "-"){
       _out = (num1 - num2).toString();

     }

     if(operand == "*"){
       _out = (num1 * num2).toString();

     }

     if(operand == "/"){
       _out = (num1 / num2).toString();

     }
     num2 = 0.0;
     num1 = 0.0;

   }else{
     _out = _out+val;

   }
   setState(() {
     Output = double.parse(_out).toStringAsFixed(2);
   });
  }



  Widget CalcBtn(String Btnval){

    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(2.0,2.0),
              blurRadius: 8.0,
              spreadRadius: 1.0,
            ),

            BoxShadow(
              color: Colors.white,
              offset: Offset(-2.0,-2.0),
              blurRadius: 8.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: MaterialButton(
            padding: EdgeInsets.all(30.0),
            child: Text(Btnval,style: TextStyle(
              fontSize: 22.0,
            ),),

            onPressed: () => PressButton(Btnval),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: Container(
            child: ListView(
              shrinkWrap: true,
             primary:false,
             children: <Widget>[
               Container(
                 alignment: Alignment.bottomRight,
                 padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 50.0,),
                 child: Text(Output,style: TextStyle(
                   fontSize: 60.0,
                 ),),
               ),


               Column(
                 children: <Widget>[
                   Row(
                     children: <Widget>[
                       CalcBtn("."),
                       CalcBtn("C"),
                       CalcBtn("<-"),
                       CalcBtn("*"),
                     ],
                   ),

                   Row(
                     children: <Widget>[
                       CalcBtn("7"),
                       CalcBtn("8"),
                       CalcBtn("9"),
                       CalcBtn("/"),
                     ],
                   ),

                   Row(
                     children: <Widget>[
                       CalcBtn("4"),
                       CalcBtn("5"),
                       CalcBtn("6"),
                       CalcBtn("+"),
                     ],
                   ),

                   Row(
                     children: <Widget>[
                       CalcBtn("1"),
                       CalcBtn("2"),
                       CalcBtn("3"),
                       CalcBtn("-"),
                     ],
                   ),

                   Row(
                     children: <Widget>[
                       CalcBtn("0"),
                       CalcBtn("="),
                     ],
                   ),
                 ],
               )


             ],
            ),
          ),

    ));
  }
}
