import 'package:flutter/material.dart';

import '../../styles/fonts.dart';

class HeaderDescText extends StatelessWidget {
  const HeaderDescText(
      {super.key,
      required this.title,
      required this.subTitle,
      this.subTitleAlign,
      this.titleAlign,
      this.crossAxisAlignment});
  final String title;
  final String subTitle;
  final TextAlign? subTitleAlign;
  final TextAlign? titleAlign;
  final CrossAxisAlignment? crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppFonts.heading22,
          textAlign: titleAlign ?? TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          subTitle,
          style: AppFonts.bodyText16
              .copyWith(fontWeight: FontWeight.w500, color: Colors.black54),
          textAlign: subTitleAlign ?? TextAlign.center,
        ),
        // const SizedBox(
        //   height: 40,
        // ),
      ],
    );
  }
}
