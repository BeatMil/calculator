import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NotificationState();
  }
}

class NotificationState extends State<NotificationPage> {

  Widget _notificationTab (String imagePath, String messsage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Image.asset(imagePath,
          height: 80,
          width: 80,
          ),
        ),
        Text(messsage,
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
          _notificationTab('assets/MugiQT.png',"Go outside is scary..."),
          _notificationTab('assets/milanor.jpg', "Steal!!!!!")
        ],
      ),
    );
  }


  
  
}