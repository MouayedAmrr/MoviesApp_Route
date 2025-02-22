import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  int _currentIndex = 0;

  final List<String> movieImages = [
    "assets/images/moviephoto.png",
    "assets/images/movie2.png",
    "assets/images/movie3.png",
    "assets/images/movie4.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 830,
          child: Image.asset(
            AppAssets.homeview,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 100,
          left: 0,
          right: 0,
          child: CarouselSlider(
            items: movieImages.map((imagePath) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children:[
                    Image.asset(
                    imagePath,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        width: 65,
                        height: 30,
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("7,7", style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),),
                            Image.asset(AppAssets.startImageRate)
                          ],
                        ),
                      ),
                    ),
                    
                ]
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 354,
              aspectRatio: 0.7,
              viewportFraction: 0.6,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
        SizedBox(height: 100,)
      ],
    );
  }
}
