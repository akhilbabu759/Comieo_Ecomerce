import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:ecomerce/screen/home/view/widget/cardView/list_card.dart';
import 'package:ecomerce/screen/home/view/widget/carousel_slider/carousel.dart';
import 'package:ecomerce/screen/home/view/widget/heding/heding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';

import 'widget/home_grideviewe/grid_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});
 
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    return Scaffold(
      
                        

      
      
      // bottomNavigationBar: BottomNavigator(),
      backgroundColor: backgroundColorBlack,

      
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container( color: backgroundColorBlack,
              height: height*0.1,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                // SizedBox(width: width*0.04),
                 const Text(
                          'Comieo',
                          style: textstyle,
                        ),
                        Row(
                          children: [
                          IconButton(onPressed: () {
                            
                          }, icon:const Icon( Icons.search,color: colorWhite,)),
                           IconButton(onPressed: () {
                             
                           }, icon: const Icon( Icons.favorite,color: colorWhite,))
                        ],)
              ]),
            ),
              AfterAppBar(height: height, width: width),
            ],
          ),
        ),
      ),
      // child: Text('home')),
    );
  }
}

class AfterAppBar extends StatelessWidget {
  const AfterAppBar({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(children: [ 
        // Padding(
        //     padding: const EdgeInsets.only(
        //         left: 1, right: 1, top: 20, bottom: 1),
        //     child: Container(
        //       decoration: BoxDecoration(
        //           color: const Color.fromARGB(255, 224, 224, 224),
        //           borderRadius: BorderRadius.circular(20),
        //           boxShadow: const [
        //             BoxShadow(
        //               color: Color.fromARGB(255, 104, 102, 102),
        //               blurRadius: 15,
        //               offset: Offset(5, 5),
        //             ),
        //             BoxShadow(
        //               color: Color.fromARGB(255, 132, 132, 132),
        //               blurRadius: 15,
        //               offset: Offset(-5, -5),
        //             ),
        //           ]),
        //       child: TextField(
        //         onChanged: (value) {
        //           // _runFilter(value);
        //         },
        //         autofocus: false,
        //         inputFormatters: [
        //           LengthLimitingTextInputFormatter(10),
        //         ],
        //         keyboardType: TextInputType.text,
        //         decoration: InputDecoration(
        //             suffixIcon: const Icon(Icons.search),
        //             fillColor: const Color.fromARGB(255, 224, 224, 224),
        //             filled: true,
        //             border: OutlineInputBorder(
        //                 borderSide: const BorderSide(
        //                     color: Color.fromARGB(255, 241, 241, 241),
        //                     style: BorderStyle.none),
        //                 borderRadius: BorderRadius.circular(20.0)),
        //             label: const Text('Search'),
        //             hintStyle:
        //                 const TextStyle(fontWeight: FontWeight.w300),
        //             focusedBorder: OutlineInputBorder(
        //                 borderSide: const BorderSide(
        //                     color: Color.fromARGB(255, 241, 241, 241)),
        //                 borderRadius: BorderRadius.circular(20.0)),
        //             enabledBorder: UnderlineInputBorder(
        //               borderSide: const BorderSide(
        //                   color: Color.fromARGB(255, 90, 90, 90)),
        //               borderRadius: BorderRadius.circular(25.7),
        //             ),
        //             contentPadding: const EdgeInsets.symmetric(
        //                 vertical: 9.0, horizontal: 10.0)),
        //       ),
        //     )),
        textFieldGap,
        const HomeHeading(tex: 'Top Deals'),
        textFieldGap,
        const CarouselHome(),
        textFieldGap,
        const HomeHeading(
          tex: 'Shop by Category',
        ),
        const CardView(),
        textFieldGap,
        const HomeHeading(
          tex: 'All shops',
        ),
        HomeGridView(
          height: height * 0.9,
          width: width * 0.9,
        )
      ]),
    );
  }
}
