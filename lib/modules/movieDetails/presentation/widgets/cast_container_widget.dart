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
      width: double.infinity,
      height: 92,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF282A28),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imagepath,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/nophoto.jpg',
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Name: $name",
                  style: const TextStyle(
                    color: ColorPalette.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 5),
                Text(
                  "Character: $character",
                  style: const TextStyle(
                    color: ColorPalette.white,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    ).setHorizontalPadding(context, 0.03);
  }
}
