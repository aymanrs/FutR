import 'package:flutter/material.dart';
import 'create_account_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              icon: Icon(
                Icons.email,
              ),
              labelText: 'e-mail or username',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
              ),
              labelText: 'password',
            ),
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('Forgot your password ?'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()));
                },
              ),
              FlatButton(
                child: Text('Don\'t have an account yet ?\nSign up for free!'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateAnAccountScreen()));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
