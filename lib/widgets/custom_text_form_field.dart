import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/text_class.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final Function onSaved;
  final Function validator;

  CustomTextFormField({this.text, this.hint, this.onSaved, this.validator});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        CustomText(
          text: text,
          colour: Colors.grey.shade900,
          fontsize: 14,
          kAlignment: Alignment.topLeft,
        ),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: Colors.white,
          ),
        ),
      ],
    ));
  }
}
