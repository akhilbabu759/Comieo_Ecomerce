import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignupPage extends StatelessWidget {
   SignupPage({super.key});


 var emailController = TextEditingController();
 var nameController = TextEditingController();
 
 var passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Text('Sign up with Email'),
          Text('Get chatting with friends and family today by \n signing up for our chat app! '),
          Text('Your name'),
              TextFormField(controller: nameController, ),
             Text('Your email'),
              TextFormField( controller: emailController),
             Text('Your password'),
              TextFormField(controller: passwordController, ),
               Text('Your Confirm password'),
              TextFormField( ),
                TextButton(onPressed:() {
                log(nameController.text);
                log(emailController.text);
                log(passwordController.text);
                
              }, child: Text('submit'))



          




        ],
      )),
    );
  }
}