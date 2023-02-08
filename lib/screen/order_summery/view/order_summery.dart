import 'dart:ui';

import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:flutter/material.dart';

class OrderSummery extends StatelessWidget {
  const OrderSummery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: colorWhite,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios,
                color: colorblack,
              )),
          title: Text(
            'Order Summary',
            style: TextStyle(color: colorblack, fontSize: 20),
          )),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            textFieldGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Deliver to:'),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 255, 255, 255)),
                        elevation: MaterialStateProperty.all(0),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: colorblack))),
                    onPressed: () {},
                    child: const Text(
                      'Change',
                      style: TextStyle(color: colorblack),
                    ))
              ],
            ),
            Container(
              color: Colors.blueGrey[50],
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Shameer',style: TextStyle(fontSize: 24),),
                        Card(
                      child: Text('Home'),
                     
                    ),
                      ],
                    ),
                    
                     Row(children: [
                      IconButton(onPressed: () {
                        
                      }, icon: Icon(Icons.edit)),
                      IconButton(onPressed: () {
                        
                      }, icon: Icon(Icons.delete))

                     ],)
                  ],
                ),
                
                const Text('loppo'),
                const Text('PIN: 7894848,fjffk'),
                const Text('gjgjgj'),
                const SizedBox(height: 10,),
                const Text('8909808797'),
                const SizedBox(height: 10,),

              ]),
            )
          ],
        ),
      )),
    );
  }
}
