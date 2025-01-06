import 'dart:core';

import 'package:flutter/material.dart';

class OnboardingModel {
  final String imagePath;
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color foregroundColor;

  OnboardingModel(
      {required this.backgroundColor,
      required this.foregroundColor,
      required this.imagePath,
      required this.title,
      required this.subtitle});
}
