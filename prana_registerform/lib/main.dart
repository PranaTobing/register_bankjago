import 'package:flutter/material.dart';
import 'package:prana_registerform/screen/page_one.dart';
import 'package:prana_registerform/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      home: PageOne(),
      debugShowCheckedModeBanner: false,
    );
  }
}
