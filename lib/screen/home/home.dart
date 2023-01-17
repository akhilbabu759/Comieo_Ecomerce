import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: backgroundColorBlack,
      
      
      // body: Scaffold(backgroundColor: backgroundColorBlack,
        body: SafeArea(
        child: Column(children: [
          Padding(
                      padding: const EdgeInsets.only(
                          left: 1, right: 1, top: 20, bottom: 1),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 224, 224, 224),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 104, 102, 102),
                                blurRadius: 15,
                                offset: Offset(5, 5),
                              ),
                              BoxShadow(
                                color: Color.fromARGB(255, 132, 132, 132),
                                blurRadius: 15,
                                offset: Offset(-5, -5),
                              ),
                            ]),
                        child: TextField(
                          onChanged: (value) {
                            // _runFilter(value);
                          },
                          autofocus: false,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.search),
                              fillColor: const Color.fromARGB(255, 224, 224, 224),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 241, 241, 241),
                                      style: BorderStyle.none),
                                  borderRadius: BorderRadius.circular(20.0)),
                              label: const Text('Search'),
                              hintStyle:
                                  const TextStyle(fontWeight: FontWeight.w300),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 241, 241, 241)),
                                  borderRadius: BorderRadius.circular(20.0)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 90, 90, 90)),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 9.0, horizontal: 10.0)),
                        ),
                      )),
                      textFieldGap,
                      Row(children: [
                        Text('Top Deals',style:homeTextStyle ,)
                      ],)
      
        ]),
      ),
        // child: Text('home')),
      
    );
  }
}
