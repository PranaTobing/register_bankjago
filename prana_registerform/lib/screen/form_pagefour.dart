import 'package:flutter/material.dart';

import '../default_button.dart';
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
  DateTime pickedDate;
  TimeOfDay time;

  List _namahari = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
    "Minggu"
  ];

  List _namabulan = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "Mei",
    "Jun",
    "Jul",
    "Agu",
    "Sep",
    "Okt",
    "Nov",
    "Des"
  ];

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

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: (pickedDate != null) ? pickedDate : DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  _pickTime() async {
    TimeOfDay jam = await showTimePicker(
      context: context,
      initialTime: (time != null) ? time : new TimeOfDay.now(),
    );

    if (jam != null) {
      setState(() {
        time = jam;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(time);
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
              height: getProportionateScreenHeight(20),
            ),
            Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Date',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                child: ListTile(
                  visualDensity: VisualDensity(vertical: -4),
                  title: Transform(
                    transform: Matrix4.translationValues(-16, 0.0, 0.0),
                    child: Text((() {
                      if (pickedDate != null) {
                        return "${_namahari[pickedDate.weekday - 1]}, ${pickedDate.day} ${_namabulan[pickedDate.month - 1]} ${pickedDate.year}";
                      } else {
                        return "- Choose Date -";
                      }
                    }())),
                  ),
                  trailing: Transform(
                    transform: Matrix4.translationValues(16, 0.0, 0.0),
                    child: Icon(Icons.keyboard_arrow_down),
                  ),
                  onTap: _pickDate,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Time',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                child: ListTile(
                  visualDensity: VisualDensity(vertical: -4),
                  title: Transform(
                    transform: Matrix4.translationValues(-16, 0.0, 0.0),
                    child: Text((() {
                      if (time != null) {
                        return "${time.hour} : ${time.minute}";
                      } else {
                        return "- Choose Time -";
                      }
                    }())),
                  ),
                  trailing: Transform(
                    transform: Matrix4.translationValues(16, 0.0, 0.0),
                    child: Icon(Icons.keyboard_arrow_down),
                  ),
                  onTap: _pickTime,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
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
