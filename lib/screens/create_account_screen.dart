import 'package:flutter/material.dart';

class CreateAnAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'First name'),
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Last name'),
                ),
              ),
            ],
          ),
          FlatButton(
            child: Text(
              'Sign up !',
            ),
            onPressed: () {
              //TODO: create a new account
            },
          )
        ],
      ),
    );
  }
}