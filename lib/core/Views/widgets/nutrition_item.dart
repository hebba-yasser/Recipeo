import 'package:flutter/cupertino.dart';

import '../../../../../core/styles/fonts.dart';

class NutritionItem extends StatelessWidget {
  const NutritionItem({
    super.key,
    required this.text,
    required this.amount,
    required this.rda,
    this.style,
    this.alignText,
  });

  final String text;
  final String amount;
  final String rda;
  final TextStyle? style;
  final double? alignText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: alignText ?? 0),
              child: Text(
                text,
                style: style ?? AppFonts.bodyText14,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                amount.isEmpty || amount == '0.0' ? 'N/A' : amount,
                style: style ?? AppFonts.bodyText14,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight, // Right-align the RDA value
              child: Text(
                rda.isEmpty || rda == '0.0' ? 'N/A' : rda,
                style: style ?? AppFonts.bodyText14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
