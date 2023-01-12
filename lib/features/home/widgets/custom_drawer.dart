import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottery/features/home/widgets/custom_switch.dart';



class CustomDrawer extends StatefulWidget {
   CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text("dark theme"),
                Switch(
                  value: Get.isDarkMode,
                  onChanged: (val) {
                        setState(() {
                          Get.isDarkMode
                        ? Get.changeThemeMode(ThemeMode.light)
                        : Get.changeThemeMode(ThemeMode.dark);
                        });
                  },
                )
              ],
            )
          ],
        ),
      ),
      //todo
    );
  }
}
