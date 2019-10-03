import 'package:calculator/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './cal.dart';
import './notification.dart';
import './chat.dart';
import './profile.dart';
import './home.dart';

class BottomNav extends StatefulWidget {
  static const String id = "BOTTOMNAV";

  @override
  State<StatefulWidget> createState() {
    return BottomNavState();
  }
}

class BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  final List<Widget> _children = [Home(), ChatScreen(), Profiles(), Calculator()];

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

void _onItemTapped(int index) {
  print('index: ' + index.toString());
  if (index > 2) {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => NotificationPage()));
    print("index is more than 1 : $index");
  }
  else {
    setState(() {
      _selectedIndex = index;
    });
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('DotRoot',
      style: TextStyle(color: Colors.white),),
    ),
    body: _children[_selectedIndex],
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Homy'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble),
          title: Text('Chat'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.portrait),
          title: Text('Profile'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          title: Text('Notification'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    ),
  );
}
  

}



