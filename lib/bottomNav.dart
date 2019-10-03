import 'package:calculator/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './cal.dart';
import './notification.dart';
import './chat.dart';
import './profile.dart';
import './home.dart';

class BottomNav extends StatefulWidget {                          // This is the bottom navigation class
  static const String id = "BOTTOMNAV";                           // It exists in almost every main page except notification.
                                                                  // It's my fault I couldn't make it appear.
  @override
  State<StatefulWidget> createState() {                          
    return BottomNavState();
  }
}

class BottomNavState extends State<BottomNav> {                   
  int _selectedIndex = 0;
  final List<Widget> _children = [                                // here is a list of widgets that contains each page data
    Home(),                                                       
    ChatScreen(),
    Profiles(),
    Calculator()
  ];

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {                                 // the setState function in _onItemTapped is the one that change widget
    print('index: ' + index.toString());
    if (index > 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NotificationPage()));
      print("index is more than 1 : $index");
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {                           
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DotRoot',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _children[_selectedIndex],                        // the widget that changes the page
      bottomNavigationBar: BottomNavigationBar(               // bottom navigation bar
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
