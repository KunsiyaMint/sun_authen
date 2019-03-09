import 'package:flutter/material.dart';
import 'screens/register.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sun_Authen',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            // color: Colors.yellow,
            margin: EdgeInsets.only(top: 50.0),
            child: logoShow(),
          ),
          Container(
            alignment: Alignment.center,
            child: titleApp(),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.0, right: 30.0),
            child: emailTextField(),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 15.0),
            child: passwordText(),
          ),
          Container(
            margin: EdgeInsets.only(left: 50.0, right: 50.0),
            child: Row(
              children: <Widget>[
                new Expanded(
                  child: Container(
                    child: signInButton(),
                  ),
                ),
                new Expanded(
                  child: Container(
                    child: signUpButton(context),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget testText() {
  return Text('testText');
}

Widget logoShow() {
  return Image.asset('images/logo.png');
}

Widget titleApp() {
  return Text(
    'Sun Authen',
    style: TextStyle(
        fontSize: 30.0,
        fontFamily: 'DancingScript',
        fontWeight: FontWeight.bold,
        color: Colors.blue[700]),
  );
}

Widget emailTextField() {
  return TextFormField(
    decoration:
        InputDecoration(labelText: 'Email Address:', hintText: 'you@email.com'),
  );
}

Widget passwordText() {
  return TextFormField(
    decoration:
        InputDecoration(labelText: 'Password :', hintText: 'more 5 Charactor'),
  );
}

Widget signInButton() {
  return RaisedButton(
    color: Colors.blue[400],
    child: Text(
      'SignIn',
      style: TextStyle(color: Colors.white),
    ),
    onPressed: () {
      print('You click SignIn');
    },
  );
}

Widget signUpButton(BuildContext context) {
  return RaisedButton(
    color: Colors.blue[300],
    child: Text(
      'signUp',
      style: TextStyle(color: Colors.white),
    ),
    onPressed: () {
      print('You click SignUp');
      var myRounte =
          new MaterialPageRoute(builder: (BuildContext context) => Register());
          Navigator.of(context).push(myRounte);
    },
  );
}
