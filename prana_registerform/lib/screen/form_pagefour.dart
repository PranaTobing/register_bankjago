import 'package:flutter/material.dart';

import '../default_button.dart';
import '../konstanta.dart';
import '../size_config.dart';

class FormPageFour extends StatefulWidget {
  final String email;
  final String pass;
  final String valact;
  final String valin;
  final String valout;

  const FormPageFour(
      {Key key, this.email, this.pass, this.valact, this.valin, this.valout})
      : super(key: key);
  @override
  _FormPageFourState createState() => _FormPageFourState();
}

class _FormPageFourState extends State<FormPageFour> {
  AnimationController animationController;

  final _formKey = GlobalKey<FormState>();

  checkForm(theemail, thepass) {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      /* Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PageFour(
              email: theemail,
              pass: thepass,
              valact: _valAct,
              valin: _valIncome,
              valout: _valOutcome),
        ),
      );*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(20)),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Text(
              'Schedule Video Call',
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Text(
              'Choose the date and time that you preferred, we will send a link via email to make a video call on the scheduled date and time',
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(15),
                  color: Colors.white),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: DefaultButton(
                text: "Next",
                press: () {
                  setState(() {
                    checkForm(widget.email, widget.pass);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
