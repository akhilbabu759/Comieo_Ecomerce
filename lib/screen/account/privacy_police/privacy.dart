import 'package:ecomerce/core/constent.dart';
import 'package:flutter/material.dart';

class Privice extends StatelessWidget {
  const Privice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.only(top: 45.0, left: 10),
              child: Text("Privacy Policy",
                  style: TextStyle(
                      color: colorblack,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
            ),
            textFieldGap,
            Container(
              color: Colors.blueGrey[50],
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: RichText(textAlign: TextAlign.justify,
                  text: const TextSpan(children: [
                    TextSpan(
                        text:
                            "Introduction\n\nComieo is committed to protecting the privacy of its users. This privacy policy outlines how we collect, use, share, and protect the personal information of our users when they use the Comieo e-commerce application ('App').",
                        style: TextStyle(color: colorblack, fontSize: 16)),
                    TextSpan(
                        text:
                            "\n\nInformation We Collect\n\nWe may collect the following types of personal information:\nContact Information: Your name, email address, phone number, and mailing address.\nPayment Information: Your credit card or other payment method information.\nOrder Information: Information about the products you order, such as product name, price, and shipping address.\nDevice Information: Information about the device you use to access the App, including device type, operating system, and IP address.\nUsage Information: Information about how you use the App, such as pages visited, products viewed, and search queries.",
                        style: TextStyle(color: colorblack, fontSize: 16)),
                    TextSpan(
                        text:
                            "\n\nHow We Collect Information\n\nWe may collect personal information in the following ways:\nRegistration: When you create an account on the App, we may collect your name, email address, and other contact information.\nOrders: When you place an order through the App, we may collect your payment information and shipping address.\nCookies: We may use cookies and other tracking technologies to collect usage information and personalize your experience on the App.\nThird-Party Services: We may collect information from third-party services, such as social media platforms, to enhance your experience on the App.",
                        style: TextStyle(color: colorblack, fontSize: 16)),
                    TextSpan(
                        text:
                            "\n\nUse of Information\n\nWe may use personal information for the following purposes:\nTo provide and improve the App and its features.\nTo process and fulfill your orders.\nTo communicate with you about your orders and provide customer support.\nTo send you marketing communications about our products and services.\nTo personalize your experience on the App.",
                        style: TextStyle(color: colorblack, fontSize: 16)),
                    TextSpan(
                        text:
                            "\n\nSecurity\n\nWe take reasonable measures to protect the personal information of our users, including:\nEncryption: We use industry-standard encryption to protect your payment information.\nAccess Controls: We limit access to personal information to authorized personnel only.\nMonitoring: We monitor our systems for unauthorized access and potential vulnerabilities.",
                        style: TextStyle(color: colorblack, fontSize: 16)),
                    TextSpan(
                        text:
                            "\n\nUser Controls\n\nYou may access, update, or delete your personal information by logging into your account on the App. You may also opt-out of marketing communications by following the unsubscribe instructions included in the communication.\nChanges to this Privacy Policy\nWe may update this privacy policy from time to time. If we make significant changes, we will notify you by email or through the App.",
                        style: TextStyle(color: colorblack, fontSize: 16)),
                    TextSpan(
                        text:
                            "\n\nContact Us\n\nIf you have any questions or concerns about this privacy policy or our practices, please contact us at privacy@comieo.com.",
                        style: TextStyle(color: colorblack, fontSize: 16)),
                  ]),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
