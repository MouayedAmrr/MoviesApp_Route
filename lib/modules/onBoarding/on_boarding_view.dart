import 'package:flutter/material.dart';
import 'package:route_movies_app/core/constants/app_assets.dart';
import '../../core/routes/pages_route_name.dart';
import '../../core/theme/color_palette.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List backgroundImg = [
    AppAssets.onboardFirstImg,
    AppAssets.onboardSecondImg,
    AppAssets.onboardThirdImg,
    AppAssets.onboardFourthImg,
    AppAssets.onboardFifthImg,
    AppAssets.onboardLastImg,
  ];
  List<String> title = [
    "Find Your Next Favorite Movie Here",
    "Discover Movies",
    "Explore All Genres",
    "Create Watchlists",
    "Rate,Review and Learn",
    "Start Watching Now",
  ];
  List desc = [
    "Get access to a huge library of movies to suit all tastes. You will surely like it.",
    "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
    "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
    "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: backgroundImg.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, i) {
          return Stack(
            children: [
              Image.asset(backgroundImg[i], fit: BoxFit.fill),
              i != 0
                  ? Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 34,
                  ),
                  decoration: const BoxDecoration(
                    color: ColorPalette.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          title[i],
                          style: TextStyle(
                            color: ColorPalette.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter",
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Center(
                        child: Text(
                          desc[i],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorPalette.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Inter",
                          ),
                        ),
                      ),
                      if (i != title.length - 1) SizedBox(height: 15),
                      (_currentIndex == title.length - 1)
                          ? ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            PagesRouteName.signIn,
                                (route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: ColorPalette.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Finish",
                            style: TextStyle(
                              color: ColorPalette.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                            ),
                          ),
                        ),
                      )
                          : ElevatedButton(
                        onPressed: () {
                          if (_currentIndex < title.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(
                                milliseconds: 200,
                              ),
                              curve: Curves.easeInOut,
                            );
                            setState(() {
                              _currentIndex++;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: ColorPalette.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: ColorPalette.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      if (i > 1)
                        ElevatedButton(
                          onPressed: () {
                            if (_currentIndex > 0) {
                              _pageController.previousPage(
                                duration: const Duration(
                                  milliseconds: 200,
                                ),
                                curve: Curves.easeInOut,
                              );
                              setState(() {
                                _currentIndex--;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: ColorPalette.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            side: const BorderSide(
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Back",
                              style: TextStyle(
                                color: ColorPalette.primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              )
                  : Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          title[i],
                          style: TextStyle(
                            color: ColorPalette.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter",
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: Text(
                          desc[i],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorPalette.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Inter",
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ElevatedButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            setState(() {
                              _currentIndex++;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: ColorPalette.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Explore Now",
                              style: TextStyle(
                                color: ColorPalette.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
