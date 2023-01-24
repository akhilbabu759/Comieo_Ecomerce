import 'dart:developer';

import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/auth/sign_in/controller/sigin_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginFrom extends StatelessWidget {
  LoginFrom({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  // late
  double width;

  // late
  double height;
  bool passwordVisible = false;
  final signinController = Get.put(SignInController());
  // final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      builder: (controller) => Form(
          key: SignInController.formGlobalKey,
          child: Column(
            children: [
              const Text('Your email'),
              Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                  child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 34, 34, 34),
                          borderRadius: BorderRadius.circular(7.0),
                          boxShadow: const [
                            BoxShadow(spreadRadius: 0.2, color: Colors.white54)
                          ]),
                      child: Padding(
                          padding: EdgeInsets.only(
                            left: width * 0.03,
                            right: width * 0.03,
                          ),
                          child: TextFormField(
                              style: TextStyle(color: colorWhite),
                              controller: controller.emailController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Email',
                                  labelStyle:
                                      TextStyle(color: Colors.white60)))))),
              const Text('Password'),
              Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                  child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 34, 34, 34),
                          borderRadius: BorderRadius.circular(7.0),
                          boxShadow: const [
                            BoxShadow(spreadRadius: 0.2, color: Colors.white54)
                          ]),
                      child: Padding(
                          padding: EdgeInsets.only(
                            left: width * 0.03,
                            right: width * 0.03,
                          ),
                          child: TextFormField(
                              obscureText: controller.obscureText,
                              style: TextStyle(color: colorWhite),
                              controller: controller.passwordController,
                              decoration:  InputDecoration(
                                suffixIcon:IconButton(
                            onPressed: () {
                              signinController.visibility();
                            },
                            icon: signinController.icon,
                            color: colorWhite,
                          ) ,

                                  border: InputBorder.none,
                                  labelText: 'Password',
                                  labelStyle:
                                      TextStyle(color: Colors.white60)))))),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {}, child: const Text('Forgot password?'))
                ],
              ),

              SizedBox(
                width: width * 0.9,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      if (SignInController.formGlobalKey.currentState!
                          .validate()) {
                        SignInController.formGlobalKey.currentState!.save();
                        
                        signinController.signIn();
                      }
                    },
                    child: const Text('Login')),
              ),
              SizedBox(
                height: height * 0.04,
              ),

              // TextButton(onPressed:() {
              //   log('kk');
              //   log(emailController.text);
              //   log(passwordController.text);

              // }, child: Text('submit'))
            ],
          )),
    );
  }
}
