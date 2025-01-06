import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/Views/widgets/custom_divider.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../create_collection_recipes_view.dart';
import 'library_sheet_app_bar.dart';

class AddCollectionSheet extends StatefulWidget {
  const AddCollectionSheet({
    super.key,
  });

  @override
  State<AddCollectionSheet> createState() => _AddCollectionSheetState();
}

class _AddCollectionSheetState extends State<AddCollectionSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController textController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  @override
  Widget build(BuildContext context) {
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
              title: 'New Collection',
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
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pop(context);
                          navigatorPush(
                              context,
                              CreateCollectionRecipesView(
                                  collectionName: textController.text));
                          textController.clear();
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isButtonEnabled ? kprimaryColor : Colors.grey[400],
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Next',
                  style: AppFonts.heading20.copyWith(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
