import 'package:flutter/material.dart';

void navigatorPush(BuildContext context, page) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return page;
      },
    ),
  );
}
