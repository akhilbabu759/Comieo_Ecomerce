import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/splash/splash_controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends GetView {
  SplashScreen({super.key});

  final splashController = Get.put(SplashscreenController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      splashController.splashTimer();
    });
    return Scaffold(
      backgroundColor: colorWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Image.asset(
                  "lib/images/22380-e-commerce.gif",
                  scale: 2.5,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Welcome to Comieo!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    'With long experience in the electronics industry,we create the best quality products.',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 17),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
