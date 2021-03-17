import 'package:flutter/material.dart';
import 'package:prana_registerform/screen/page_two.dart';

import '../default_button.dart';
import '../konstanta.dart';
import '../size_config.dart';

class FormPageOne extends StatefulWidget {
  @override
  _FormPageOneState createState() => _FormPageOneState();
}

class _FormPageOneState extends State<FormPageOne> {
  TextEditingController emailController = TextEditingController();
  String emailfield;

  final _formKey = GlobalKey<FormState>();

  checkForm(theemail) {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PageTwo(
            email: theemail,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(30)),
        child: ListView(
          children: [
            Text(
              "Welcome to",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(35),
                  fontWeight: FontWeight.bold),
            ),
            RichText(
              text: TextSpan(
                text: 'GIN ',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(35),
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Finans',
                    style: TextStyle(color: kButtonColor),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Text(
              "Welcome to The Bank of The Future.\nManage and track your accounts on\nthe go.",
              style: TextStyle(fontSize: getProportionateScreenWidth(17)),
            ),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              color: Colors.white,
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: kTextColor),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: kTextColor,
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Plase input the email';
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return 'Please input the rigth email';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(120),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: DefaultButton(
                text: "Next",
                press: () {
                  emailfield = emailController.text;
                  setState(() {
                    checkForm(emailfield);
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
