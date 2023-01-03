


import 'package:flutter/material.dart';



import 'package:lottery/features/home/widgets/custom_cupertino_switch.dart';


Drawer customDrawer() {
  
  return Drawer(
    child: Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              const Text("dark theme"),
              customSwitch
            ],
          )
        ],
      ),
    ),
    //todo
  );
}
