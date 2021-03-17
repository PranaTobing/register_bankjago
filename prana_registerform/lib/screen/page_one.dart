import 'package:flutter/material.dart';
import 'package:prana_registerform/konstanta.dart';

import '../default_button.dart';
import '../size_config.dart';

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
              height: getProportionateScreenHeight(100),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.black45,
                    radius: 27,
                    child: CircleAvatar(
                      backgroundColor: Colors.green[200],
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
                      backgroundColor: Colors.white,
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
                      backgroundColor: Colors.white,
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
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
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
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(17)),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),
                      Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(15)),
                        color: Colors.white,
                        child: TextFormField(
                          // controller: uNameController,
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
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(120),
                      ),
                      Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: DefaultButton(
                          text: "Next",
                          press: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
