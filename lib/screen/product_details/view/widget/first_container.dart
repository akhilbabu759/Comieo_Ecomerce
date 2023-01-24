import 'package:ecomerce/core/text_style.dart';
import 'package:flutter/material.dart';

class FistContiner extends StatelessWidget {
  const FistContiner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Aristocratic Hand Bag',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Office Code',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Column(
                children: const [
                  Text(
                    '⭐⭐⭐⭐',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '4.2',
                    style: textstyle,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                        text: "Price\n",
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    TextSpan(
                      text: "₹234",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Image.network(
                  'https://cdn3d.iconscout.com/3d/premium/thumb/shopping-bag-4039158-3345846@0.png',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
