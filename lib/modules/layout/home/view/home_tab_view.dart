import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_movies_app/core/extensions/extensions.dart';
import 'package:route_movies_app/core/routes/pages_route_name.dart';
import 'package:route_movies_app/core/theme/color_palette.dart';
import 'package:route_movies_app/main.dart';
import '../../../../core/constants/app_assets.dart';
import '../viewModel/home_cubit.dart';
import '../viewModel/home_states.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<HomeCubit>();
    cubit.getTopMovies();
    cubit.startRotatingGenres();
  }

  @override
  void dispose() {
    context.read<HomeCubit>().stopGenrePolling();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error!)));
        }
      },
      builder: (context, state) {
        final topMovies = state.topMovies;
        final genreMovies = state.genreMovies;

        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 890,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            topMovies.isNotEmpty
                                ? NetworkImage(
                                  topMovies[_currentIndex].largeCoverImage ??
                                      "",
                                )
                                : AssetImage(AppAssets.homeview)
                                    as ImageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 890,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF121312).withOpacity(0.8), // 80%
                          const Color(0xFF121312).withOpacity(0.6), // 60%
                          const Color(0xFF121312).withOpacity(1.0), // 100%
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Image.asset(AppAssets.availableNow).setHorizontalPadding(context, 0.05),
                        if (state.isTopLoading)
                          const Center(child: CircularProgressIndicator())
                        else if (topMovies.isNotEmpty)
                          CarouselSlider(
                            items: topMovies.map((movie) {
                              return GestureDetector(
                                onTap: () {
                                  navigatorKey.currentState!.pushNamed(
                                    PagesRouteName.movieDetails,
                                    arguments: movie.id.toString(),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        movie.largeCoverImage ?? "",
                                        fit: BoxFit.fill,
                                        width: 250,
                                      ),
                                      Positioned(
                                        top: 10,
                                        left: 10,
                                        child: Container(
                                          width: 65,
                                          height: 30,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: ColorPalette.black.withOpacity(0.6),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${movie.rating}",
                                                style: const TextStyle(
                                                  color: ColorPalette.white,
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
                              height: 370,
                              aspectRatio: 0.7,
                              viewportFraction: 0.64,
                              enableInfiniteScroll: true,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                            ),
                          ),

                        Image.asset(AppAssets.watchNow,height: 150,).setHorizontalPadding(context, 0.05),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.genreName ?? "Movies",
                              style: const TextStyle(
                                color: ColorPalette.white,
                                fontSize: 20,
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    navigatorKey.currentState!.pushNamed(
                                      PagesRouteName.layout,
                                      arguments: 2,
                                    );
                                  },
                                  child: Text(
                                    "See More ",
                                    style: TextStyle(
                                      color: ColorPalette.primaryColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 15,
                                  color: ColorPalette.primaryColor,
                                ),
                              ],
                            ),
                          ],
                        ).setHorizontalPadding(context, 0.03),

                        const SizedBox(height: 10),

                        SizedBox(
                          height: 220,
                          child:
                          state.isGenreLoading
                              ? const Center(child: CircularProgressIndicator())
                              : ListView.builder(
                            itemCount: genreMovies.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final movie = genreMovies[index];
                              return GestureDetector(
                                onTap: () {
                                  navigatorKey.currentState!.pushNamed(
                                    PagesRouteName.movieDetails,
                                    arguments: movie.id.toString(),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          movie.mediumCoverImage ?? "",
                                          width: 146,
                                          height: 220,
                                          fit: BoxFit.fill,
                                        ),
                                        Positioned(
                                          top: 10,
                                          left: 10,
                                          child: Container(
                                            width: 58,
                                            height: 28,
                                            decoration: BoxDecoration(
                                              color: ColorPalette.black
                                                  .withOpacity(0.7),
                                              borderRadius:
                                              BorderRadius.circular(16),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "  ${movie.rating}",
                                                  style: TextStyle(
                                                    color:
                                                    ColorPalette.white,
                                                  ),
                                                ),
                                                const SizedBox(width: 7),
                                                Image.asset(
                                                  AppAssets.startImageRate,
                                                ),
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
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
