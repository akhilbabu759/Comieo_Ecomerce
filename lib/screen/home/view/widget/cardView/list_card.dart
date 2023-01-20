import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/home/view/widget/cardView/home_card.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({
    Key? key,
  }) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return LimitedBox(maxHeight: 175,
      child: ListView.builder(
          itemCount: 16,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: HomeCard(text: 'speaker'),
              )),
    );
  }
}

