import 'package:ecomerce/core/text_style.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
          width: 140,
          child: Image.network(
            "https://www.nexhour.com/uploads/nexhour-ecommerce-india-private-limited/products/1-678795_l.jpg",
            // height: 100,
            // width: 150,
          ),
        ),
        Text(
          text,
          style: TextStyle(color: colorWhite),
        )
      ],
    );
  }
}
