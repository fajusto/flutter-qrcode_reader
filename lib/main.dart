import 'package:flutter/material.dart';
import 'package:fortline_app/Home.dart';

void main() => runApp(
  MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color.fromRGBO(0, 60, 87, 1),
      accentColor: Color.fromRGBO(0, 60, 87, 1)
    ),
  )
);