



import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/auth/signup/controller/register_verification_otp/controller.dart';
import 'package:ecomerce/screen/auth/signup/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class ScreenVerificationCode extends StatelessWidget {
  ScreenVerificationCode({
    Key? key,
    required this.model,
  }) : super(key: key);

  final SignUpModel model;

  final verifyotpC = Get.put(VerifyOtpController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.15),
          child: Padding(
            padding: EdgeInsets.only(right: width * 0.25),
            child: Column(
              children: [
                const Text(
                  'Verification Code',
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 30,
                      color: colorWhite,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.08,
                )
              ],
            ),
          ),
        ),
        elevation: 15,
        backgroundColor: colorWhite,
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(2000))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              textFieldGap,
              Row(
                children: const [
                  Text(
                    'Please enter Code sent to',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Email id',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      // Get.to(() => const ScreenVerification());
                    },
                    child: const Text(
                      'Change Email id',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              textFieldGap,
              GetBuilder<VerifyOtpController>(
                builder: (controller) {
                  return OtpTextField(
                    textStyle: const TextStyle(color: Colors.black),
                    numberOfFields: 4,
                    borderColor: Colors.black,
                    enabledBorderColor: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                    showFieldAsBox: true,
                    onSubmit: (String verificationCode) {
                      verifyotpC.onSubmitCode(verificationCode);
                      // data.sumbitOtp(value.phoneNo.text, context);
                    },
                  );
                },
              ),
              SizedBox(
                height: height * 0.1,
              ),
              GetBuilder<VerifyOtpController>(
                builder: (controller) {
                  return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      fixedSize: MaterialStateProperty.all(
                        Size(width * 0.8, height * 0.08),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {
                      verifyotpC.submitOtp(model, verifyotpC.code, context);
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(),
                    ),
                  );
                },
              ),
              textFieldGap,
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Resend Code',
                    style: TextStyle(color: colorWhite),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
