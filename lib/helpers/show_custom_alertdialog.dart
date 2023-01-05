import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showMyDialog({required BuildContext context,required String title,required String description,required bool barrierDismissible,List<Widget>? actions}) async{
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
  builder: (context) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: actions??[
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child:const Text("ok"))
      ],
    );
  } 
  );
}