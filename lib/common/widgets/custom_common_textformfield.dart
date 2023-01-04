import 'package:flutter/material.dart';

TextFormField customCommonTextFormField({
String? labelText
}){
  return TextFormField(
    decoration: InputDecoration(
                  border:const OutlineInputBorder(
                    borderRadius:  BorderRadius.all(Radius.circular(8.0))
                  ),
                  labelText: labelText
                  ),
  );
}