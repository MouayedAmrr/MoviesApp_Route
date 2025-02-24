import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/widgets/filmContainerWidget.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 399,
      height: 600,

      child:Column(

        children: [
          Row(
            children: [
              ContinerfilmWidget(ImagePathDetails: AppAssets.movie4, rating: '7.7',),
              SizedBox(width: 15,),
              ContinerfilmWidget(ImagePathDetails: AppAssets.movie5, rating: '7.7',),

            ],
          ),
          Row(
            children: [
              ContinerfilmWidget(ImagePathDetails: AppAssets.movie6, rating: '7.7',),
              SizedBox(width: 15,),
              ContinerfilmWidget(ImagePathDetails: AppAssets.movie3, rating: '7.7',),
            ],
          ),


        ],
      ),
    );
  }
}
