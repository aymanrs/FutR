import 'package:flutter/material.dart';
import 'package:futr/utilities/compare_maps.dart';
import 'package:futr/utilities/gender_enum.dart';
import 'package:futr/utilities/random_codes_generator.dart';
import 'package:futr/utilities/user_informations.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic> userInformations = getUserInformations();
  Map<String, bool> fieldsReadOnlyValues = {
    'first name': true,
    'last name': true,
    'username': true,
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(userInformations['picture']),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                onTap: () {
                  //TODO choose a photo from the user phone, submit it to the database and change userInformations['picture'] that waits an url
                },
              ),
              Expanded(
                child: TextField(
                  controller: TextEditingController(
                    text: userInformations['username'],
                  ),
                  readOnly: fieldsReadOnlyValues['username'],
                  decoration: InputDecoration(
                    labelText: 'username',
                    icon: Icon(
                      Icons.person,
                    ),
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      userInformations['username'] = value;
                      fieldsReadOnlyValues['username'] = true;
                    });
                  },
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                ),
                onPressed: () {
                  setState(() {
                    fieldsReadOnlyValues['username'] = false;
                  });
                },
              )
            ],
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
                  onSubmitted: (value) {
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
                onPressed: () {
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
                  onSubmitted: (value) {
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
                onPressed: () {
                  setState(() {
                    fieldsReadOnlyValues['last name'] = false;
                  });
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: TextEditingController(
                    text: userInformations['e-mail'],
                  ),
                  readOnly: fieldsReadOnlyValues['e-mail'],
                  decoration: InputDecoration(
                    labelText: 'e-mail',
                    icon: Icon(
                      Icons.email,
                    ),
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      userInformations['e-mail'] = value;
                      fieldsReadOnlyValues['e-mail'] = true;
                    });
                  },
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                ),
                onPressed: () {
                  setState(() {
                    fieldsReadOnlyValues['e-mail'] = false;
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
                onChanged: (value) {
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
                    Slider(
                      divisions: 100,
                      max: 100,
                      min: 0,
                      value: userInformations['age'].toDouble(),
                      onChanged: (value) {
                        setState(() {
                          userInformations['age'] = value.toInt();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          FlatButton(
            child: Text(
              'Save Changes',
            ),
            onPressed: equals(userInformations, getUserInformations())
                ? null
                : () {
              if (getUserInformations()['e-mail']) {
                String code = generate();
                /*TODO: Send an e-mail to the user with the new password and show a dialog box to tell him as he modified
                   his e-mail so he should write the code that is send to his new e-mail*/
              }
              //TODO save the changes
            },
          ),
        ],
      ),
    );
  }
}
