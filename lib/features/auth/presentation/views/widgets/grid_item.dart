import 'package:flutter/material.dart';
import 'package:recpie_app/constants.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
    this.selectedList,
    required this.label,
  });

  final String title;
  final String image;
  final Function() onTap;
  final selectedList;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 45.0,
            backgroundColor:
                selectedList.contains(label) ? kprimaryColor : Colors.grey[400],
            child: CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage(image),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(
                color:
                    selectedList.contains(label) ? kprimaryColor : Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
