import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/common/widgets/custom_common_appbar.dart';
import 'package:lottery/features/profile/services/user_profile_services.dart';
import 'package:lottery/features/profile/widgets/editing_text_formfield.dart';

import '../../../common/widgets/loading_opacity_screen.dart';
import '../../../helpers/config.dart';
import '../../../providers/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //todo make this shit looks better pls
  bool editingMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customCommonAppBar(titleText: "Profile", actions: [
        editingMode == false
            ? IconButton(
                onPressed: () {
                  setState(() {
                    editingMode = true;
                  });
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.green,
                ))
            : IconButton(
                onPressed: () {
                  setState(() {
                    editingMode = false;
                  });
                },
                icon: const Icon(
                  Icons.save,
                  color: Colors.yellow,
                )),
        IconButton(
            onPressed: () {
              UserProfileServices.logout(context: context);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.red,
            ))
      ]),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("UID : ${Get.find<UserProvider>().user.id}"),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  
                  const Text("User Name : "),
                  editingMode == true
                      ? editingTextFormField(context: context, editingText: Get.find<UserProvider>().user.userName)
                      : Text(Get.find<UserProvider>().user.userName)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              
              
              Row(
                children: [
                  const Text("Email : "),
                  editingMode == true
                      ? editingTextFormField(context: context, editingText: Get.find<UserProvider>().user.email)
                      : Text(Get.find<UserProvider>().user.email)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Your Lottery Cards : ${Get.find<UserProvider>().user.cart}")
            ],
          ),
          Obx(()=> Get.find<Config>().waitingForResponse.value == false
            ? Container()
            : const LoadingOpacityScreen())
            ],
          )
          ),
    );
  }
}
