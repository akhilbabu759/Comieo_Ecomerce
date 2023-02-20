import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/home/controller/home_controll.dart';
import 'package:ecomerce/screen/home/view/widget/cardView/home_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoC = Get.put(HomeControll());
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(63),
          child: AppBar(
              elevation: 0,
              title: const Text(
                'Category',
                style: TextStyle(color: colorblack),
              ),
              centerTitle: true,
              backgroundColor: colorWhite),
        ),
        backgroundColor: Colors.blueGrey[50],
        body: SafeArea(
          child: Column(
            children: [
              textFieldGap,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 3.0, right: 2),
                  child: GridView.builder(
                      itemCount: categoC.categorylList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 0,
                              childAspectRatio: 1 / 1.3),
                      itemBuilder: (context, index) => HomeCard(
                            imag: categoC.categorylList[index].image,
                            text: categoC.categorylList[index].name,
                          )
                    
                      ),
                ),
              ),
            ],
          ),
        ));
  }
}
