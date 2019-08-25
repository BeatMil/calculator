import 'package:flutter/material.dart';

class Fish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TITLE HERE',
      home: Scaffold(
        appBar: AppBar(
          title: Text(' FISH HERE '),
        ),
      ),

    );
  }
}

class Gish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gish'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Next'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dish())
            );
          },
        ),
      ),
    );
  }
}
  
class Dish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dish'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

}