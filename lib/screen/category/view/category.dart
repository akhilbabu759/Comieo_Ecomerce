import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/home/controller/home_controll.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoC=Get.put(HomeControll());
    return Scaffold(appBar: PreferredSize(preferredSize: Size.fromHeight(63),
      child: AppBar(elevation: 0,
        title: Text('Category',style: TextStyle(color: colorblack),),centerTitle: true,
        backgroundColor: colorWhite),
    ),
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
            child: GridView.builder(itemCount:categoC.categorylList.length,
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(  
                    crossAxisCount: 3,  
                    // crossAxisSpacing:1.0,  
                    // mainAxisSpacing: .0  
                ) ,itemBuilder: (context, index) => 
           Padding(
             padding: const EdgeInsets.only(left:8.0,right: 8),
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
                        maxRadius: 47,
                        backgroundColor: Colors.blueGrey[50],
                        child: Text(
                          categoC.categorylList[index].name,
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
           ),
            ),
          )
        ],
      )),
    );
  }
}
