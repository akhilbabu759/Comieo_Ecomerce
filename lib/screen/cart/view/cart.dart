import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(children:const [
           Text( 
            "My Cart",style: TextStyle(color: Colors.black),
          ),Text("4 items",
          style:TextStyle())
        ]),
      ),
      body: SafeArea(child: Column(children: [
        Dismissible(key: Key('1'),
          child: Row(children: [SizedBox(
            width: 88,child: AspectRatio(aspectRatio: 0.88,child: Container(padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Color(0xFFF5F6F9),borderRadius: BorderRadius.circular(15),
              ),child: Image.network(''),
            ),),
          ),
          SizedBox(width: 20,
          ),Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("title",style: TextStyle(fontSize: 16,color: Colors.black),maxLines: 2,),
            Text.rich(TextSpan( text: '300',style:TextStyle(fontWeight: FontWeight.w600
            ,color: Colors.red),children: [TextSpan(
              text: "x2",style: TextStyle(color: Colors.red)
            )] ))
          ],)
          ],),
        )

      ],)),
    );
  }
}
