import 'package:flutter/material.dart';
import 'package:futr/utilities/user_informations.dart';
import 'package:futr/utilities/gender_enum.dart';
import 'dart:math' as math;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic> userInformations = getUserInformations();
  Map<String, bool> fieldsReadOnlyValues = {
    'first name': true,
    'last name': true,
    'e-mail': true,
    'age': true,
    'gender': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: CircleAvatar(
              child: userInformations['picture'],
            ),
            onTap: (){

            },
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: TextEditingController(
                    text: userInformations['first name'],
                  ),
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                  onSubmitted: (value){
                    setState(() {
                      userInformations['first name'] = value;
                      fieldsReadOnlyValues['first name'] = true;
                    });
                  },
                  readOnly: fieldsReadOnlyValues['first name'],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                ),
                onPressed: (){
                  setState(() {
                    fieldsReadOnlyValues['first name'] = false;
                  });
                },
              ),
              Expanded(
                child: TextField(
                  controller: TextEditingController(
                    text: userInformations['last name'],
                  ),
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                  ),
                  onSubmitted: (value){
                    setState(() {
                      userInformations['last name'] = value;
                      fieldsReadOnlyValues['last name'] = true;
                    });
                  },
                  readOnly: fieldsReadOnlyValues['last name'],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                ),
                onPressed: (){
                  setState(() {
                    fieldsReadOnlyValues['last name'] = false;
                  });
                },
              ),
            ],
          ),
            Row(
            children: <Widget>[
              DropdownButton<Gender>(
                value: userInformations['gender'],
                items: [
                  DropdownMenuItem(
                    value: Gender.Male,
                    child: Text('Male'),
                  ),
                  DropdownMenuItem(
                    value: Gender.Female,
                    child: Text('Female'),
                  )
                ],
                onChanged: (value){
                  setState(() {
                    userInformations['gender'] = value;
                  });
                },
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      '${userInformations['age']} years',
                    ),
                    SliderTheme(
                      data: SliderThemeData(

                      ),
                      child: Slider(
                        divisions: 100,
                        max: 100,
                        min: 0,
                        value: userInformations['age'].toDouble(),
                        onChanged: (value){
                          setState(() {
                            userInformations['age'] = value.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
