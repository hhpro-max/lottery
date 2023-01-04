import 'package:flutter/material.dart';

ElevatedButton customCommonElevatedButton(
    {Function()? onPressed, required String title}) {
  return ElevatedButton(onPressed: onPressed, child: Text(title));
}
