import 'package:flutter/material.dart';

import 'custom_button.dart';

class CustomBlackButton extends StatelessWidget {
  const CustomBlackButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isButtonDisabled = false,
  });

  final String title;
  final void Function() onPressed;
  final bool isButtonDisabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: CustomButton(
        isButtonDisabled: isButtonDisabled,
        text: title,
        buttonStyle: isButtonDisabled
            ? ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
              )
            : ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
              ),
        onPressed: onPressed,
      ),
    );
  }
}
