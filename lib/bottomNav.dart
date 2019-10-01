import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './cal.dart';
import './notification.dart';
import './chat.dart';
class BottomNav extends StatefulWidget {
  static const String id = "BOTTOMNAV";

  @override
  State<StatefulWidget> createState() {
    return BottomNavState();
  }
}

class BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  final List<Widget> _children = [Calculator(), ChatScreen(), Calculator()];

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

void _onItemTapped(int index) {
  print('index: ' + index.toString());
  if (index > 1) {
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
<<<<<<< HEAD
    body: Column(
        children: <Widget>[
          _children[_selectedIndex],
        ],
      ),
=======
    body: _children[_selectedIndex],
>>>>>>> 9c1678f6e5430eb87b01d2cdf39b3f7fc9aa97dc
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



