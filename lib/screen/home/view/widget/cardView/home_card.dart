import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.imag, required this.text}) : super(key: key);
  final String text;
  final String imag;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
          width: 140,
          child: Image.network(
            '${ApiBaseUrl().baseurl}/category/${imag}',
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
