import 'package:flutter/material.dart';
import 'package:prana_registerform/screen/page_one.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PageOne(),
      debugShowCheckedModeBanner: false,
    );
  }
}
