import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Login in to Comieo')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Welcome back!Signin using your Social\n account or enail to us')
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
          )
        ],
      )),
    );
  }
}
