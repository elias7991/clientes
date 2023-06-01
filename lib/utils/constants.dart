import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {

  // static text styles
  static const infoTextStyle = TextStyle(
    fontStyle: FontStyle.normal,
    fontSize: 14,
    fontWeight: FontWeight.w400
  );
  static const alertTextStyle = TextStyle(
    fontStyle: FontStyle.normal,
    fontSize: 14,
    fontWeight: FontWeight.w600
  );
  static const linkTextStyle = TextStyle(
    decoration: TextDecoration.underline,
    color: Colors.blue
  );


  // static colors
  static const Color success = Color(0xff4AB648);
  static const Color fail = Color(0xffC53030);


  // static texts
  static String emptyUsername = 'Debe ingresar un nombre de usuario.';
  static String emptyPassword = 'Debe ingresar una contraseña.';

}