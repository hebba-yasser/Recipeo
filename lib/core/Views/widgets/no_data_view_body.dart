import 'package:flutter/material.dart';
import 'package:recpie_app/core/styles/fonts.dart';

class NoDataViewBody extends StatelessWidget {
  const NoDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/confused_chef.png'),
        Center(
          child: Text(
            "Looks like we're out of recipes for now. Try again later!",
            style: AppFonts.heading20,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
