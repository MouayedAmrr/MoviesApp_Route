import 'package:flutter/material.dart';
import 'package:route_movies_app/core/extensions/extensions.dart';
import 'package:route_movies_app/core/theme/color_palette.dart';

class CastContainer extends StatelessWidget {
  final String imagepath;
  final String name;
  final String character;

  const CastContainer({
    super.key,
    required this.name,
    required this.character,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 389,
      height: 92,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFF282A28),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagepath,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Name: $name",
                style: TextStyle(
                  color: ColorPalette.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Character: $character",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
