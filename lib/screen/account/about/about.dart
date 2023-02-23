import 'package:ecomerce/core/constent.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.only(top: 45.0, left: 10),
              child: Text(
                "About",
                style: TextStyle(color: colorblack, fontSize: 20),
              ),
            ),
            textFieldGap,
            Container(
              color: Colors.blueGrey[50],
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text:
                            'Are you looking for an easy and convenient way to shop for all your electronic products? Look no further! Comieo, developed by Akhil Babu, is the perfect mobile application to help you find exactly what you need.\n',
                        style: TextStyle(color: colorblack, fontSize: 18)),
                    TextSpan(
                        text:
                            'Comieo is a user-friendly e-commerce platform that offers everything from laptops and tablets to phones and gaming consoles. With its intuitive interface, customers can easily browse through product details with just a few clicks of their finger. Not only does it provide detailed descriptions of each item but also provides helpful reviews from other customers who have already purchased them so that buyers can make informed decisions about their purchases.\n ',
                        style: TextStyle(color: colorblack, fontSize: 18)),
                    TextSpan(
                        text:
                            'What makes Comieo stand out even more is its advanced search feature which allows users to narrow down results based on criteria like brand name or price range; this ensures they get exactly what they are looking for without having to sift through hundreds of items first. Additionally, there are multiple payment options available including credit card payments as well as cash on delivery services which make shopping easier than ever before! \n',
                        style: TextStyle(color: colorblack, fontSize: 18)),
                    TextSpan(
                        text:
                            'The best part about using Comieo though has got be the amazing discounts offered every day - making it one of the most affordable online stores around today! So if you’re in the market for some new electronics then don’t forget check out this great app – because with Comieo convenience meets affordability at an unbeatable level!\n',
                        style: TextStyle(color: colorblack, fontSize: 18))
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
