
import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/account/account_main/controller/account_controller.dart';
import 'package:ecomerce/util/row_textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAccountPage extends StatelessWidget {
  AddAccountPage({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;
  final accountC = Get.put(AcountController());
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Add',
              style: TextStyle(
                letterSpacing: 3,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Account',
              style: TextStyle(
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
                color: colorWhite,
              ),
            )
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.04),
          child: const SizedBox(),
        ),
      ),
      
      body: SafeArea(
          child: GetBuilder<AcountController>(
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: fromKey,
              child: Column(
      children: [
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.tittleC,
          textInputType: TextInputType.name,
          nullText: 'Tittle is Empty',
          obscureText: false,
          icon: const Icon(Icons.person),
          text: 'Tittle',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.fullNameC,
          textInputType: TextInputType.name,
          nullText: 'Fullname is Empty',
          obscureText: false,
          icon: const Icon(Icons.person),
          text: 'Full Name',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.phoneC,
          textInputType: TextInputType.number,
          nullText: 'Phone number is Empty',
          obscureText: false,
          icon: const Icon(Icons.phone),
          text: 'Phone Number',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.pinC,
          textInputType: TextInputType.number,
          nullText: 'PinCode is Empty',
          obscureText: false,
          icon: const Icon(Icons.pin),
          text: 'PinCode',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.stateC,
          textInputType: TextInputType.name,
          nullText: 'State is Empty',
          obscureText: false,
          icon: const Icon(Icons.public),
          text: 'State',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.placeC,
          textInputType: TextInputType.name,
          nullText: 'Place is Empty',
          obscureText: false,
          icon: const Icon(Icons.location_on),
          text: 'Place',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.addressC,
          textInputType: TextInputType.streetAddress,
          nullText: 'Address is Empty',
          obscureText: false,
          icon: const Icon(Icons.contact_mail),
          text: 'Address',
        ),
        kHeight10,
        TextFromFieldWidget(
          textController: accountC.landmarkC,
          textInputType: TextInputType.name,
          nullText: 'LandMark is Empty',
          obscureText: false,
          icon: const Icon(Icons.emoji_flags),
          text: 'Delivary Location',
        ),
        kHeight10,
        ElevatedButton(
          style: ButtonStyle(
         
            fixedSize: MaterialStateProperty.all(
              Size(width * 0.8, height * 0.08),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          onPressed: () {
            // if (formKey.currentState!.validate()) {
              accountC.addAccount();
             Get.back();
            }
          // },
          ,
          child: const Text(
            'S U B M I T',
           
          ),
        )
      ],
    ),
            ),
          ),
        ),
      )),
    );
  }
}


