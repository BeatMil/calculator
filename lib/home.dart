import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _notificationTab(String imagePath, DocumentSnapshot document) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Image.asset(
            imagePath,
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
    return Column(
      children: <Widget>[
        new Flexible(
          child: StreamBuilder(
              stream: Firestore.instance.collection('post').snapshots,
              builder: (context, snapshots) {
                if (!snapshots.hasData) return const Text('Loading...');
                return ListView.builder(
                  itemExtent: 80,
                  itemCount: snapshots.data.documents.length,
                  itemBuilder: (context, index) => _notificationTab(
                      'assets/mil03.png', snapshots.data.documents[index]),
                );
              }),
        ),
      ],
    );
  }
}
