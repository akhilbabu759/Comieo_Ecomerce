import 'package:ecomerce/core/constent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SideSheetRow extends StatelessWidget {
  const SideSheetRow({
    Key? key,required this.icon,required this.text
  }) : super(key: key);
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(onPressed: () {
        
      }, icon: icon),
      SizedBox(width: 40,),
      Text(text,style: TextStyle(color: colorblack,fontSize: 17),)
    ],);
  }
}