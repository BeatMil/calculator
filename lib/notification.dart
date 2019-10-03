import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotificationState();
  }
}

class NotificationState extends State<NotificationPage> {
  Widget _notificationTab(String imagePath, DocumentSnapshot document) {        // a ready-to-use widget that is used to make a list of notification.(2)
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
  Widget build(BuildContext context) {            // fullscreen listview that shows notification from firebase (hard coded from firebase)
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification Page',
          style: TextStyle(color: Colors.white),
        ),
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
          }),
    );
  }
}
