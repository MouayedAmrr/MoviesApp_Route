import 'package:flutter/material.dart';
import 'package:route_movies_app/modules/movieDetails/movie_details_view.dart';
import 'package:route_movies_app/core/routes/pages_route_name.dart';
import '../../modules/forgetPassword/forget_password_view.dart';
import '../../modules/layout/layout_view.dart';
import '../../modules/onBoarding/on_boarding_view.dart';
import '../../modules/signIn/sign_in_view.dart';
import '../../modules/signUp/sign_up_view.dart';
import '../../modules/splash/splash_view.dart';

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
        {
          return MaterialPageRoute(
            builder: (context) => const MovieDetailsView(),
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
