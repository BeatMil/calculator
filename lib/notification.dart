import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotificationState();
  }
}

class NotificationState extends State<NotificationPage> {
  Widget _notificationTab(String imagePath, DocumentSnapshot document) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Image.asset(
            'assets/MugiQT.png',
            height: 80,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              document['name'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              document['message'],
              style: TextStyle(fontSize: 16),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'dotRoot/Notification',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection('notification').snapshots,
          builder: (context, snapshots) {
            if (!snapshots.hasData) return const Text('Loading...');
            return ListView.builder(
              itemExtent: 80,
              itemCount: snapshots.data.documents.length,
              itemBuilder: (context, index) => _notificationTab(
                  'assets/MugiQT.png', snapshots.data.documents[index]),
            );
          },
        ));
  }
}
