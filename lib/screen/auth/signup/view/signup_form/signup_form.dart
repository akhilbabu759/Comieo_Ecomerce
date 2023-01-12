import 'dart:developer';

import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/auth/signup/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class SignupFrom extends StatelessWidget {
  SignupFrom({
    Key? key,
    required this.width,
    // required this.emailController,
    // required this.passwordController,
    required this.height,
  }) : super(key: key);

  late num width;
  // final TextEditingController emailController;
  // final TextEditingController passwordController;
  late num height;
   final formGlobalKey = GlobalKey<FormState>();
  final signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      builder: (controller) {
        return Form(key: formGlobalKey,
            child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 34, 34, 34),
                        borderRadius:  BorderRadius.circular(7.0),
                        boxShadow:const [
                          BoxShadow(spreadRadius: 0.2, color: Colors.white54)
                        ]),
                    child: Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.03,
                          right: width * 0.03,
                        ),
                        child: TextFormField(
                          validator:(value) =>  signupController.nameValidation(value),
                            style: const TextStyle(color: colorWhite),
                            controller: signupController.usernameController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Full name',
                                labelStyle: TextStyle(color: Colors.white60)))))),
            textFieldGap,
            Padding(
                padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 34, 34, 34),
                        borderRadius:  BorderRadius.circular(7.0),
                        boxShadow:const [
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
                                labelStyle: TextStyle(color: Colors.white60)))))),
            textFieldGap,

            Padding(
                padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 34, 34, 34),
                        borderRadius:  BorderRadius.circular(7.0),
                        boxShadow:const [
                          BoxShadow(spreadRadius: 0.2, color: Colors.white54)
                        ]),
                    child: Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.03,
                          right: width * 0.03,
                        ),
                        child: TextFormField(validator: ((value) =>
                        signupController.emailValdation(value)),
                           keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(color: colorWhite),
                            controller: signupController.emailController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.white60)))))),
            textFieldGap,

            Padding(
                padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 34, 34, 34),
                        borderRadius:  BorderRadius.circular(7.0),
                        boxShadow:const [
                          BoxShadow(spreadRadius: 0.2, color: Colors.white54)
                        ]),
                    child: Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.03,
                          right: width * 0.03,
                        ),
                        child: TextFormField(validator: ((value) =>
                        signupController.passwordValdation(value)),
                          style: const TextStyle(color: colorWhite),
                            controller: signupController.passwordController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.white60)))))),
            textFieldGap,
            Padding(
                padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 34, 34, 34),
                        borderRadius:  BorderRadius.circular(7.0),
                        boxShadow:const [
                          BoxShadow(spreadRadius: 0.2, color: Colors.white54)
                        ]),
                    child: Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.03,
                          right: width * 0.03,
                        ),
                        child: TextFormField(validator: ((value) =>
                        signupController.confirmpasswordValdation(value)),
                          style: const TextStyle(color: colorWhite),
                            controller:
                                signupController.conformpasswordController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Confirm Password',
                                labelStyle: TextStyle(color: Colors.white60)))))),
            textFieldGap,

            SizedBox(
              width: width * 0.9,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                
                    log('before');
                    log(SignupController().usernameController.value.toString());
                     log(SignupController().emailController.text);
                      log(SignupController().phoneController.text);
                       log(SignupController().passwordController.text);

                    if (formGlobalKey.currentState!.validate()) {
                        formGlobalKey.currentState!.save();
                        signupController.addUser(context);
                      }
                  },
                  child: const Text('Create account')),
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
        ));
      }
    );
  }
}
