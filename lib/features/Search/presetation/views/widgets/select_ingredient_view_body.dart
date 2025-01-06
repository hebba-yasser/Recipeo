import 'package:flutter/cupertino.dart';

import '../../../../../core/Views/widgets/black_search_button.dart';
import 'igredient_form.dart';

class SelectIngredientViewBody extends StatelessWidget {
  const SelectIngredientViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const IngredientsForm(),
        CustomBlackButton(
          title: 'Done',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
