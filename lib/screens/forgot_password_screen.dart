import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
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
              hintText: 'Type your e-mail adress here',
            ),
          ),
          FlatButton(
            child: Text(
              'Send me a new password',
            ),
            onPressed: () {
              //TODO: send an e-mail to the user with his new password
            },
          )
        ],
      ),
    );
  }
}