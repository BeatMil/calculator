import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Profiles extends StatefulWidget {
  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  //Profile config
  String name = "[Insert name here]";
  String description = "[Insert description here]";

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
              ),
              child: Image.asset(
                'assets/MugiQT.png',
                height: 200,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 14),
              child: Text(
                name,
                style: TextStyle(fontSize: 28.0,),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 14),
              child: Text(description, style: TextStyle(fontSize: 24.0))),
          ],
        ),
        Divider(
          indent: 10,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.orange),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Text(
                  "Post",
                  style: TextStyle(fontSize: 25),
                ),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black54)),
              ),
              Container(
                  child: Text(
                    "Like",
                    style: TextStyle(fontSize: 25),
                  ),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.orange))),
              Container(
                  child: Text(
                    "Reroot",
                    style: TextStyle(fontSize: 25),
                  ),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.orange))),
            ],
          ),
        ),
        new Flexible(
          child: StreamBuilder(
            stream: Firestore.instance.collection('post').snapshots,
            builder: (context, snapshots) {
              if (!snapshots.hasData) return const Text('Loading...');
              return ListView.builder(
                itemExtent: 80,
                itemCount: snapshots.data.documents.length,
                itemBuilder: (context, index) => _notificationTab(
                    'assets/MugiQT.png', snapshots.data.documents[index]),
              );
            }),
        )
      ],
    );
  }
}
