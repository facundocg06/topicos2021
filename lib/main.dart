import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_app/pages/homepage.dart';
import 'package:flutter_app/pages/login.dart';
import 'package:flutter_app/pages/registro.dart';
import 'package:flutter_app/pages/suma.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes: {'/': (_) => LoginForm()},
    );
  }
}
