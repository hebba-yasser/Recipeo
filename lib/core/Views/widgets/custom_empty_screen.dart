import 'package:flutter/material.dart';

import '../../styles/fonts.dart';

class CustomEmptyScreen extends StatelessWidget {
  const CustomEmptyScreen({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  final String title;
  final String subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.grey,
            size: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
            child: Text(
              title,
              style: AppFonts.heading20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
            child: Text(
              subTitle,
              style: AppFonts.caption,
            ),
          ),
        ],
      ),
    );
  }
}
