import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';

class TileSection extends StatelessWidget {
  const TileSection({
    super.key,
    required this.textTitle,
    required this.show,
    required this.toggleFunction,
  });
  final String textTitle;
  final bool show;
  final Function() toggleFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
      child: Row(
        children: [
          Text(
            textTitle,
            style: AppFonts.bodyText16.copyWith(fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          TextButton(
            onPressed: toggleFunction,
            child: Text(
              show ? 'Show Less' : 'Show More',
              style: !show
                  ? AppFonts.caption.copyWith(
                      fontWeight: FontWeight.bold,
                    )
                  : AppFonts.caption.copyWith(),
            ),
          ),
          // CustomButton(
          //   text: show ? 'Hide' : 'Show',
          //   textStyle: show
          //       ? AppFonts.bodyText16
          //           .copyWith(color: Colors.white, fontWeight: FontWeight.bold)
          //       : AppFonts.bodyText16
          //           .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          //   onPressed: toggleFunction,
          //   height: 40,
          //   width: 90,
          //   buttonStyle: show
          //       ? ElevatedButton.styleFrom(
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(20)),
          //           backgroundColor: Colors.black54,
          //           foregroundColor: Colors.black54,
          //         )
          //       : ElevatedButton.styleFrom(
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(20)),
          //           backgroundColor: Colors.grey[400],
          //           foregroundColor: Colors.grey),
          // ),
        ],
      ),
    );
  }
}
