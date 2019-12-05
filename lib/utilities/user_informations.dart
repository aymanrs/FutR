import 'package:flutter/cupertino.dart';
import 'package:futr/utilities/gender_enum.dart';

Map<String, dynamic> getUserInformations() {
  Map<String, dynamic> userInformations = {
    'picture': Image(
      image: NetworkImage(
          'http://4.bp.blogspot.com/-eEASWO3Ekfk/UfgyY3vzS8I/AAAAAAAAAUI/SP4LRqnSBzM/s1600/Spongebob.jpg'),
    ),
    'first name': 'Ayman',
    'last name': 'Riad Solh',
    'e-mail': 'ayman.riad.solh56@gmail.com',
    'age': 12,
    'gender': Gender.Male,
  };
  //TODO: get user informations as a map
  return userInformations;
}
