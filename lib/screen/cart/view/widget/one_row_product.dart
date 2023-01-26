import 'package:ecomerce/screen/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowCart extends StatelessWidget {
  const RowCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final cartcontrol = Get.put(CartController());
  
    return Dismissible(
      key: Key('1'),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png'),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "title",
                style: TextStyle(fontSize: 16, color: Colors.black),
                maxLines: 2,
              ),
              Text.rich(TextSpan(
                  text: '300',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
                  children: [
                    TextSpan(text: "x2", style: TextStyle(color: Colors.red))
                  ]))
            ],
          ),SizedBox(width: 50,),
          Column(
            children: [
              ColoredBox(
                color: Colors.grey,
                child: GestureDetector(
                  child: Icon(Icons.plus_one),
                  onTap: () => ''
                  // cartcontrol.adding(),
                ),
              ),
              GetBuilder<CartController>(
                builder: (controller) {
                  return SizedBox(
                    child: Text('6')
                      // cartcontrol.value.toString()),
                  );
                },
              ),
              ColoredBox(
                color: Colors.grey,
                child: GestureDetector(
                  child: Icon(Icons.remove),
                  onTap: () =>''
                  //  cartcontrol.deleting(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
