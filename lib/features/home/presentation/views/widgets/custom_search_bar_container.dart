import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/fonts.dart';
import '../../manager/bottom_navigation_cubit/bottom_navigation_cubit.dart';

class CustomSearchBarContainer extends StatelessWidget {
  const CustomSearchBarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: GestureDetector(
        onTap: () =>
            BlocProvider.of<BottomNavigationCubit>(context).changeBottomNav(1),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 50,
          width: MediaQuery.of(context).size.width * .9,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: kprimaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Search any recipe...',
                  style: AppFonts.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
