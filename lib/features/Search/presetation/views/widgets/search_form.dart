import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recpie_app/features/Search/presetation/manager/filter_cubit/filter_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/Views/widgets/custom_text_form_field.dart';
import '../../../../../core/styles/fonts.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({
    super.key,
  });

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: BlocListener<FilterCubit, FilterState>(
        listener: (context, state) {
          if (state is ClearAllChips) {
            searchController.clear();
          }
        },
        child: Form(
          key: formKey,
          child: CustomTextFormField(
            controller: searchController,
            prefixIcon: FontAwesomeIcons.magnifyingGlass,
            prefixIconColor: kprimaryColor,
            hintText: 'Search any recipe...',
            hintStyle: AppFonts.caption,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter a name of recipe that you are craving';
              }
              return null;
            },
            onFieldSubmitted: (newValue) {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<FilterCubit>(context).selectQuery(newValue!);
              }
            },
          ),
        ),
      ),
    );
  }
}
