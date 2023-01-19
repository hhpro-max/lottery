import 'package:flutter/material.dart';
Widget editingTextFormField({required BuildContext context,required String editingText}){
  return SizedBox(
                        width: MediaQuery.of(context).size.width/2,
                        child: TextFormField(
                            initialValue: editingText,
                            decoration: const InputDecoration(
                                 border: OutlineInputBorder()
                                ),
                                   
                          ),
                      );
}