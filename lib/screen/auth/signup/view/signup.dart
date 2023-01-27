import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/auth/signup/controller/controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'signup_form/signup_form.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final emailController = TextEditingController();
  final nameController = TextEditingController();

  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final signupControl = Get.put(SignupController());
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    return GetBuilder<SignupController>(builder: (controller) {
      return signupControl.isLoging == true
          ? const Center(
              child: CircularProgressIndicator(
                color: colorWhite,
                backgroundColor: Colors.cyan,
              ),
            )
          : Scaffold(
              backgroundColor: backgroundColorBlack,
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
    });
  }
}
