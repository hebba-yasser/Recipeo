import 'package:flutter/material.dart';

void navigatorPushAndRemove(BuildContext context, page) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
    (route) {
      return false;
    },
  );
}
