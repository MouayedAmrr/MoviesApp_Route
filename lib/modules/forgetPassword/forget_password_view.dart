import 'package:flutter/material.dart';
import 'package:route_movies_app/core/extensions/extensions.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/color_palette.dart';
import '../../core/widgets/custom_text_field.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.black,
      appBar: AppBar(
        backgroundColor: ColorPalette.black,
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorPalette.primaryColor),
        title: const Text(
          "Forget Password",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: ColorPalette.primaryColor),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.forgetPasswordImg),
          const CustomTextField(
            hint: "Email",
            hintColor: ColorPalette.white,
            fillColor: ColorPalette.Textformfireldbg,
            prefixIcon: ImageIcon(
              AssetImage(AppAssets.mailIcn),
              color: ColorPalette.white,
            ),
          ).setOnlyPadding(context, 0.015, 0.0, 0.0, 0.0),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: ColorPalette.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            child: Text(
              "Verify Email",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorPalette.black,
              ),
            ).setVerticalPadding(context, 0.015),
          ).setVerticalPadding(context, 0.025),
        ],
      ).setHorizontalPadding(context, 0.05),
    );
  }
}
