import 'package:flutter/material.dart';
import 'package:prana_registerform/size_config.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({
    Key key,
    this.page,
  }) : super(key: key);
  final int page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.black45,
            radius: 27,
            child: CircleAvatar(
              backgroundColor: (page > 1) ? Colors.green[200] : Colors.white,
              radius: 25,
              child: Text(
                "1",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(30),
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Divider(
                color: Colors.black,
                height: 50,
                thickness: 2,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.black45,
            radius: 27,
            child: CircleAvatar(
              backgroundColor: (page > 2) ? Colors.green[200] : Colors.white,
              radius: 25,
              child: Text(
                "2",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(30),
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Divider(
                color: Colors.black,
                height: 50,
                thickness: 2,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.black45,
            radius: 27,
            child: CircleAvatar(
              backgroundColor: (page > 3) ? Colors.green[200] : Colors.white,
              radius: 25,
              child: Text(
                "3",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(30),
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Divider(
                color: Colors.black,
                height: 50,
                thickness: 2,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.black45,
            radius: 27,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: Text(
                "4",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(30),
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
