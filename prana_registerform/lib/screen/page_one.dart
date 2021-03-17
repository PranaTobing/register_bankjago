import 'package:flutter/material.dart';
import 'package:prana_registerform/konstanta.dart';

import '../custom_stepper.dart';
import '../size_config.dart';
import 'form_pageone.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(75),
            ),
            CustomStepper(page: 1),
            SizedBox(
              height: getProportionateScreenHeight(85),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: FormPageOne(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
