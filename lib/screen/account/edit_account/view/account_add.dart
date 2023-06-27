import 'package:ecomerce/core/constent.dart';

import 'package:ecomerce/screen/account/account_main/controller/account_controller.dart';

import 'package:ecomerce/screen/account/account_main/model/get_account_model.dart';
import 'package:ecomerce/screen/account/edit_account/controller/edit_controller.dart';
import 'package:ecomerce/screen/account/view_acount/all_account_view.dart';

import 'package:ecomerce/util/row_textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAccountPage extends StatelessWidget {
  EditAccountPage(
      {super.key,
      required this.width,
      required this.height,
      required this.model});
  final GetAddressModel model;
  final double width;
  final double height;
  final accountC = Get.put(EditContoller());
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    accountC.initial(model);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Edit Address',
              style: TextStyle(
                letterSpacing: 3,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: GetBuilder<EditContoller>(
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
                  const SizedBox(
                    height: 30,
                  ),
                  TextFromFieldWidget(
                    textController: accountC.fullNameC,
                    textInputType: TextInputType.name,
                    nullText: 'Fullname is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.person),
                    text: 'Full Name',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFromFieldWidget(
                    textController: accountC.phoneC,
                    textInputType: TextInputType.number,
                    nullText: 'Phone number is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.phone),
                    text: 'Phone Number',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFromFieldWidget(
                    textController: accountC.pinC,
                    textInputType: TextInputType.number,
                    nullText: 'PinCode is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.pin),
                    text: 'PinCode',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFromFieldWidget(
                    textController: accountC.stateC,
                    textInputType: TextInputType.name,
                    nullText: 'State is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.public),
                    text: 'State',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFromFieldWidget(
                    textController: accountC.placeC,
                    textInputType: TextInputType.name,
                    nullText: 'Place is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.location_on),
                    text: 'Place',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFromFieldWidget(
                    textController: accountC.addressC,
                    textInputType: TextInputType.streetAddress,
                    nullText: 'Address is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.contact_mail),
                    text: 'Address',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFromFieldWidget(
                    textController: accountC.landmarkC,
                    textInputType: TextInputType.name,
                    nullText: 'LandMark is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.emoji_flags),
                    text: 'Delivary Location',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
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
                      if (fromKey.currentState!.validate()) {
                        accountC.updateAddress(model.id);

                        Get.off(AllAccountView(
                          width: width,
                          height: height,
                        ));
                      }
                      AcountController().getAllAddress();
                    },
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
