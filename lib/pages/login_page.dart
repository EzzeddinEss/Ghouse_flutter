import 'package:flutter/material.dart';

import 'package:green_house/pages/home_page.dart';
import '../widgets/text_class.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ])),
        child: Padding(
          padding: EdgeInsets.only(bottom: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: CustomText(
                    text: 'Welcome',
                    colour: Colors.black,
                    fontsize: 25,
                  )),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    hintText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      color: Color(0xFF5D00FF),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
