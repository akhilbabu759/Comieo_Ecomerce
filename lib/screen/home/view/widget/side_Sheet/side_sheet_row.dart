import 'package:ecomerce/core/constent.dart';
import 'package:flutter/material.dart';


class SideSheetRow extends StatelessWidget {
  const SideSheetRow({
    Key? key,required this.icon,required this.text
  }) : super(key: key);
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:12.0,top: 9),
      child: Row(children: [
        icon,
        // IconButton(onPressed: () {
          
        // }, icon: icon),
        const SizedBox(width: 10,),
        Text(text,style: const TextStyle(color: colorblack,fontSize: 17),)
      ],),
    );
  }
}
