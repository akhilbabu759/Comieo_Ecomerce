import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';

import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.imag, required this.text})
      : super(key: key);
  final String text;
  final String imag;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        borderOnForeground: true,
        elevation: 3,
        child: Column(
          children: [
            Container(
              height: 27,
              width: 140,
              color: Colors.blueGrey[50],
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(color: colorblack),
                ),
              ),
            ),
            SizedBox(
              height: 140,
              width: 140,
              child: Image.network(
                '${ApiBaseUrl().baseurl}/category/$imag', fit: BoxFit.scaleDown,
                // height: 100,
                // width: 150,
              ),
            )
          ],
        ),
      ),
    );
  }
}
