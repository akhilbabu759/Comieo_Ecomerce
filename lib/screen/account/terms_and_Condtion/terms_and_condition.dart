import 'package:ecomerce/core/constent.dart';
import 'package:flutter/material.dart';

class TermsAndCondion extends StatelessWidget {
  const TermsAndCondion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.only(top: 45.0, left: 10),
              child: Text(
                "Terms And Condtion",
                style: TextStyle(
                    color: colorblack,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            textFieldGap,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blueGrey[50],
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(children: [
                    TextSpan(
                        text:
                            "Definitions\n1 'Application' means Comieo, our e-commerce application.\n2 'We', 'us', 'our' means the owner of the Comieo application.\n3 'User', 'You' means any person who accesses or uses Comieo.",
                        style: TextStyle(color: colorblack, fontSize: 16)),
                    TextSpan(
                      text:
                          "\nUse of Comieo\n1 By using Comieo, you represent that you are at least 18 years old or have reached the legal age in your jurisdiction.\n2 You agree to use Comieo for lawful purposes only, in compliance with these terms and conditions, and all applicable laws and regulations.\n3 You agree not to use Comieo:\na) In any way that violates any applicable federal, state, local or international law or regulation.\nb) To transmit, or procure the sending of, any advertising or promotional material, including any 'junk mail,' 'chain letter,' 'spam,' or any other similar solicitation.\nc) To impersonate or attempt to impersonate Comieo or one of our employees, another user, or any other person or entity.\n4 We reserve the right to terminate or suspend access to Comieo, without prior notice or liability, for any reason whatsoever, including, without limitation, if you breach these terms and conditions.",
                      style: TextStyle(color: colorblack, fontSize: 16),
                    ),
                    TextSpan(
                        text:
                            "\nYour Account\n1 To use certain features of Comieo, you may be required to create an account.\n2 You agree to provide accurate, complete, and updated information for your account, and to keep it current and accurate.\n3 You are solely responsible for maintaining the confidentiality of your account and password, and for restricting access to your account. You agree to accept responsibility for all activities that occur under your account or password.",
                        style: TextStyle(color: colorblack, fontSize: 16)),
                    TextSpan(
                        text:
                            "\nProducts and Services\n1 Comieo allows you to browse and purchase products from various sellers.\n2 We do not own or control the products or services provided by sellers. As such, we make no representations or warranties about the quality, safety, legality, or accuracy of the products or services.\n3 All transactions made through Comieo are solely between you and the seller. We are not responsible for any disputes, losses, or damages arising from such transactions.",
                        style: TextStyle(color: colorblack, fontSize: 16)),
                    TextSpan(
                        text:
                            "\nPayment and Fees\n1 Comieo allows you to purchase products or services from sellers through various payment methods.\n2 You agree to pay all fees and charges associated with your use of Comieo and the products or services you purchase.\n3 We reserve the right to modify our fees and charges, at any time and without prior notice.",
                        style: TextStyle(color: colorblack, fontSize: 16)),
                    TextSpan(
                        text:
                            "\nIntellectual Property\n1 All content and materials on Comieo, including but not limited to text, graphics, logos, images, and software, are the property of Comieo or its licensors.",
                        style: TextStyle(color: colorblack, fontSize: 16)),
                  ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
