import 'package:flutter/material.dart';
import 'package:prana_registerform/konstanta.dart';

import '../custom_stepper.dart';
import '../size_config.dart';
import 'form_pagethree.dart';

class PageThree extends StatelessWidget {
  const PageThree({Key key, this.email, this.pass}) : super(key: key);
  final String email;
  final String pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            CustomStepper(page: 3),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Expanded(
              child: Container(
                child: FormPageThree(email: this.email, pass: this.pass),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
