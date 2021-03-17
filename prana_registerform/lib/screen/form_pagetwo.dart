import 'package:flutter/material.dart';

import '../default_button.dart';
import '../konstanta.dart';
import '../size_config.dart';

class FormPageTwo extends StatefulWidget {
  final String email;

  const FormPageTwo({Key key, this.email}) : super(key: key);
  @override
  _FormPageTwoState createState() => _FormPageTwoState();
}

class _FormPageTwoState extends State<FormPageTwo> {
  bool _obsecureText = true;
  bool _textLower = false;
  bool _textUpper = false;
  bool _textNumber = false;
  bool _textChar = false;

  final _formKey = GlobalKey<FormState>();

  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(30)),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Text(
              'Create Password',
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Text(
              'Password will be used to login to account',
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  color: Colors.white),
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            TextFormField(
              // controller: emailController,
              obscureText: _obsecureText,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Create Password",
                hintStyle: TextStyle(color: kTextColor),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye,
                      color: _obsecureText ? kTextColor : kPrimaryColor),
                  onPressed: _toggle,
                ),
              ),
              validator: (value) {
                /* if (value.isEmpty) {
                  return 'Plase input the email';
                } else if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  return 'Please input the rigth email';
                }
                return null;*/
              },
              onChanged: (text) {
                if (text.contains(RegExp(r'[a-z]'))) {
                  setState(() {
                    _textLower = true;
                  });
                } else {
                  setState(() {
                    _textLower = false;
                  });
                }

                if (text.contains(RegExp(r'[A-Z]'))) {
                  setState(() {
                    _textUpper = true;
                  });
                } else {
                  setState(() {
                    _textUpper = false;
                  });
                }

                if (text.contains(RegExp(r'[0-9]'))) {
                  setState(() {
                    _textNumber = true;
                  });
                } else {
                  setState(() {
                    _textNumber = false;
                  });
                }

                if (text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                  setState(() {
                    _textChar = true;
                  });
                } else {
                  setState(() {
                    _textChar = false;
                  });
                }
              },
            ),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            Text(
              'Complexity',
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  color: Colors.white),
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    _textLower
                        ? ChecklistPass()
                        : TextCheckPass(indicator: 'a'),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    KeteranganComp(textKeterangan: 'Lowercase'),
                  ],
                ),
                Column(
                  children: [
                    _textUpper
                        ? ChecklistPass()
                        : TextCheckPass(indicator: 'A'),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    KeteranganComp(textKeterangan: 'Uppercase'),
                  ],
                ),
                Column(
                  children: [
                    _textNumber
                        ? ChecklistPass()
                        : TextCheckPass(indicator: '123'),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    KeteranganComp(textKeterangan: 'Number'),
                  ],
                ),
                Column(
                  children: [
                    _textChar
                        ? ChecklistPass()
                        : TextCheckPass(indicator: '9+'),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    KeteranganComp(textKeterangan: 'Characters'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(100),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: DefaultButton(
                text: "Next",
                press: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KeteranganComp extends StatelessWidget {
  const KeteranganComp({
    Key key,
    this.textKeterangan,
  }) : super(key: key);
  final String textKeterangan;

  @override
  Widget build(BuildContext context) {
    return Text(
      textKeterangan,
      style: TextStyle(
          fontSize: getProportionateScreenWidth(14), color: Colors.white),
    );
  }
}

class TextCheckPass extends StatelessWidget {
  const TextCheckPass({
    Key key,
    this.indicator,
  }) : super(key: key);
  final String indicator;
  @override
  Widget build(BuildContext context) {
    return Text(
      indicator,
      style: TextStyle(
          fontSize: getProportionateScreenWidth(30), color: Colors.white),
    );
  }
}

class ChecklistPass extends StatelessWidget {
  const ChecklistPass({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check_circle,
      color: Colors.green,
      size: getProportionateScreenWidth(30),
    );
  }
}
