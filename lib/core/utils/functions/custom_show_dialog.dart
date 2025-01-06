import 'package:flutter/material.dart';

import '../../Views/widgets/custom_button.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';

Future<dynamic> customShowDialog({
  required BuildContext context,
  String? title,
  String? description,
  String? titleButton1,
  String? titleButton2,
  void Function()? onPressed1,
  void Function()? onPressed2,
  Widget? widgetTitle,
  Widget? widgetContent,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: widgetTitle ??
            Text(
              title ?? '',
              style: AppFonts.bodyText18,
            ),
        content: widgetContent ??
            Text(
              description ?? '',
              style: AppFonts.bodyText16,
            ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CustomButton(
                  buttonStyle: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                    foregroundColor: AppColors.lightPeach,
                  ),
                  text: titleButton1 ?? '',
                  onPressed: onPressed1 ?? () {},
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomButton(
                  text: titleButton2 ?? '',
                  onPressed: onPressed2 ?? () {},
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
