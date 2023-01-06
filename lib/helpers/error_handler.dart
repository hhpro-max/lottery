import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottery/helpers/show_custom_alertdialog.dart';

class ErrHandler {
  void httpErrHandler(
      {required http.Response response,
      required VoidCallback onSuccess,
      required BuildContext context,
      List<Widget>? actions}) {
    if (response.statusCode == 200) {
      showMyDialog(
          context: context,
          title: "Successful",
          actions: actions,
          description: 'request has been done successfully',
          barrierDismissible: actions==null);
      onSuccess();
    } else {
      showMyDialog(
          context: context,
          title: "UnSuccessful",
          description: jsonDecode(response.body)['err'],
          barrierDismissible: true);
    }
  }
}
