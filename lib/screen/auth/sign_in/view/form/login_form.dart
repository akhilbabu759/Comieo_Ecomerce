import 'package:flutter/material.dart';

class LoginFrom extends StatelessWidget {
   LoginFrom({
    Key? key,
    required this.width,
    required this.emailController,
    required this.passwordController,
    required this.height,
  }) : super(key: key);

  late double  width;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  late double  height;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        const Text('Your email'),
         Padding(
            padding: EdgeInsets.only(left:width*0.05,right: width*0.05),
            child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 34, 34, 34),
                  borderRadius: BorderRadius.circular(7.0),
                  boxShadow:const[ BoxShadow(spreadRadius: 0.2,
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
                  color: const Color.fromARGB(255, 34, 34, 34),
                  borderRadius:  BorderRadius.circular(7.0),
                  boxShadow:const[ BoxShadow(spreadRadius: 0.2,
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
                      
                    }, child: const Text('forgot password?'))],),
                    
                    SizedBox(width: width*0.9,
                      child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
        
        minimumSize: const Size.fromHeight(50),
      ),
                        onPressed: () {
                        
                      },child:const Text('Login') ),
                    ),
                    SizedBox(height: height*0.04,),
                    const Text('--------------OR--------------',style: TextStyle(color: Colors.white54),)
        // TextButton(onPressed:() {
        //   log('kk');
        //   log(emailController.text);
        //   log(passwordController.text);
          
        // }, child: Text('submit'))
      ],
    ));
  }
}
