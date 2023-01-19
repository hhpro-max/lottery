import 'package:flutter/material.dart';
import 'package:lottery/common/widgets/custom_common_elevatedbutton.dart';
import 'package:lottery/common/widgets/custom_common_textbutton.dart';
import 'package:lottery/common/widgets/custom_common_textformfield.dart';
import 'package:get/get.dart';
import 'package:lottery/common/widgets/loading_opacity_screen.dart';
import 'package:lottery/features/auth/services/auth_services.dart';
import 'package:lottery/helpers/config.dart';

import '../../../common/widgets/custom_common_appbar.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customCommonAppBar(titleText: "Sign In"),
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("Sign In To Your Account"),
              const SizedBox(
                height: 20,
              ),
              customCommonTextFormField(
                  labelText: "username or Email Address",
                  controller: userNameController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "pls enter your user name or email address";
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              customCommonTextFormField(
                  labelText: "password", controller: passwordController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "pls enter your password";
                    }
                    return null;
                  },),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customCommonTextButton(title: "or Sign Up", onPressed: () {
                    Get.offNamed('/signup');
                  }),
                  customCommonElevatedButton(
                    title: "Sign In",
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        AuthServices.signIn(
                          userName: userNameController.text,
                          password: passwordController.text,
                          context: context);
                      }
                    },
                  ),
                ],
              ),
            ]),
          ),
        ),
        Obx(() => Get.find<Config>().waitingForResponse.value == false
            ? Container()
            : const LoadingOpacityScreen())
      ]),
    );
  }
}
