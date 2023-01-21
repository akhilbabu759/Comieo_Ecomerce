import 'dart:developer';

import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'signup_form/signup_form.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  late Size size;
  late double height;
  late double width;
  var emailController = TextEditingController();
  var nameController = TextEditingController();

  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: backgroundColorBlack,
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),

           

            SignupFrom(
              height: height * 0.4,
              width: width * 1.01,
            ),
            textFieldGap,
             RichText(
            text: TextSpan(
              text: "already have account? ",
              
              children: <TextSpan>[
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                       Get.back();
                     
                    },
               
                  text: 'Signup',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
              ],
            ),
          )

           
          ],
        )),
      ),
    );
  }
}
