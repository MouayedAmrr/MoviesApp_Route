import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../theme/color_palette.dart';

class ContinerfilmWidget extends StatelessWidget {
  final String rating;
  final String ImagePathDetails;

  const ContinerfilmWidget({super.key, required this.ImagePathDetails, required this.rating});

  @override
  Widget build(BuildContext context) {

    return  Stack(
      children: [
        Image.network(
          ImagePathDetails,
          width: 180,
          height: 280,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            padding: EdgeInsets.all(5),
            width: 65,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(16)
            ),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(rating, style: TextStyle(color: ColorPalette.white, fontSize: 16, fontWeight: FontWeight.w500),),
                SizedBox(width: 7,),
                Image.asset(AppAssets.startImageRate),
              ],
            ),
          ),
        ),
      ],
    )
    ;
  }
}
