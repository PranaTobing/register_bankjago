import 'package:flutter/material.dart';
import 'package:prana_registerform/screen/page_four.dart';

import '../default_button.dart';
import '../konstanta.dart';
import '../size_config.dart';

class FormPageThree extends StatefulWidget {
  final String email;
  final String pass;

  const FormPageThree({Key key, this.email, this.pass}) : super(key: key);
  @override
  _FormPageThreeState createState() => _FormPageThreeState();
}

class _FormPageThreeState extends State<FormPageThree> {
  String _valAct = 'default';
  String _valIncome = 'default';
  String _valOutcome = 'default';

  TextEditingController actController = TextEditingController();
  TextEditingController inController = TextEditingController();
  TextEditingController outController = TextEditingController();

  List _listFromActivity = [
    {'value': 'default', 'name': '- Chose Option -'},
    {'value': 'Gardening', 'name': 'Gardening'},
    {'value': 'Gaming', 'name': 'Gaming'},
    {'value': 'Painting', 'name': 'Painting'},
    {'value': 'Shoping', 'name': 'Shoping'},
    {'value': 'Traveling', 'name': 'Traveling'},
    {'value': 'Writing', 'name': 'Writing'},
  ];

  List _listFromIncome = [
    {'value': 'default', 'name': '- Chose Option -'},
    {'value': 'Under Rp. 500.000', 'name': 'Under Rp. 500.000'},
    {
      'value': 'Rp. 500.000 - Rp. 1.000.000',
      'name': 'Rp. 500.000 - Rp. 1.000.000'
    },
    {
      'value': 'Rp. 1.000.000 - Rp. 3.000.000',
      'name': 'Rp. 1.000.000 - Rp. 3.000.000'
    },
    {
      'value': 'Rp. 3.000.000 - Rp. 5.000.000',
      'name': 'Rp. 3.000.000 - Rp. 5.000.000'
    },
    {
      'value': 'Rp. 5.000.000 - Rp. 10.000.000',
      'name': 'Rp. 5.000.000 - Rp. 10.000.000'
    },
    {'value': 'Above Rp. 10.000.000', 'name': 'Above Rp. 10.000.000'},
  ];

  List _listFromOutcome = [
    {'value': 'default', 'name': '- Chose Option -'},
    {'value': 'Under Rp. 500.000', 'name': 'Under Rp. 500.000'},
    {
      'value': 'Rp. 500.000 - Rp. 1.000.000',
      'name': 'Rp. 500.000 - Rp. 1.000.000'
    },
    {
      'value': 'Rp. 1.000.000 - Rp. 3.000.000',
      'name': 'Rp. 1.000.000 - Rp. 3.000.000'
    },
    {
      'value': 'Rp. 3.000.000 - Rp. 5.000.000',
      'name': 'Rp. 3.000.000 - Rp. 5.000.000'
    },
    {
      'value': 'Rp. 5.000.000 - Rp. 10.000.000',
      'name': 'Rp. 5.000.000 - Rp. 10.000.000'
    },
    {'value': 'Above Rp. 10.000.000', 'name': 'Above Rp. 10.000.000'},
  ];

  final _formKey = GlobalKey<FormState>();

  checkForm(theemail, thepass) {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PageFour(
              email: theemail,
              pass: thepass,
              valact: _valAct,
              valin: _valIncome,
              valout: _valOutcome),
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
              'Personal Information',
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Text(
              'Please fill in the information below and your goal for digital saving',
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(15),
                  color: Colors.white),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildDropDown(_valAct, _listFromActivity, 1),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            buildDropDown(_valIncome, _listFromIncome, 2),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            buildDropDown(_valOutcome, _listFromOutcome, 3),
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

  Container buildDropDown(val, thelist, cond) {
    List thelistbuild = thelist;
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(5)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          filled: true,
          labelText: (() {
            if (cond == 1) {
              return "Goal for Activation";
            } else if (cond == 2) {
              return "Monthly Income";
            } else {
              return "Monthly Outcome";
            }
          }()),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
            color: kTextColor,
          ),
          fillColor: Colors.white,
        ),
        value: val,
        items: thelistbuild.map((f) {
          return DropdownMenuItem(
            child: Text(f['name']),
            value: f['value'],
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            if (cond == 1) {
              _valAct = value;
            } else if (cond == 2) {
              _valIncome = value;
            } else {
              _valOutcome = value;
            }
          });
        },
        validator: (value) {
          if (value == 'default') {
            return 'Plase input the field';
          }
          return null;
        },
      ),
    );
  }
}
