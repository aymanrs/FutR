import 'dart:math';

String generate() {
  String code = '';
  for (int i = 0; i < 7; i++) {
    code += Random().nextInt(10).toString();
  }
  return code;
}
