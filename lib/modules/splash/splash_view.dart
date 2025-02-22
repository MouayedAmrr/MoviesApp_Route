import 'dart:async';

import 'package:flutter/material.dart';
import 'package:route_movies_app/core/constants/app_assets.dart';

import '../../core/routes/pages_route_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
          () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          PagesRouteName.onBoarding,
              (route) => false,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          height: 250,
          width: 250,
          child: Image.asset(AppAssets.moviesAppLogo),
        ),
      ),
    );
  }
}
