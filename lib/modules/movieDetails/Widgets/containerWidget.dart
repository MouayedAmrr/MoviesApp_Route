import 'package:flutter/material.dart';
import 'package:route_movies_app/core/theme/color_palette.dart';

class ContainerWidget extends StatelessWidget {
  final String text;
  final String? imagePath;
  final double fontSize;

  const ContainerWidget({
    super.key,
    required this.text,
    this.imagePath,
    this.fontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122,
      height: 47,
      decoration: BoxDecoration(
        color: Color(0xFF282A28),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath != null) ...[
            Image.asset(imagePath!, width: 24, height: 24),
            SizedBox(width: 10),
          ],
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize, // ✅ Use the dynamic font size
              color: ColorPalette.white,
            ),
          ),
        ],
      ),
    );
  }
}
