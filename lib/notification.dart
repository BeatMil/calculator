import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NotificationState();
  }
}

class NotificationState extends State<NotificationPage> {

  Widget _notificationTab (String imagePath, String messsage, DocumentSnapshot document) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Image.asset(imagePath,
          height: 80,
          width: 80,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(document['name'],
            style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold),),
            Text(document['message'],
            style: TextStyle(fontSize: 16),),
          ],
        )
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
      body: StreamBuilder(
        stream: Firestore.instance.collection('notification').snapshots,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return Column(
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
              _notificationTab('assets/MugiQT.png', 'how????', snapshot.data.documents[2])
            ],
          );
        }
      ),
    );
  }


  
  
}