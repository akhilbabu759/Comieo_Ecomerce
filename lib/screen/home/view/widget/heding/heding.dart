import 'package:ecomerce/core/text_style.dart';
import 'package:flutter/material.dart';

class HomeHeading extends StatelessWidget {
  const HomeHeading({
    Key? key,required this.tex
  }) : super(key: key);
  final String tex;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(tex.toString(),style:homeTextStyle ,),
      // TextButton(onPressed: () {
        
      // }, child: const Text('See all'))
    ],);
  }
}
