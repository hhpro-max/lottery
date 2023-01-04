import 'package:flutter/material.dart';

TextButton customCommonTextButton(
    {Function()? onPressed, required String title}) {
  return TextButton(onPressed: onPressed, child: Text(title));
}
