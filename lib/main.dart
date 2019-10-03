import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './bottomNav.dart';


// first page
// including register page and login page

// main fucntion
void main() => runApp(MyApp());

/*
  Flutter app always start off with MaterialApp()
  Here in this main.dart. There are 3 routes
  MyHomePage, Login and Registration.
  The chat one is not working in here
  I guess I should delete it.
*/

/*
  In flutter, the layout is controlled by widgets. For example, Column widget and Row widget.
  I can make a table out of just Column and Row alone.
  There are some other important widgets, such as container.
  Container would let me create barrier around what inside.
*/

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(                                     // Material App here
                                                            // This is configuration of MaterialApp
      debugShowCheckedModeBanner: false,                    // remove the debug label on top right corner
      title: 'dotroot',                                     // hidden title of the app
      theme: ThemeData.dark(),                              // theme of the app
      initialRoute: MyHomePage.id,                          // first page of the app
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        Login.id: (context) => Login(),
        Registration.id: (context) => Registration(),
        // Chat.id: (context) => Chat(),
        BottomNav.id: (context) => BottomNav(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {                   // The first page of the app
  static const String id = "HOMESCREEN";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(  
        appBar: AppBar(                                     // Appbar shows 'DotRoot' on top
          title: const Text(
            'DotRoot',
            style: TextStyle(                              // configuration of the 'DotRoot' text on top
              color: Colors.white, fontSize: 30.0),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,     // flutter use the Column and Row widget? to control the layout
          children: <Widget>[                              // there are more than just those two but the main ones I use are those.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset(                    // the suppose to be logo of dotroot
                      'assets/mil03.png',                  // size of the pic
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(                                      
              height: 50.0,
            ),
            CustomButton(                                 // see the CustomeButton class below
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

class CustomButton extends StatelessWidget {            // This is the CustomButton class that "I" have created from Youtube.
  final VoidCallback callback;                          // It will paste a template of a button with text and navigator path to fill.
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

class Login extends StatefulWidget {                // Login page 
  static const String id = "LOGIN";                 // I have been trying to connect it to firebase
                                                    // however I have not succeed.

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

class Registration extends StatefulWidget {                     // Registration Page
  static const String id = "REGISTRATION";                      // I have also try to connect this to firebase
                                                                // and same I have not succeed.
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

// class Chat extends StatefulWidget {
//   static const String id = "CHAT";
  


//   @override
//   _ChatState createState() => _ChatState();
// }

// class _ChatState extends State<Chat> {
//   // final Firestore _firestore = Firestore.instance;

//   TextEditingController messageController = TextEditingController();
//   ScrollController scrollController = ScrollController();


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Hero(
//           tag: 'logo',
//           child: Container(
//             height: 40.0,
//             child: Image.asset('assets/Mil02.png'),
//           ),

//         ),
//       ),
//     );
//   }
// }
