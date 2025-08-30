import 'package:flutter/material.dart' show Colors, Color;
import 'package:fluttertoast/fluttertoast.dart'
    show Fluttertoast, Toast, ToastGravity;

import '../utils/app_enums.dart' show Status;

toast(String message, Status status) {
  late final Color color;
  switch (status) {
    case Status.success:
      color = Colors.green;
      break;
    case Status.error:
      color = Colors.red;
      break;

    default:
      color = Colors.blue;
      break;
  }

  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
