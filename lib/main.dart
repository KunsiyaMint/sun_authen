import 'package:flutter/material.dart';
import 'screens/register.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import './models/json_model.dart';
import './screens/service.dart';

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
  final formKey = GlobalKey<FormState>();
  final _scaffold = GlobalKey<ScaffoldState>();

  String emailString, passwordString, nameString, truePassword, idString;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffold,
        body: Form(
          key: formKey,
          child: ListView(
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
                        child: signInButton(context),
                      ),
                    ),
                    new Expanded(
                      child: Container(
                        child: signUpButton(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
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
      decoration: InputDecoration(
          labelText: 'Email Address:', hintText: 'you@email.com'),
      validator: (String value) {
        if (!value.contains('@')) {
          return 'False Email Format';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Password :', hintText: 'more 5 Charactor'),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Password must more 5 Charator';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  Widget signInButton(BuildContext context) {
    return RaisedButton(
      color: Colors.blue[400],
      child: Text(
        'SignIn',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('You click SignIn');
        // print(formKey.currentState.validate());
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          checkEmailAndPass(context, emailString, passwordString);
        }
      },
    );
  }

  void checkEmailAndPass(
      BuildContext context, String email, String password) async {
    print('email ==> $email,password ==> $password');

    String urlString =
        'http://androidthai.in.th/sun/getUserWhereUserMint.php?isAdd=true&User=$email';
    var response = await get(urlString);
    var result = json.decode(response.body);
    print('result ==> $result');
    if (result.toString() == 'null') {
      showSnackBar('User False');
    } else {
      for (var data in result) {
        print('data ==> $data');
        var jsonModel = JsonModel.fromJson(data);

        truePassword = jsonModel.password.toString();
        nameString = jsonModel.name.toString();
        idString = jsonModel.id.toString();

        print(
            'id ==> $idString, name ==> $nameString, truePassword ==> $truePassword');
      }
      if (passwordString == truePassword) {
        showSnackBar('Welcome $nameString');
        var serviceRoute =
            new MaterialPageRoute(builder: (BuildContext context) => Service(nameLoginString: nameString,));
            Navigator.of(context).push(serviceRoute);
      } else {
        showSnackBar('Password False Please Try agin');
      }
    } //if
  }

  void showSnackBar(String messageString) {
    final snackbar = new SnackBar(
      content: Text(messageString),
      backgroundColor: Colors.orange,
      duration: new Duration(seconds: 8),
      action: new SnackBarAction(
        label: 'Please Click',
        onPressed: () {
          print('You Click SnackBar');
        },
      ),
    );
    _scaffold.currentState.showSnackBar(snackbar);
  }

  Widget signUpButton() {
    return RaisedButton(
      color: Colors.blue[300],
      child: Text(
        'signUp',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('You click SignUp');
        var myRounte = new MaterialPageRoute(
            builder: (BuildContext context) => Register());
        Navigator.of(context).push(myRounte);
      },
    );
  }
} //_HomePageState
