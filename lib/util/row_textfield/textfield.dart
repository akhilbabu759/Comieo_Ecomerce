import 'package:ecomerce/core/constent.dart';
import 'package:flutter/material.dart';

class TextFromFieldWidget extends StatelessWidget {
  const TextFromFieldWidget({
    Key? key,
    required this.textController,
    required this.nullText,
    required this.obscureText,
    required this.icon,
    required this.text,
    required this.textInputType,
  }) : super(key: key);

  final TextEditingController textController;
  final String nullText;
  final bool obscureText;
  final Widget icon;
  final String text;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: textInputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return nullText;
        } else {
          return null;
        }
      },
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {},
          icon: icon,
          color: colorblack,
        ),
        label: Text(
          text,
          style: const TextStyle(color: colorblack),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20)),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
