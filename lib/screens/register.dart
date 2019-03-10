import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import '../main.dart';

class Register extends StatefulWidget {
  final Widget child;

  Register({Key key, this.child}) : super(key: key);

  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  String nameString = '';
  String emailString = '';
  String passwordString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              tooltip: 'Upload To Server',
              icon: Icon(Icons.cloud_upload),
              onPressed: () {
                uploadToServer();
              },
            )
          ],
          title: Text('Register'),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0),
                child: nameTextField(),
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 30.0),
                child: emailTextField(),
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 30.0),
                child: passwordTextField(),
              )
            ],
          ),
        ));
  }

  void uploadToServer() {
    print('You Click Upload');
    // formKey.currentState.reset();
    print(formKey.currentState.validate());
    formKey.currentState.save();
    print('Name = $nameString,emali = $emailString,password = $passwordString');
    sentNewUserToServer(nameString, emailString, passwordString);
  }

  void sentNewUserToServer(
      String userName, String userEmail, String userPassword) async {
    String url =
        'http://www.androidthai.in.th/sun/addUserMint.php?isAdd=true&Name=$userName&User=$userEmail&Password=$userPassword';

    var response = await get(url);
    var result = json.decode(response.body);
    print('result ==> $result');

    if (result.toString() == 'true') {
      print('Back Process');
       Navigator.pop(context);
      
    } else {}
  }

  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name', hintText: 'Name Only'),
      validator: (String value) {
        if (value.length == 0) {
          return 'Name not Blank ?';
        }
      },
      onSaved: (String name) {
        nameString = name;
      },
    );
  }

  Widget emailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email Address :', hintText: 'you@abc.com'),
      validator: (String email) {
        if (!email.contains('@')) {
          return 'Please Fill Email Format';
        }
      },
      onSaved: (String email) {
        emailString = email;
      },
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration:
          InputDecoration(labelText: 'Password :', hintText: 'password'),
      validator: (String password) {
        if (password.length <= 5) {
          return 'Password must more 5 Charator';
        }
      },
      onSaved: (String password) {
        passwordString = password;
      },
    );
  }
} //_RegisterState Class
