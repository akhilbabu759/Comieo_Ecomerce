import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  late Size size;
  late num width;
  late num heght;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    heght = size.height;
    width = size.width;

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 34, 34, 34),
                      borderRadius: BorderRadius.circular(7.0),
                      boxShadow: const [
                        BoxShadow(spreadRadius: 0.2, color: Colors.white54)
                      ]),
                  child: Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.03,
                        right: width * 0.03,
                      ),
                      child: TextFormField(
                          // controller: emailController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.white60))))))
        ],
      )),
    );
  }
}
