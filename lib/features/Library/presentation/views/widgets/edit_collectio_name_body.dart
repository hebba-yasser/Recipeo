import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie_app/core/data/models/user_model/collections_model.dart';
import 'package:recpie_app/core/utils/functions/custom_loading_indicator.dart';
import 'package:recpie_app/features/Library/presentation/manager/manage_collections_cubit/manage_collections_cubit.dart';
import 'package:recpie_app/features/Library/presentation/manager/manage_collections_cubit/manage_collections_state.dart';

import '../../../../../constants.dart';
import '../../../../../core/Views/widgets/custom_divider.dart';
import '../../../../../core/styles/fonts.dart';
import 'library_sheet_app_bar.dart';

class EditCollectionNameBody extends StatefulWidget {
  const EditCollectionNameBody(
      {super.key, required this.collectionModel, required this.value});

  final CollectionModel collectionModel;
  final ManageCollectionsCubit value;

  @override
  State<EditCollectionNameBody> createState() => _EditCollectionNameBodyState();
}

class _EditCollectionNameBodyState extends State<EditCollectionNameBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController textController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    textController.text = widget.collectionModel.collectionName;
    if (textController.text.isEmpty) {
      isButtonEnabled = false;
    } else {
      isButtonEnabled = true;
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ManageCollectionsCubit>.value(
      value: widget.value,
      child: BlocBuilder<ManageCollectionsCubit, ManageCollectionsState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: 12.0,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LibrarySheetAppBar(
                    onPressed: () {
                      textController.clear();
                      Navigator.pop(context);
                    },
                    title: 'Change Collection name',
                  ),
                  const CustomDivider(),
                  const SizedBox(height: 15),
                  Text(
                    'Name',
                    style: AppFonts.bodyText18,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: textController,
                    maxLength: 30,
                    autofocus: true,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: kprimaryColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: kprimaryColor),
                      ),
                      hintText: 'Enter Collection Name',
                      hintStyle: AppFonts.caption,
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          isButtonEnabled = false;
                        });
                      } else {
                        setState(() {
                          isButtonEnabled = true;
                        });
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Collection name cannot be empty';
                      } else if (value.length > 30) {
                        return 'Name cannot be longer than 30 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: state is UpdateCollectionsLoading
                        ? customLoadingIndicator()
                        : ElevatedButton(
                            onPressed: isButtonEnabled
                                ? () async {
                                    if (formKey.currentState!.validate()) {
                                      await context
                                          .read<ManageCollectionsCubit>()
                                          .updateCollections(
                                            collection: CollectionModel(
                                                collectionName:
                                                    textController.text,
                                                collectionId: widget
                                                    .collectionModel
                                                    .collectionId,
                                                recipes: widget
                                                    .collectionModel.recipes,
                                                createdAt: widget
                                                    .collectionModel.createdAt),
                                          );
                                    }
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isButtonEnabled
                                  ? kprimaryColor
                                  : Colors.grey[400],
                              foregroundColor: Colors.white,
                            ),
                            child: Text(
                              'Next',
                              style: AppFonts.heading20
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
