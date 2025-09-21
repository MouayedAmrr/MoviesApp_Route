import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_movies_app/core/theme/color_palette.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/routes/pages_route_name.dart';
import '../../../../main.dart';
import '../viewmodel/explore_cubit.dart';
import '../viewmodel/explore_states.dart';

class ExploreTabView extends StatefulWidget {
  const ExploreTabView({super.key});

  @override
  State<ExploreTabView> createState() => _ExploreTabViewState();
}

class _ExploreTabViewState extends State<ExploreTabView>
    with SingleTickerProviderStateMixin {
  final List<String> categories = [
    "Action",
    "Adventure",
    "Animation",
    "Biography",
    "Comedy",
    "Crime",
    "Documentary",
    "Drama",
    "Family",
    "Fantasy",
    "Film Noir",
    "Game-Show",
    "History",
    "Horror",
    "Music",
    "Musical",
    "Mystery",
    "News",
    "Reality-TV",
    "Romance",
    "Sci-Fi",
    "Short",
    "Sport",
    "Talk-Show",
    "Thriller",
    "War",
    "Western",
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);

    context.read<ExploreCubit>().loadMoviesByGenre(categories[0]);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging == false) {
        final genre = categories[_tabController.index];
        context.read<ExploreCubit>().loadMoviesByGenre(genre);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgcolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: ColorPalette.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                labelColor: Colors.black,
                unselectedLabelColor: ColorPalette.primaryColor,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                tabs:
                    categories.map((category) {
                      return Tab(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: ColorPalette.primaryColor,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            category,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),

          Expanded(
            child: BlocBuilder<ExploreCubit, ExploreState>(
              builder: (context, state) {
                if (state is ExploreLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ExploreLoaded) {
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8,
                    ),
                    itemCount: state.movies.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.64,
                        ),
                    itemBuilder: (BuildContext context, int index) {
                      final movie = state.movies[index];
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
                            vertical: 10,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              children: [
                                Image.network(
                                  movie.mediumCoverImage ?? "",
                                  width: 280,
                                  height: 320,
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Container(
                                    width: 58,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: ColorPalette.black.withOpacity(
                                        0.7,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "  ${movie.rating}",
                                          style: TextStyle(
                                            color: ColorPalette.white,
                                          ),
                                        ),
                                        const SizedBox(width: 7),
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
                  );
                } else if (state is ExploreError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
