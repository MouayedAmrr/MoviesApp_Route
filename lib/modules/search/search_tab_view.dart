import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/color_palette.dart';
import '../../core/widgets/custom_text_field.dart' show CustomTextField;

class searchTabView extends StatelessWidget {
  const searchTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgcolor,

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                hint: "Search",
                prefixIcon: ImageIcon(AssetImage(AppAssets.SearchTabIcon)),
                fillColor: ColorPalette.Textformfireldbg,
                iconColor: ColorPalette.white,
                borderColor: ColorPalette.Textformfireldbg,
                textStyle: TextStyle(
                  color: ColorPalette.white
                ),


              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset("assets/images/search_image_tab.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
