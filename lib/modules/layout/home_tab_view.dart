import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_movies_app/core/extensions/extensions.dart';
import 'package:route_movies_app/core/routes/pages_route_name.dart';
import 'package:route_movies_app/core/theme/color_palette.dart';
import 'package:route_movies_app/main.dart';
import 'package:route_movies_app/modules/layout/viewModel/movie_view_model.dart';

import '../../core/constants/app_assets.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  int _currentIndex = 0;
  late MovieViewModel _viewModel;

  @override
  void initState() {
    _viewModel = Provider.of<MovieViewModel>(context, listen: false);
    super.initState();
    // Fetch the movie data on init
    Future.wait([
      _viewModel.getHomeFilmData()
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 890,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.homeview),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 100),
                // Use movieHomeDataList for Carousel
              CarouselSlider(
                items: _viewModel.movieHomeDataList.map((movie) {
                  return GestureDetector(
                    onTap: () {
                      _viewModel.onFilmClicked(movie);
                      navigatorKey.currentState!.pushNamed(PagesRouteName.movieDetails);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        children: [
                          Image.network(
                            movie.backgroundImage,
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${movie.rating}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Image.asset(AppAssets.startImageRate),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 354,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(height: 160),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Action",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          Text(
                            "See More ",
                            style: TextStyle(
                              color: ColorPalette.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 15,
                            color: ColorPalette.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ).setHorizontalPadding(context, 0.03),
                SizedBox(height: 10),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    itemCount: _viewModel.movieHomeDataList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final movie = _viewModel.movieHomeDataList[index];
                      return GestureDetector(
                        onTap: () {
                          _viewModel.onFilmClicked(movie);
                          navigatorKey.currentState!.pushNamed(PagesRouteName.movieDetails);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              children: [
                                Image.asset(
                                  movie.coverImage,
                                  width: 146,
                                  height: 220,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Container(
                                    width: 58,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "  ${
                                          movie.rating
                                        }",
                                          style: TextStyle(color: ColorPalette.white),
                                        ),
                                        SizedBox(width: 7),
                                        Image.asset(AppAssets.startImageRate),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
