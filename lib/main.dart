import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './bottomNav.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'dotRoot ',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.light,
        backgroundColor: Colors.red,
        appBarTheme: AppBarTheme(color: Colors.black87),
        textTheme: TextTheme(title: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white54)
      ),
      home: new BottomNav(),
    );
  }
}
=======
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        Login.id: (context) => Login(),
        Registration.id: (context) => Registration(),
        Chat.id: (context) => Chat(),
        BottomNav.id: (context) => BottomNav(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const String id = "HOMESCREEN";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: const Text(
            'DotRoot',
            style: TextStyle(color: Colors.white, fontSize: 30.0),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset(
                      'assets/mil03.png',
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            CustomButton(
              text: "Log in",
              callback: () {
                Navigator.of(context).pushNamed(Login.id);
              },
            ),
            CustomButton(
              text: "Registration",
              callback: () {
                Navigator.of(context).pushNamed(Registration.id);
              },
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CustomButton({Key key, this.callback, this.text}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
        child: Material(
          color: Colors.orange,
          elevation: 6.0,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: callback,
            minWidth: 200.0,
            height: 45.0,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ));
  }
}

class Login extends StatefulWidget {
  static const String id = "LOGIN";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;


  Future<void> loginUser() async {


    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNav(),
        ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DotRoot Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset('assets/mil03.png'),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => email = value,
            decoration: InputDecoration(
                hintText: 'Email', border: const OutlineInputBorder()),
          ),
          TextField(
              autocorrect: false,
              obscureText: true,
              onChanged: (value) => email = value,
              decoration: InputDecoration(
                  hintText: 'Password', border: const OutlineInputBorder())),
          CustomButton(
            text: 'Login',
            callback: () async {
              Navigator.of(context).pushNamed(BottomNav.id);
            },
          )
        ],
      ),
    );
  }
}

class Registration extends StatefulWidget {
  static const String id = "REGISTRATION";

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DotRoot Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset('assets/mil03.png'),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => email = value,
            decoration: InputDecoration(
                hintText: 'Email', border: const OutlineInputBorder()),
          ),
          TextField(
              autocorrect: false,
              obscureText: true,
              onChanged: (value) => email = value,
              decoration: InputDecoration(
                  hintText: 'Password (8 characters mininum)',
                  border: const OutlineInputBorder())),
          CustomButton(
            text: 'Register',
            callback: () async {
            },
          ),
        ],
      ),
    );
  }
}

class Chat extends StatefulWidget {
  static const String id = "CHAT";
  


  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  // final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
>>>>>>> 9c1678f6e5430eb87b01d2cdf39b3f7fc9aa97dc


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Hero(
          tag: 'logo',
          child: Container(
            height: 40.0,
            child: Image.asset('assets/Mil02.png'),
          ),

        ),
      ),
    );
  }
}
