import 'package:flutter/material.dart';

import '../../../constants.dart';

Center customLoadingIndicator() {
  return const Center(
    child: CircularProgressIndicator(
      color: kprimaryColor,
    ),
  );
}
