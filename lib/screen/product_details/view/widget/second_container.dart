import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SecondContainer extends StatelessWidget {
  const SecondContainer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      margin: EdgeInsets.only(top: size.height * 0.3),
      // height: 500,
      decoration: const BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            textFieldGap,
            Padding(
              padding: const EdgeInsets.only(
                left: 17.0,
                top: 15,
              ),
              child: Row(
                children: [
                  //  Icon(Icons.share,size: 30,),
                  GestureDetector(
                    onTap: () {
                      Share.share(
                        'https://play.google.com/store/apps/details?id=com.',
                      );
                    },
                    child: const Icon(
                      Icons.share,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '❤️',
                    style: TextStyle(fontSize: 27),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'A product detail page (PDP) is a web page on an e - commerce site that presents the description of a specific product in view. The details displayed often include size, color, price, shipping information, reviews, and other relevant information customers may want to know before making a purchase',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '  SIZE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [
                      Text(
                        'Offer - 15% off',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Delivery fee - free',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Card(
                  color: Colors.blueGrey,
                  child: Text(
                    '20',
                    style: textstyle,
                  ),
                ),
                Card(
                  color: Colors.blueGrey,
                  child: Text(
                    '24',
                    style: textstyle,
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.blueGrey),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shop,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          maximumSize: Size(size.width * 2.001,
                              size.height * 2.001),
                          minimumSize: Size(size.width * 0.71,
                              size.height * 0.001)),
                      onPressed: () {},
                      child: const Text(
                        'BUY NOW',
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

