import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/theme/color_palette.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../viewmodel/search_cubit.dart';
import '../viewmodel/search_states.dart';

class SearchTabView extends StatelessWidget {
  const SearchTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: ColorPalette.bgcolor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                controller: controller,
                hint: "Search",
                prefixIcon: ImageIcon(AssetImage(AppAssets.SearchTabIcon)),
                fillColor: ColorPalette.Textformfireldbg,
                iconColor: ColorPalette.white,
                borderColor: ColorPalette.Textformfireldbg,
                textStyle: const TextStyle(color: ColorPalette.white),
                onChanged: (value) {
                  context.read<SearchCubit>().search(value!);
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return Center(
                      child: Image.asset("assets/images/search_image_tab.png"),
                    );
                  } else if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchSuccess) {
                    if (state.movies.isEmpty) {
                      return const Center(
                        child: Text(
                          "No results found",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    return GridView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      itemCount: state.movies.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.64,
                          ),
                      itemBuilder: (BuildContext context, int index) {
                        final movie = state.movies[index];
                        return GestureDetector(
                          onTap: () {
                            // navigatorKey.currentState!.pushNamed(
                            //   PagesRouteName.movieDetails,
                            //   arguments: movie,
                            // );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Stack(
                                children: [
                                  Image.network(
                                    movie.mediumCoverImage ?? "",
                                    width: 280,
                                    height: 320,
                                    fit: BoxFit.fill,
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Container(
                                      width: 58,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        color: ColorPalette.black.withOpacity(
                                          0.7,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "  ${movie.rating}",
                                            style: TextStyle(
                                              color: ColorPalette.white,
                                            ),
                                          ),
                                          const SizedBox(width: 7),
                                          Image.asset(AppAssets.startImageRate),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is SearchFailure) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
