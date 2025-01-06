import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -60, // Add some margin to avoid clipping at the edge
      left: -80, // Add some margin to avoid clipping at the edge
      child: ClipRect(
        child: Transform.rotate(
          angle: 1.0,
          child: SizedBox(
            width: 290,
            height: 290,
            child: Image.asset(
              'assets/images/blue.jpg',
              width: 200,
              height: 150,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
