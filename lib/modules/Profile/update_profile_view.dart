import 'package:flutter/material.dart';
import 'package:route_movies_app/core/extensions/extensions.dart';
import 'package:route_movies_app/core/theme/color_palette.dart';
import 'package:route_movies_app/core/widgets/custom_elevated_button.dart';

import '../../core/widgets/custom_text_field.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgcolor,
      appBar: AppBar(
        backgroundColor: ColorPalette.bgcolor,
        foregroundColor: ColorPalette.primaryColor,
        title: Text(
          "Pick Avatar",
          style: TextStyle(color: ColorPalette.primaryColor),
        ),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              "assets/images/profileImage.png",
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 50),
          CustomTextField(
            hint: "Double Mo",
            //isReadOnly: true,
            textStyle: TextStyle(fontWeight: FontWeight.w600),
            iconColor: ColorPalette.white,
            hintColor: ColorPalette.white,
            prefixIcon: Icon(Icons.person),
            fillColor: ColorPalette.Textformfireldbg,
          ),
          SizedBox(height: 30),
          CustomTextField(
            hint: "0104435235",
           // isReadOnly: true,
            textStyle: TextStyle(fontWeight: FontWeight.w600),
            iconColor: ColorPalette.white,
            hintColor: ColorPalette.white,
            prefixIcon: Icon(Icons.phone),
            fillColor: ColorPalette.Textformfireldbg,
          ),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              child: Text(
                "Reset Password",
                style: TextStyle(color: ColorPalette.white, fontSize: 20),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              title: "Delete Account",
              titleSize: 20,
              bgColor: ColorPalette.red,
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              title: "Update Data",
              titleSize: 20,
              bgColor: ColorPalette.primaryColor,
            ),
          ),
        ],
      ).setHorizontalAndVerticalPadding(context, 0.05, 0.035),
    );
  }
}
