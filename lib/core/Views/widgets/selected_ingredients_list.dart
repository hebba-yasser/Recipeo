import 'package:flutter/cupertino.dart';
import 'package:recpie_app/core/Views/widgets/custom_text_button.dart';

import '../../../constants.dart';
import '../../styles/fonts.dart';

class SelectedIngredientsList extends StatelessWidget {
  const SelectedIngredientsList({
    super.key,
    required this.ingredientList,
    required this.onPressed,
  });
  final List ingredientList;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Wrap(
        direction: Axis.vertical,
        children: List.generate(
          (ingredientList.length),
          (index) {
            return Row(
              children: [
                Text(
                  ingredientList[index],
                  style:
                      AppFonts.bodyText16.copyWith(fontWeight: FontWeight.w500),
                ),
                CustomTextButton(
                    text: 'clear',
                    style: AppFonts.caption.copyWith(
                      color: kprimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    onPressed: () {
                      onPressed(ingredientList[index]);
                    }),
              ],
            );
          },
        ),
      ),
    );
  }
}
