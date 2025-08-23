import 'package:flutter/material.dart';

Widget customTextFormField({
  required String labelText,
  String? hintText,
  String? suffixText,
  TextInputType? textInputType,
  TextInputAction? textInputAction,
  required TextEditingController controller,
  required FocusNode focusNode,
  required FormFieldValidator validator,
}){
  return TextFormField(
    controller: controller,
    focusNode: focusNode,
    keyboardType: textInputType,
    textInputAction: textInputAction,
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText ?? "",
      suffixText: suffixText ?? "",
      border: const OutlineInputBorder(),
    ),
    validator: validator
  );
}