import 'package:ecomerce/screen/auth/signup/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conformpasswordController =
      TextEditingController();

   Future<void> addUser(BuildContext context)async{
    final signupmodel = SignUpModel(fullname: usernameController.text, email: emailController.text, phone: phoneController.text, password: passwordController.text);

   }   Otp
}
