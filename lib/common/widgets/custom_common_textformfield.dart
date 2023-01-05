import 'package:flutter/material.dart';

TextFormField customCommonTextFormField({
String? labelText,
TextEditingController? controller,
String? Function(String?)? validator
}){

  return TextFormField(
    controller: controller,
    validator: validator,
    decoration: InputDecoration(
                  border:const OutlineInputBorder(
                    borderRadius:  BorderRadius.all(Radius.circular(8.0))
                  ),
                  labelText: labelText
                  ),
  );
}