import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './cal.dart';
import './notification.dart';
import './fish.dart';
class BottomNav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavState();
  }
}

class BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  final List<Widget> _children = [Calculator(), Fish(), Fish()];

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
  Text(
    'Index 0: Calculator',
    style: optionStyle,
  ),
  Text(
     'Index 1: Notification',
     style: optionStyle,
  ),
  Text(
     'Index 2: School',
     style: optionStyle,
  ),
];

void _onItemTapped(int index) {
  print('index: ' + index.toString());
  if (index > 1) {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => NotificationPage()));
    print("index is more than 2 : $index");
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
      title: const Text('BottomNavigationBar Sample'),
    ),
    body: Center(
      child: Column(
        children: <Widget>[
          _widgetOptions.elementAt(_selectedIndex),
          _children[_selectedIndex]
        ],
      ),
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Homy'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('Business'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          title: Text('School'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    ),
  );
}
  

}



