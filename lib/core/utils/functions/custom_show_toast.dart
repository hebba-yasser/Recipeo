import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';

void customShowToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    timeInSecForIosWeb: 20,
    backgroundColor: kprimaryColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
