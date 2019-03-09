import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Widget child;

  Register({Key key, this.child}) : super(key: key);

  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            tooltip: 'Upload To Server',
            icon: Icon(Icons.cloud_upload),onPressed: (){
                 print('You Click Upload');

            },
          )
        ],
        title: Text('Register'),
      ),
      body: ListView(
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
    );
  }
}

Widget nameTextField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Name', hintText: 'Name Only'),
  );
}

Widget emailTextField() {
  return TextFormField(
    decoration:
        InputDecoration(labelText: 'Email Address :', hintText: 'you@abc.com'),
  );
}

Widget passwordTextField() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Password :', hintText: 'password'),
  );
}
