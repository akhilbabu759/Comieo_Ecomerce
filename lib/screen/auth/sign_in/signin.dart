import 'dart:developer';
import 'dart:ui';

import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/auth/signup/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
    return Scaffold(backgroundColor: Colors.black12,
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
          
          Form(
              child: Column(
            children: [
              Text('Your email'),
               Padding(
                  padding: EdgeInsets.only(left:width*0.05,right: width*0.05),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 34, 34, 34),
                        borderRadius: new BorderRadius.circular(7.0),
                        boxShadow:[ BoxShadow(spreadRadius: 0.2,
                          color: Colors.white54)]
                      ),
                      child: Padding(
                          padding:  EdgeInsets.only(left: width*0.03, right: width*0.03,),
                          child: TextFormField(controller: emailController,
                              decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Email',labelStyle: TextStyle(color: Colors.white60)
                          ))))),
              const Text('Password'),
              Padding(
                  padding: EdgeInsets.only(left:width*0.05,right: width*0.05),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 34, 34, 34),
                        borderRadius: new BorderRadius.circular(7.0),
                        boxShadow:[ BoxShadow(spreadRadius: 0.2,
                          color: Colors.white54)]
                      ),
                      child: Padding(
                          padding:  EdgeInsets.only(left: width*0.03, right:width*0.03, ),
                          child: TextFormField(controller: passwordController,
                              decoration: const InputDecoration(
                            border: InputBorder.none,
                            
                            labelText: 'Password',labelStyle: TextStyle(color: Colors.white60)
                          ))))),
                          Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: [TextButton(onPressed: () {
                            
                          }, child: Text('forgot password?'))],),
                          
                          SizedBox(width: width*0.9,
                            child: ElevatedButton(
                               style: ElevatedButton.styleFrom(
        
        minimumSize: const Size.fromHeight(50),
      ),
                              onPressed: () {
                              
                            },child:Text('Login') ),
                          ),
                          SizedBox(height: height*0.04,),
                          Text('--------------OR--------------',style: TextStyle(color: Colors.white54),)
              // TextButton(onPressed:() {
              //   log('kk');
              //   log(emailController.text);
              //   log(passwordController.text);
                
              // }, child: Text('submit'))
            ],
          )),
         
          Text('________or_______'),
           Row(
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
          SizedBox(height: height*0.03,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Don't have account ?",style: TextStyle(color: colorWhite),),
              TextButton(onPressed:() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupPage(), ));
                
              }, child: Text('sign up')),
            ],
          ),
          
        ],
      )),
    );
  }
}
