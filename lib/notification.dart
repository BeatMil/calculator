import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NotificationState();
  }
}

class NotificationState extends State<NotificationPage> {

  Widget _notificationTab () {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Image.asset('assets/MugiQT.png',
          height: 80,
          ),
        ),
        Text("Go outside is scary...",
        style: TextStyle(fontSize: 16),)
      ],
    );
  }
    
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dotRoot/Notification',
          style: TextStyle(fontSize: 25,
          color: Colors.white),
            ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                child: Text('Clear All',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18),
                ),
              ),
            ],
          ),
          _notificationTab(),
        ],
      ),
    );
  }


  
  
}