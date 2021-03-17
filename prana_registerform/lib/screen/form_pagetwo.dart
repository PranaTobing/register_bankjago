import 'package:flutter/material.dart';

import '../default_button.dart';
import '../konstanta.dart';
import '../size_config.dart';
import 'page_three.dart';

class FormPageTwo extends StatefulWidget {
  final String email;

  const FormPageTwo({Key key, this.email}) : super(key: key);
  @override
  _FormPageTwoState createState() => _FormPageTwoState();
}

class _FormPageTwoState extends State<FormPageTwo> {
  bool _obsecureText = true;
  int _textLower = 0;
  int _textUpper = 0;
  int _textNumber = 0;
  int _textChar = 0;
  String _textTotVal = '';

  TextEditingController passController = TextEditingController();
  String passfield;

  final _formKey = GlobalKey<FormState>();

  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  checkForm(theemail, thepass) {
    final form = _formKey.currentState;
    final totalCom = _textLower + _textUpper + _textNumber + _textChar;
    if (form.validate() && totalCom == 4) {
      form.save();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PageThree(email: theemail, pass: thepass),
        ),
      );
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
                  fontSize: getProportionateScreenWidth(15),
                  color: Colors.white),
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            TextFormField(
              controller: passController,
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
                if (value.isEmpty) {
                  return 'Plase input the password';
                } else if (value.length < 6) {
                  return 'Please input minimum 6 characters';
                }
                return null;
              },
              onChanged: (text) {
                setState(() {
                  _textTotVal = '';
                });
                if (text.contains(RegExp(r'[a-z]'))) {
                  setState(() {
                    _textLower = 1;
                  });
                } else {
                  setState(() {
                    _textLower = 0;
                  });
                }

                if (text.contains(RegExp(r'[A-Z]'))) {
                  setState(() {
                    _textUpper = 1;
                  });
                } else {
                  setState(() {
                    _textUpper = 0;
                  });
                }

                if (text.contains(RegExp(r'[0-9]'))) {
                  setState(() {
                    _textNumber = 1;
                  });
                } else {
                  setState(() {
                    _textNumber = 0;
                  });
                }

                if (text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                  setState(() {
                    _textChar = 1;
                  });
                } else {
                  setState(() {
                    _textChar = 0;
                  });
                }

                if ((_textLower + _textUpper + _textNumber + _textChar) == 4) {
                  setState(() {
                    _textTotVal = 'Very Strong';
                  });
                } else if ((_textLower +
                        _textUpper +
                        _textNumber +
                        _textChar) ==
                    3) {
                  setState(() {
                    _textTotVal = 'Strong';
                  });
                } else if ((_textLower +
                        _textUpper +
                        _textNumber +
                        _textChar) ==
                    2) {
                  setState(() {
                    _textTotVal = 'Weak';
                  });
                } else if ((_textLower +
                        _textUpper +
                        _textNumber +
                        _textChar) ==
                    1) {
                  setState(() {
                    _textTotVal = 'Very Weak';
                  });
                } else {
                  setState(() {
                    _textTotVal = '';
                  });
                }
              },
            ),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            Row(
              children: [
                Text(
                  'Complexity: ',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      color: Colors.white),
                ),
                Text(_textTotVal,
                    style: (() {
                      if (_textTotVal == 'Very Strong') {
                        return TextStyle(
                            fontSize: getProportionateScreenWidth(14),
                            color: Colors.green);
                      } else if (_textTotVal == 'Strong') {
                        return TextStyle(
                            fontSize: getProportionateScreenWidth(14),
                            color: Colors.lime);
                      } else if (_textTotVal == 'Weak') {
                        return TextStyle(
                            fontSize: getProportionateScreenWidth(14),
                            color: Colors.orange);
                      } else {
                        return TextStyle(
                            fontSize: getProportionateScreenWidth(14),
                            color: Colors.red);
                      }
                    }())),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    (_textLower == 1)
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
                    (_textUpper == 1)
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
                    (_textNumber == 1)
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
                    (_textChar == 1)
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
                press: () {
                  passfield = passController.text;
                  setState(() {
                    checkForm(widget.email, passfield);
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
