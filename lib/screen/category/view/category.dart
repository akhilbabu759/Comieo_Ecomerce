import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Container(
              width: 100,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 50, color: Color.fromARGB(96, 130, 129, 129))
              ]),
              child: CircleAvatar(
                  minRadius: 50,
                  backgroundColor: colorWhite,
                  child: CircleAvatar(
                    maxRadius: 42,
                    backgroundColor: Colors.blueGrey[50],
                    child: Text(
                      'Speaker',
                      style: TextStyle(color: colorblack),
                    ),
                  )
                  // Container(width: 20,height: 70,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20),
                  //         color: Color.fromARGB(255, 101, 103, 104)
                  //         ),
                  //     child: Center(child: Text('dat'))),
                  ),
            ),
          )
        ],
      )),
    );
  }
}
