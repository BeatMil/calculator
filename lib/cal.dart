import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalculatorState();
  }
}

class CalculatorState extends State<Calculator> {

  int _numDisplay = 0;

  Widget _rowNum(int number) {
    return Row(
      children: <Widget>[
        FlatButton(
          onPressed: (){
            setState(() {
             _numDisplay = number;
            });
          },
          child: Text(number.toString()),
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'something',
      home: Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
           child: Text(_numDisplay.toString()), 
          )
        ],
      )
    ),
    
    );
  }
}