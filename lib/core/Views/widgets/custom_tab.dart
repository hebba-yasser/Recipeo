import 'package:flutter/cupertino.dart';

import '../../../../../core/styles/fonts.dart';

class CustomTab extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomTab({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            subtitle,
            style: AppFonts.caption
                .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
