  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:route_movies_app/core/constants/app_assets.dart';
  import 'package:route_movies_app/core/extensions/extensions.dart';
  import 'package:route_movies_app/core/theme/color_palette.dart';
  import 'package:route_movies_app/core/widgets/custom_elevated_button.dart';
  import 'package:route_movies_app/main.dart';
  import 'package:route_movies_app/modules/moviedetails/presentation/viewmodel/movie_details_states.dart';
  import '../../../../core/widgets/filmContainerWidget.dart';
  import '../viewmodel/movie_details_cubit.dart';
  import '../viewmodel/related_movie_states.dart';
  import '../viewmodel/relates_movies_cubit.dart';
  import '../widgets/cast_container_widget.dart';
  import '../widgets/container_widget.dart';


  class MovieDetailsView extends StatefulWidget {
    final String movieId;

    const MovieDetailsView({super.key, required this.movieId});

    @override
    State<MovieDetailsView> createState() => _MovieDetailsViewState();
  }

  class _MovieDetailsViewState extends State<MovieDetailsView> {
    bool isMarked = false;

    @override
    void initState() {
      super.initState();
      context.read<MovieDetailsCubit>().getMovieDetails(widget.movieId);
      context.read<RelatedMoviesCubit>().getRelatedMovies(widget.movieId);
    }

    @override
    Widget build(BuildContext context) {
      var mediaQuery = MediaQuery.sizeOf(context);
      return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MovieDetailsErrorState) {
            return Center(child: Text(state.message));
          }
          if (state is MovieDetailsSuccessState) {
            final movie = state.movieDetails;

            return Scaffold(
              body: SizedBox(
                height: mediaQuery.height,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: mediaQuery.height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(movie.backgroundImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                      //child: ,
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    navigatorKey.currentState!.pop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isMarked = !isMarked;
                                    });
                                  },
                                  child: Icon(
                                    isMarked
                                        ? Icons.bookmark
                                        : Icons.bookmark_border_outlined,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                              ],
                            ).setHorizontalAndVerticalPadding(
                              context,
                              0.04,
                              0.048,
                            ),
                            SizedBox(height: 100),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(AppAssets.playMovieImage),
                            ),
                            SizedBox(height: 195),
                            Text(
                              movie.title,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 12),
                            Text(
                              movie.year.toString(),
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: CustomElevatedButton(
                                borderRadius: 15,
                                title: "Watch",
                                bgColor: ColorPalette.red,
                                titleColor: Colors.white,
                                titleSize: 22,
                              ),
                            ).setHorizontalPadding(context, 0.035),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ContainerWidget(
                                  text: movie.rating.toString(),
                                  imagePath: AppAssets.favIcon,
                                ),
                                ContainerWidget(
                                  text: movie.runtime.toString(),
                                  imagePath: AppAssets.timeIcon,
                                ),
                                ContainerWidget(
                                  text: movie.rating.toString(),
                                  imagePath: AppAssets.RatingIcon,
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Screen Shots",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: ColorPalette.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ).setHorizontalPadding(context, 0.035),
                            SizedBox(height: 18),
                            Image.network(movie.largeScreenshot1),
                            SizedBox(height: 18),
                            Image.network(movie.largeScreenshot2),
                            SizedBox(height: 18),
                            Image.network(movie.largeScreenshot3),
                            SizedBox(height: 18),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Similar",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: ColorPalette.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ).setHorizontalPadding(context, 0.035),
                            SizedBox(height: 18),

                            BlocBuilder<RelatedMoviesCubit, RelatedMoviesState>(
                              builder: (context, state) {
                                if (state is RelatedMoviesLoadingState) {
                                  return const Center(child: CircularProgressIndicator());
                                }
                                if (state is RelatedMoviesErrorState) {
                                  return Center(child: Text(state.message, style: TextStyle(color: Colors.red)));
                                }
                                if (state is RelatedMoviesSuccessState) {
                                  final relatedMovies = state.relatedMovies;
                                  debugPrint("Movie Summary: ${movie.summary}");


                                  return GridView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    itemCount: relatedMovies.length > 4 ? 4 : relatedMovies.length,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,   // 2 items per row
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 12,
                                      childAspectRatio: 0.65, // adjust to make height look nice
                                    ),
                                    itemBuilder: (context, index) {
                                      final movie = relatedMovies[index];
                                      return ContinerfilmWidget(
                                        ImagePathDetails: movie.mediumCoverImage,
                                        rating: movie.rating.toString(),
                                      );
                                    },
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),

                            SizedBox(height: 18),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Summary",
                                style: const TextStyle(
                                  fontSize: 28,
                                  color: ColorPalette.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ).setHorizontalPadding(context, 0.035),
                            const SizedBox(height: 18),

                            Text(
                              movie.descriptionFull.isNotEmpty
                                  ? movie.descriptionFull
                                  : movie.descriptionIntro,   // fallback
                              style: const TextStyle(
                                fontSize: 16,
                                color: ColorPalette.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ).setHorizontalPadding(context, 0.035),

                            SizedBox(height: 18),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Cast",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: ColorPalette.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ).setHorizontalPadding(context, 0.035),
                            SizedBox(height: 18),
                            Column(
                              children: movie.cast
                                  .map((c) => Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 6),
                                child: CastContainer(
                                  name: c.name,
                                  character: c.characterName,
                                  imagepath: c.smallImage,
                                ),
                              ))
                                  .toList(),
                            ),
                            // CastContainer(
                            //   name: ' Hayley Atwell',
                            //   character: 'Captain Carter',
                            //   imagepath: AppAssets.actor1,
                            // ),
                            // SizedBox(height: 12),
                            // CastContainer(
                            //   name: ' Elizabeth Olsen',
                            //   character: 'Wanda Maximoff /\n The Scarlet Witch',
                            //   imagepath: AppAssets.actor2,
                            // ),
                            // SizedBox(height: 12),
                            // CastContainer(
                            //   name: ' Rachel McAdams',
                            //   character: 'C Dr. Christine Palmer',
                            //   imagepath: AppAssets.actor3,
                            // ),
                            // SizedBox(height: 12),
                            // CastContainer(
                            //   name: ' Charlize Theron',
                            //   character: 'Clea',
                            //   imagepath: AppAssets.actor4,
                            // ),
                            SizedBox(height: 18),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Genres",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: ColorPalette.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ).setHorizontalPadding(context, 0.035),
                            SizedBox(height: 12),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children:
                                  (movie.genres)
                                      .map(
                                        (genre) => ContainerWidget(
                                          text: genre,
                                          fontSize: 16,
                                        ),
                                      )
                                      .toList(),
                            ).setHorizontalPadding(context, 0.02),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return const Scaffold();
        },
      );
    }
  }
