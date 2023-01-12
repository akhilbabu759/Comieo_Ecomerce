

import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/auth/signup/view/signup.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'form/login_form.dart';

class SigninPage extends StatelessWidget {
   SigninPage({super.key});
  var emailController = TextEditingController();
  var passwordController= TextEditingController();
  dynamic size,height,width;
  
  

  @override
  Widget build(BuildContext context) {
     size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(backgroundColor: backgroundColorBlack,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const [
               Text(
                'Comieo',
                style: textstyle,
              )
            ],
          ),
          // Text(
          //   'Welcome back! Sign in using your Social\n account or enail to us',
          //   style: TextStyle(fontSize: 20),
          // ),
          
          LoginFrom(width: width, emailController: emailController, passwordController: passwordController, height: height),
         
          const Text('________or_______'),
          //  Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     const CircleAvatar(minRadius: 17,
          //       backgroundColor: colorWhite,
          //       backgroundImage: NetworkImage(
          //           'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png'),
          //     ),const SizedBox(width: 10,),
          //     TextButton(onPressed: () {
                
          //     }, child: const Text('Log in With google'))
          //   ],
          // ),
          SizedBox(height: height*0.03,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const Text("Don't have account ?",style: TextStyle(color: colorWhite),),
              TextButton(onPressed:() {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupPage(), ));
                Get.to(SignupPage());
                
              }, child: const Text('sign up')),
            ],
          ),
          
        ],
      )),
    );
  }
}

