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
      backgroundColor: backgroundColorBlack,
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
                  style: textstyle,
                ),
                SizedBox(
                  height: height * 0.08,
                )
              ],
            ),
          ),
        ),
        elevation: 15,
        backgroundColor: const Color.fromARGB(255, 19, 35, 49),
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(2000))),
      ),
      body: verifyotpC.isLoading == true
          ? const Center(
              child: CircularProgressIndicator(
                color: colorWhite,
                backgroundColor: Colors.cyan,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    textFieldGap,
                    Row(
                      children: const [
                        Text(
                          'Please enter Code sent to',
                          style: TextStyle(fontSize: 17, color: colorWhite),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Email id',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: colorWhite),
                        ),
                      ],
                    ),
                    textFieldGap,
                    GetBuilder<VerifyOtpController>(
                      builder: (controller) {
                        return OtpTextField(
                          textStyle: const TextStyle(color: colorWhite),
                          numberOfFields: 4,
                          borderColor: colorWhite,
                          enabledBorderColor:
                              const Color.fromARGB(255, 242, 239, 239),
                          borderRadius: BorderRadius.circular(12),
                          showFieldAsBox: true,
                          onSubmit: (String verificationCode) {
                            verifyotpC.onSubmitCode(verificationCode);
                           
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
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            fixedSize: MaterialStateProperty.all(
                              Size(width * 0.8, height * 0.08),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () {
                            verifyotpC.submitOtp(
                                model, verifyotpC.code, context);
                          },
                          child: const Text(
                            'Continue',
                            style: TextStyle(),
                          ),
                        );
                      },
                    ),
                    textFieldGap,
                    
                  ],
                ),
              ),
            ),
    );
  }
}
