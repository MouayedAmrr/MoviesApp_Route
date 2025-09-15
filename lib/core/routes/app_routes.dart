import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_movies_app/modules/Profile/update_profile_view.dart';
import 'package:route_movies_app/core/routes/pages_route_name.dart';
import 'package:route_movies_app/module/moviedetails/domain/use_cases/movies_details_usecase.dart';
import '../../modules/auth/forgetPassword/forget_password_view.dart';
import '../../modules/auth/signIn/sign_in_view.dart';
import '../../modules/auth/signUp/sign_up_view.dart';
import '../../modules/layout/presentation/view/layout_view.dart';
import '../../modules/moviedetails/presentation/viewmodel/movie_details_cubit.dart';
import '../../modules/moviedetails/presentation/viewmodel/relates_movies_cubit.dart';
import '../../modules/moviedetails/presentation/views/movie_details_view.dart';
import '../../modules/onBoarding/on_boarding_view.dart';
import '../../modules/signIn/sign_in_view.dart';
import '../../modules/signUp/sign_up_view.dart';
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
          return MaterialPageRoute(
            builder: (context) => const LayoutView(),
            settings: settings,
          );
        }


      case PagesRouteName.movieDetails:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => getIt<MovieDetailsCubit>(),
              ),
              BlocProvider(
                create: (_) => getIt<RelatedMoviesCubit>(),
              ),
            ],
            child: MovieDetailsView(movieId: settings.arguments as String),
          ),
          settings: settings,
        );


      case PagesRouteName.UpdateProfile:
        {
          final movieId = settings.arguments as String;
          return MaterialPageRoute(builder: (context) => UpdateProfileView(),
            settings: settings
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
