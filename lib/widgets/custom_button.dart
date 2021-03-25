import 'package:flutter/material.dart';

import '../pages/home_page.dart';

import '../widgets/text_class.dart';
import '../widgets/constants.dart';

class CustomAppButton extends StatelessWidget {
  CustomAppButton({this.btnText, this.btnOnPressed});

  final String btnText;
  final Function btnOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: kPrimaryColor)),
            ),
          ),
          onPressed: btnOnPressed,
          child: CustomText(
            text: btnText,
            colour: Colors.white,
            fontsize: 18,
            kAlignment: Alignment.center,
          )),
    );
  }
}
