import 'dart:developer';

import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/auth/signup/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupFrom extends StatelessWidget {
  SignupFrom({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final num width;

  final num height;

 final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(builder: (controller) {
      return Form(
          key: SignupController.formGlobalKey,
          child: Column(
            children: [
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
                              validator: (value) =>
                                  signupController.nameValidation(value),
                              style: const TextStyle(color: colorWhite),
                              controller: signupController.usernameController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Full name',
                                  labelStyle:
                                      TextStyle(color: Colors.white60)))))),
              textFieldGap,
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
                              validator: ((value) =>
                                  signupController.mobileValdation(value)),
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: colorWhite),
                              controller: signupController.phoneController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Phone',
                                  labelStyle:
                                      TextStyle(color: Colors.white60)))))),
              textFieldGap,
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
                              validator: ((value) =>
                                  signupController.emailValdation(value)),
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(color: colorWhite),
                              controller: signupController.emailController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Email',
                                  labelStyle:
                                      TextStyle(color: Colors.white60)))))),
              textFieldGap,
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
                              validator: ((value) =>
                                  signupController.passwordValdation(value)),
                              style: const TextStyle(color: colorWhite),
                              controller: signupController.passwordController,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      signupController.visibility();
                                    },
                                    icon: signupController.icon,
                                    color: colorWhite,
                                  ),
                                  border: InputBorder.none,
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(
                                      color: Colors.white60)))))),
              textFieldGap,
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
                              validator: ((value) => signupController
                                  .confirmpasswordValdation(value)),
                              style: const TextStyle(color: colorWhite),
                              controller:
                                  signupController.conformpasswordController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Confirm Password',
                                  labelStyle:
                                      TextStyle(color: Colors.white60)))))),
              textFieldGap,
              SizedBox(
                width: width * 0.9,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      log('before');
                      log(SignupController()
                          .usernameController
                          .value
                          .toString());
                      log(SignupController().emailController.text);
                      log(SignupController().phoneController.text);
                      log(SignupController().passwordController.text);

                      if (SignupController.formGlobalKey.currentState!
                          .validate()) {
                        SignupController.formGlobalKey.currentState!.save();
                        signupController.addUser(context);
                      }
                    },
                    child: const Text('Create account')),
              ),
              SizedBox(
                height: height * 0.04,
              ),
            ],
          ));
    });
  }
}
