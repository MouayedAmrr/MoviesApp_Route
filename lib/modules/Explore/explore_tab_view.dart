import 'package:flutter/material.dart';
import 'package:route_movies_app/core/theme/color_palette.dart';
import 'package:route_movies_app/modules/Explore/Widgets/movie_card.dart';

class ExploreTabView extends StatefulWidget {
  const ExploreTabView({super.key});

  @override
  State<ExploreTabView> createState() => _ExploreTabViewState();
}

class _ExploreTabViewState extends State<ExploreTabView> {
  final List<String> categories = [
    "Action", "Adventure", "Animation", "Biography", "Cartoon", "Arabic"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor: ColorPalette.bgcolor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: ColorPalette.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: ColorPalette.primaryColor,
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                  tabs: categories.map((category) {
                    return Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: ColorPalette.primaryColor, width: 2),
                        ),
                        child: Text(
                          category,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            Expanded(
              child: TabBarView(
                children: categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MovieCard(),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
