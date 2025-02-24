import 'package:flutter/material.dart';
import '../../core/constants/app_assets.dart';
import '../../core/theme/color_palette.dart' show ColorPalette;
import '../Explore/explore_tab_view.dart';
import '../Profile/profile_view.dart';
import '../search/search_tab_view.dart';
import 'home_tab_view.dart'; // Import SearchTabView

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int selectedIndex = 0;

  final List<Widget> tabs = [
    HomeTabView(),
    searchTabView(),
    ExploreTabView(),
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
              icon: ImageIcon(AssetImage(AppAssets.homeTabIcon),size: 25,),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.SearchTabIcon),size: 25,),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.exploreTabIcon),size: 25,),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.ProfileTabIcon),size: 25,),
              label: "",
            ),
          ],
        ),
      ),

      body: tabs[selectedIndex], // Show the selected tab
    );
  }
}
