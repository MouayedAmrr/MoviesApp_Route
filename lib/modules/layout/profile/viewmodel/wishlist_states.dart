import '../../../moviedetails/domain/entities/movie_details_entity.dart';

sealed class WishlistState {
  const WishlistState();
}

class WishlistInitial extends WishlistState {
  const WishlistInitial();
}

class WishlistLoading extends WishlistState {
  const WishlistLoading();
}

class WishlistLoaded extends WishlistState {
  final List<MovieDetailsEntity> movies;
  const WishlistLoaded(this.movies);
}

class WishlistError extends WishlistState {
  final String message;
  const WishlistError(this.message);
}
