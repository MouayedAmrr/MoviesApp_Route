import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_movies_app/core/config/di.dart';
import 'package:route_movies_app/modules/layout/presentation/viewModel/home_cubit.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/color_palette.dart' show ColorPalette;
import '../../../Explore/view/explore_tab_view.dart';
import '../../../Explore/viewmodel/explore_cubit.dart';
import '../../../Profile/profile_view.dart';
import '../../../search/view/search_tab_view.dart';
import '../../../search/viewmodel/search_cubit.dart';
import '../../domain/usecase/get_movies_list_usecase.dart';
import '../../domain/usecase/search_movie_usecase.dart';
import 'home_tab_view.dart'; // Import SearchTabView

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int selectedIndex = 0;

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
      create: (context) =>
      ExploreCubit(getIt<GetMoviesListUseCase>())..loadMoviesByGenre("Action"),
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
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
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

      body: tabs[selectedIndex], // Show the selected tab
    );
  }
}
