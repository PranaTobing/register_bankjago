import 'package:flutter/material.dart';
import 'package:prana_registerform/konstanta.dart';

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
            Text(
              "data",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: getProportionateScreenHeight(200),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
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
                      TextFormField(
                        // controller: uNameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Email",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.grey[400],
                          ),
                          enabledBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.grey),
                            gapPadding: 10,
                          ),
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
