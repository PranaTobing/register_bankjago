import 'package:flutter/material.dart';
import 'package:prana_registerform/konstanta.dart';
import 'package:prana_registerform/screen/form_pagetwo.dart';

import '../custom_stepper.dart';
import '../size_config.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({
    Key key,
    this.email,
  }) : super(key: key);
  final String email;
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
            CustomStepper(page: 2),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Expanded(
              child: Container(
                child: FormPageTwo(email: this.email),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
