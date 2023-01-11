import 'dart:developer';

import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'signup_form/signup_form.dart';

class SignupPage extends StatelessWidget {
   SignupPage({super.key});

var size;
var height;
var width;
 var emailController = TextEditingController();
 var nameController = TextEditingController();
 
 var passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(backgroundColor: backgroundColorBlack,
      body: SafeArea(child: Column(
        children: [
          Text('Sign up with Email',style: TextStyle(fontFamily: 'Teko'),),
          Text('Get chatting with friends and family today by \n signing up for our chat app! '),
          Text('Your name'),
             SignupFrom(emailController: emailController,passwordController: passwordController,height:height*0.4,width: width*1.01, ),
             textFieldGap,
             Padding(
               padding:  EdgeInsets.only(top:height*0.04),
               child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                CircleAvatar(minRadius: 17,
                  backgroundColor: colorWhite,
                  backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png'),
                ),SizedBox(width: 10,),
                TextButton(onPressed: () {
                  
                }, child: Text('Log in With google'))
            ],
          ),
             ),textFieldGap,
             Row(mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('already have account ?',style: TextStyle(color:colorWhite ),),
                 TextButton(onPressed:() {
                  Get.back();
                log(nameController.text);
                log(emailController.text);
                log(passwordController.text);
                
              }, child: const Text('Login'))
               ],
             ),
                



          




        ],
      )),
    );
  }
}