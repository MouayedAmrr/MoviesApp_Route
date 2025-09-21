import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_movies_app/core/routes/pages_route_name.dart';
import '../../modules/auth/forgetPassword/forget_password_view.dart';
import '../../modules/auth/signIn/sign_in_view.dart';
import '../../modules/auth/signUp/sign_up_view.dart';
import '../../modules/layout/Profile/view/update_profile_view.dart';
import '../../modules/layout/Profile/viewmodel/wishlist_cubit.dart';
import '../../modules/layout/layout_view.dart';
import '../../modules/layout/profile/viewmodel/history_cubit.dart';
import '../../modules/moviedetails/presentation/viewmodel/movie_details_cubit.dart';
import '../../modules/moviedetails/presentation/viewmodel/relates_movies_cubit.dart';
import '../../modules/moviedetails/presentation/views/movie_details_view.dart';
import '../../modules/onBoarding/on_boarding_view.dart';
import '../../modules/splash/splash_view.dart';
import '../config/di.dart';

abstract class AppRoutes {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.initial:
        {
          return MaterialPageRoute(
            builder: (context) => const SplashView(),
            settings: settings,
          );
        }

      case PagesRouteName.onBoarding:
        {
          return MaterialPageRoute(
            builder: (context) => const OnBoardingView(),
            settings: settings,
          );
        }

      case PagesRouteName.signIn:
        {
          return MaterialPageRoute(
            builder: (context) => const SignInView(),
            settings: settings,
          );
        }

      case PagesRouteName.signUp:
        {
          return MaterialPageRoute(
            builder: (context) => const SignUpView(),
            settings: settings,
          );
        }

      case PagesRouteName.forgetPassword:
        {
          return MaterialPageRoute(
            builder: (context) => const ForgetPasswordView(),
            settings: settings,
          );
        }

      case PagesRouteName.layout:
        {
          final initialIndex = settings.arguments as int? ?? 0;
          return MaterialPageRoute(
            builder: (context) => LayoutView(initialIndex: initialIndex),
            settings: settings,
          );
        }

      case PagesRouteName.movieDetails:
        return MaterialPageRoute(
          builder:
              (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => getIt<MovieDetailsCubit>()),
                  BlocProvider(create: (_) => getIt<RelatedMoviesCubit>()),
                  BlocProvider(create: (_) => WishlistCubit()..loadWishlist()),
                  BlocProvider(create: (_) => HistoryCubit()..loadHistory()),
                ],
                child: MovieDetailsView(movieId: settings.arguments as String),
              ),
          settings: settings,
        );

      case PagesRouteName.UpdateProfile:
        {
          return MaterialPageRoute(
            builder: (context) => UpdateProfileView(),
            settings: settings,
          );
        }

      default:
        {
          return MaterialPageRoute(
            builder: (context) => const SplashView(),
            settings: settings,
          );
        }
    }
  }
}
