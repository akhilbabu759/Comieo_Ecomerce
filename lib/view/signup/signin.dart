import 'dart:developer';

import 'package:ecomerce/view/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SigninPage extends StatelessWidget {
   SigninPage({super.key});
  var emailController = TextEditingController();
  var passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login in to Comieo',
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome back! Sign in using your Social\n account or enail to us',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.google.com/imgres?imgurl=https%3A%2F%2Fplay-lh.googleusercontent.com%2F6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1&imgrefurl=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdev%3Fid%3D5700313618786177705%26hl%3Den_US%26gl%3DUS&tbnid=i7MoRy5G8Xd9xM&vet=12ahUKEwi-w6nYubb8AhWkS3wKHYB-CTMQMygBegUIARDnAQ..i&docid=x_hf6-7_nBDr_M&w=512&h=512&q=gogle&ved=2ahUKEwi-w6nYubb8AhWkS3wKHYB-CTMQMygBegUIARDnAQ'),
              )
            ],
          ),
          Text('________or_______'),
          Form(
              child: Column(
            children: [
              Text('Your email'),
              TextFormField(controller: emailController,

              ),
              Text('Password'),
              TextFormField(controller: passwordController,

              ),
              TextButton(onPressed:() {
                log('kk');
                log(emailController.text);
                log(passwordController.text);
                
              }, child: Text('submit'))
            ],
          )),
          TextButton(onPressed:() {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupPage(), ));
            
          }, child: Text('sign up'))
        ],
      )),
    );
  }
}
