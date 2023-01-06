import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/common/widgets/custom_common_appbar.dart';

import '../../../providers/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  //todo make this shit looks better pls
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customCommonAppBar(titleText: "Profile"),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("User Name : ${Get.find<UserProvider>().user.userName}"),
              const SizedBox(
                height: 20,
              ),
              Text("ID : ${Get.find<UserProvider>().user.id}"),
              const SizedBox(
                height: 20,
              ),
              Text("Email : ${Get.find<UserProvider>().user.email}"),
              const SizedBox(
                height: 20,
              ),
              Text("Cart : ${Get.find<UserProvider>().user.cart}")
            ],
          )),
    );
  }
}
