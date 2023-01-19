import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/common/widgets/custom_common_appbar.dart';
import 'package:lottery/features/home/widgets/custom_appbar.dart';

import '../../../common/widgets/custom_common_elevatedbutton.dart';
import '../../../common/widgets/custom_common_textbutton.dart';
import '../../../common/widgets/custom_common_textformfield.dart';
import '../../../common/widgets/loading_opacity_screen.dart';
import '../../../helpers/config.dart';
import '../services/auth_services.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customCommonAppBar(titleText: "Sign Up"),
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("Create New Account"),
              const SizedBox(
                height: 20,
              ),
              customCommonTextFormField(
                  labelText: "username",
                  controller: userNameController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "pls enter your user name";
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              customCommonTextFormField(
                  labelText: "email",
                  controller: emailController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "pls enter your email address";
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              customCommonTextFormField(
                labelText: "password",
                controller: passwordController,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "pls enter your password";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customCommonTextButton(
                      title: "or Sign In to your account",
                      onPressed: () {
                        Get.offNamed('/signin');
                      }),
                  customCommonElevatedButton(
                    title: "Sign Up",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        AuthServices.signUp(
                            userName: userNameController.text,
                            email: emailController.text,
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
