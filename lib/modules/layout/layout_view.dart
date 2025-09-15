import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_movies_app/core/config/di.dart';
import 'package:route_movies_app/modules/layout/search/view/search_tab_view.dart';
import 'package:route_movies_app/modules/layout/search/viewmodel/search_cubit.dart';
import '../../core/constants/app_assets.dart';
import '../../core/theme/color_palette.dart' show ColorPalette;
import 'Explore/view/explore_tab_view.dart';
import 'Explore/viewmodel/explore_cubit.dart';
import 'Profile/profile_view.dart';
import 'domain/usecase/get_movies_list_usecase.dart';
import 'domain/usecase/search_movie_usecase.dart';
import 'home/view/home_tab_view.dart';
import 'home/viewModel/home_cubit.dart';

class LayoutView extends StatefulWidget {
  final int initialIndex;
  const LayoutView({super.key, this.initialIndex = 0});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  final List<Widget> tabs = [
    BlocProvider(
      create:
          (context) =>
              HomeCubit(getIt<GetMoviesListUseCase>())
                ..getTopMovies()
                ..getMoviesByGenre('Drama'),
      child: HomeTabView(),
    ),
    BlocProvider(
      create: (context) => SearchCubit(getIt<SearchMoviesUseCase>()),
      child: const SearchTabView(),
    ),
    BlocProvider(
      create:
          (context) =>
              ExploreCubit(getIt<GetMoviesListUseCase>())
                ..loadMoviesByGenre("Action"),
      child: ExploreTabView(),
    ),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.black,

      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorPalette.Textformfireldbg,
          selectedItemColor: ColorPalette.primaryColor,
          unselectedItemColor: ColorPalette.white,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageIcon(AssetImage(AppAssets.homeTabIcon), size: 25),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageIcon(AssetImage(AppAssets.SearchTabIcon), size: 25),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageIcon(
                  AssetImage(AppAssets.exploreTabIcon),
                  size: 25,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageIcon(
                  AssetImage(AppAssets.ProfileTabIcon),
                  size: 25,
                ),
              ),
              label: "",
            ),
          ],
        ),
      ),

      body: tabs[_selectedIndex], // Show the selected tab
    );
  }
}
