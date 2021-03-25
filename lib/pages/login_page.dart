import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';

import 'package:green_house/pages/home_page.dart';
import '../widgets/custom_button.dart';
import '../widgets/constants.dart';
import '../widgets/text_class.dart';
import '../widgets/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: 'Welcome,', colour: Colors.black, fontsize: 30),
                CustomText(text: 'Sign Up', colour: kPrimaryColor, fontsize: 18)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'Sign in to continue',
              colour: Colors.grey,
              fontsize: 15,
              kAlignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextFormField(
              text: 'Email',
              hint: 'exmp@example.com',
              onSaved: (value) {},
              validator: (value) {},
            ),
            SizedBox(
              height: 40,
            ),
            CustomTextFormField(
              text: 'Password',
              hint: '***********',
              onSaved: (value) {},
              validator: (value) {},
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: 'Forgot Password',
              colour: Colors.black,
              fontsize: 14,
              kAlignment: Alignment.topRight,
            ),
            SizedBox(
              height: 20,
            ),
            CustomAppButton(
              btnText: 'SIGN IN',
              btnOnPressed: () {
                Get.to(() => HomePage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
//         // height: MediaQuery.of(context).size.height,
//         // width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//               Color(0xFF3383CD),
//               Color(0xFF11249F),
//             ])),
//         child: Padding(
//           padding: EdgeInsets.only(bottom: 70),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                   padding: EdgeInsets.only(left: 20),
//                   child: CustomText(
//                     text: 'Welcome',
//                     colour: Colors.black,
//                     fontsize: 25,
//                   )),
//               SizedBox(
//                 height: 50,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 20, right: 20),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     alignLabelWithHint: true,
//                     hintText: 'Username',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 20, right: 20),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     alignLabelWithHint: true,
//                     hintText: 'Password',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               Container(
//                 width: size.width * 0.8,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(29),
//                   child: FlatButton(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//                       color: Color(0xFF5D00FF),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => HomePage(),
//                           ),
//                         );
//                       },
//                       child: Text(
//                         'Login',
//                         style: TextStyle(color: Colors.white),
//                       )),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
