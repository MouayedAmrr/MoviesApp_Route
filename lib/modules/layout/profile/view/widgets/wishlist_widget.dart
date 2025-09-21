import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/routes/pages_route_name.dart';
import '../../../../../main.dart';
import '../../../../moviedetails/domain/entities/movie_details_entity.dart';
import '../../viewmodel/wishlist_cubit.dart';
import '../../viewmodel/wishlist_states.dart';

class WishlistMoviesWidget extends StatelessWidget {
  const WishlistMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit()..loadWishlist(),
      child: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          switch (state) {
            case WishlistInitial():
            case WishlistLoading():
              return const Center(child: CircularProgressIndicator());

            case WishlistError(:final message):
              return Center(child: Text("Error: $message"));

            case WishlistLoaded(:final movies):
              if (movies.isEmpty) {
                return Center(
                  child: Image.asset("assets/images/search_image_tab.png"),
                );
              }
              return _MoviesGrid(movies: movies);
          }
        },
      ),
    );
  }
}

class _MoviesGrid extends StatelessWidget {
  final List<MovieDetailsEntity> movies;
  const _MoviesGrid({required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.6,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return GestureDetector(
          onTap: () {
            navigatorKey.currentState!.pushNamed(
              PagesRouteName.movieDetails,
              arguments: movie.id.toString(),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Poster
                Image.network(
                  movie.largeCoverImage,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (_, __, ___) => Image.asset(
                        "assets/images/nophoto,jpg",
                        fit: BoxFit.cover,
                      ),
                ),
                // Rating overlay
                Positioned(
                  top: 6,
                  left: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          "${movie.rating}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
