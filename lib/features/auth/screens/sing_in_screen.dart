import 'package:flutter/material.dart';
import 'package:lottery/common/widgets/custom_common_elevatedbutton.dart';
import 'package:lottery/common/widgets/custom_common_textbutton.dart';
import 'package:lottery/common/widgets/custom_common_textformfield.dart';
import 'package:get/get.dart';
import 'package:lottery/common/widgets/loading_opacity_screen.dart';
import 'package:lottery/helpers/config.dart';
class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Stack(
        children:[ Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(12.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("Sign In To Your Account"),
            const SizedBox(
              height: 20,
            ),
            customCommonTextFormField(labelText: "username or Email Address"),
            const SizedBox(
              height: 20,
            ),
            customCommonTextFormField(labelText: "password"),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customCommonTextButton(title: "or Sign Up",onPressed: (){}),
                customCommonElevatedButton(title: "Sign In", onPressed: () {
                      
                },),
              ],
            ),
            
          ]),
        ),
        Obx(()=>Get.find<Config>().waitingForLoginRes.value ==false?Container():const LoadingOpacityScreen())
        ]
      ),
    );
  }
}
