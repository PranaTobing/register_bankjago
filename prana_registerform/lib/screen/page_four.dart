import 'package:flutter/material.dart';
import 'package:prana_registerform/konstanta.dart';

import '../custom_stepper.dart';
import '../size_config.dart';
import 'form_pagefour.dart';

class PageFour extends StatefulWidget {
  final String email;
  final String pass;
  final String valact;
  final String valin;
  final String valout;
  const PageFour(
      {Key key, this.email, this.pass, this.valact, this.valin, this.valout})
      : super(key: key);

  @override
  _PageFourState createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

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
            CustomStepper(page: 4),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Container(
              height: getProportionateScreenHeight(80),
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30)),
              alignment: Alignment.centerLeft,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  return Container(
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: CircleBorder(),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0 * animationController.value),
                      child: child,
                    ),
                  );
                },
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    color: kPrimaryColor,
                    icon: Icon(Icons.calendar_today, size: 24),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Expanded(
              child: Container(
                child: FormPageFour(
                  email: widget.email,
                  pass: widget.pass,
                  valact: widget.valact,
                  valin: widget.valin,
                  valout: widget.valout,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
