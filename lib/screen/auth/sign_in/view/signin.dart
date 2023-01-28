import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/auth/sign_in/controller/sigin_in_controller.dart';
import 'package:ecomerce/screen/auth/signup/view/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'form/login_form.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signinControl = Get.put(SignInController());
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    return Scaffold(
      backgroundColor:colorWhite,
      body: GetBuilder<SignInController>(
        builder: (controller) {
          return signinControl.isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(
                    color: colorWhite,
                    backgroundColor: Colors.cyan,
                  ),
                )
              : SafeArea(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text(
                          'Comieo',
                          style: textstyle,
                        )
                      ],
                    ),
                    textFieldGap,
                    LoginFrom(width: width, height: height),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Don't have account? ",style: TextStyle(color: colorblack),
                        children: <TextSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(SignupPage());
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
                ));
        },
      ),
    );
  }
}
