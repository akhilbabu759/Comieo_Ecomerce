import 'dart:developer';

import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
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
 
 var passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(backgroundColor: backgroundColorBlack,
    resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SizedBox(height: 100,),

            // Text('Sign up with Email',style: TextStyle(fontFamily: 'Teko'),),
            // Text('Get chatting with friends and family today by \n signing up for our chat app! '),
            // Text('Your name'),
            
               SignupFrom(height:height*0.4,width: width*1.01, ),
               textFieldGap,
               
               Row(mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const Text('already have account ?',style: TextStyle(color:colorWhite ),),
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
      ),
    );
  }
}