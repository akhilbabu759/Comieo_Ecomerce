// import 'package:ecomerce/screen/home/view/home.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class BottomNavigator extends StatelessWidget {
//    BottomNavigator({super.key});
//   final page = [
//     const Home(),
    
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: ValueListenableBuilder(
//          valueListenable:selectedIndex ,builder: (context, values, child) => 
//         BottomNavigationBar(
//             unselectedItemColor: Colors.white,
//             backgroundColor: const Color.fromARGB(210, 22, 27, 35),
//             onTap: (value)async {
//                selectedIndex.value=value;
//             // selectedIndex.notifyListeners();},
//             },
//             currentIndex: selectedIndex.value,
//             selectedItemColor: const Color.fromARGB(255, 7, 255, 255),
//             items: const [
//               BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
//               BottomNavigationBarItem(
//                   label: 'Category', icon: Icon(Icons.category)),
//               BottomNavigationBarItem(
//                   label: 'Settings', icon: Icon(Icons.settings))
//             ]),
//       ),
//     );
//   }
// }