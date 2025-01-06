import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';
import 'add_collection_sheet.dart';

class NewCollectionTile extends StatelessWidget {
  const NewCollectionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isDismissible: false,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          builder: (context) {
            return const AddCollectionSheet();
          },
        );
      },
      contentPadding: const EdgeInsets.all(0),
      leading: const Icon(
        CupertinoIcons.plus,
        color: Colors.black,
      ),
      title: Text(
        'Create New Collection',
        style: AppFonts.bodyText16.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
