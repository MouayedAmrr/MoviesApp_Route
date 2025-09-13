import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:route_movies_app/core/extensions/extensions.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/extensions/validations.dart';
import '../../../core/routes/pages_route_name.dart';
import '../../../core/theme/color_palette.dart';
import '../../../core/widgets/custom_text_field.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final _forgetPassController = TextEditingController();

  @override
  void dispose() {
    _forgetPassController.dispose();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.forgetPasswordImg),
            CustomTextField(
              hint: "Email",
              controller: _forgetPassController,
              hintColor: ColorPalette.generalGreyColor,
              fillColor: ColorPalette.Textformfireldbg,
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "please enter your email address";
                }
                if (!Validations.validateEmail(value)) {
                  return "please enter a valid email address";
                }
                return null;
              },
              prefixIcon: const ImageIcon(
                AssetImage(AppAssets.mailIcn),
                color: ColorPalette.white,
              ),
            ).setOnlyPadding(context, 0.015, 0.0, 0.0, 0.0),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(
                  email: _forgetPassController.text.trim(),
                )
                    .then((_) {
                  Navigator.pushNamed(context, PagesRouteName.signIn);
                });
              },
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
      ),
    );
  }
}
