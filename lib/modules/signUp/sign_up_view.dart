import 'package:flutter/material.dart';
import 'package:route_movies_app/core/extensions/extensions.dart';
import '../../core/constants/app_assets.dart';
import '../../core/theme/color_palette.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../main.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.black,
      appBar: AppBar(
        backgroundColor: ColorPalette.black,
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorPalette.primaryColor),
        title: const Text(
          "Register",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: ColorPalette.primaryColor,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/images/avatar.png", height: 0.20.height,fit: BoxFit.cover,).setOnlyPadding(context, 0.02, 0, 0, 0),
            Text(
              "Avatar",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ColorPalette.white,
              ),
            ).setCenter().setOnlyPadding(context, 0.02, 0.02, 0, 0),
            CustomTextField(
              controller: _nameController,
              hint: "Name",
              hintColor: ColorPalette.white,
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "plz enter your name";
                }
                return null;
              },
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.identIcn),
                color: ColorPalette.white,
              ),
            ),
            CustomTextField(
              controller: _emailController,
              hint: "Email",
              hintColor: ColorPalette.white,
              // onValidate: (value) {
              //   if (value == null || value.trim().isEmpty) {
              //     return "plz enter your email address";
              //   }
              //   if (!Validations.validateEmail(value)) {
              //     return "plz enter your a valid email address";
              //   }
              //   return null;
              // },
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.mailIcn),
                color: ColorPalette.white,
              ),
            ).setOnlyPadding(context, 0.015, 0.0, 0.0, 0.0),
            CustomTextField(
              controller: _passwordController,
              isPassword: true,
              maxLines: 1,
              hint: "Password",
              hintColor: ColorPalette.white,
              // onValidate: (value) {
              //   if (value == null || value.trim().isEmpty) {
              //     return "plz enter your password";
              //   }
              //   if (!Validations.validatePassword(value)) {
              //     return "plz enter your a valid password";
              //   }
              //   return null;
              // },
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.passwordIcn),
                color: ColorPalette.white,
              ),
            ).setOnlyPadding(context, 0.015, 0.0, 0.0, 0.0),
            CustomTextField(
              isPassword: true,
              maxLines: 1,
              hint: "Re-Password",
              hintColor: ColorPalette.white,
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "plz enter your password";
                }
                if (value != _passwordController.text) {
                  return "re-password not match.";
                }
                return null;
              },
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.passwordIcn),
                color: ColorPalette.white,
              ),
            ).setOnlyPadding(context, 0.015, 0.0, 0.0, 0.0),
            CustomTextField(
              controller: _phoneController,
              hint: "Phone Number",
              hintColor: ColorPalette.white,
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.phoneIcn),
                color: ColorPalette.white,
              ),
            ).setOnlyPadding(context, 0.015, 0.0, 0.0, 0.0),
            ElevatedButton(
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   FirebaseAuthService.createAccount(
                //     emailAddress: _emailController.text,
                //     password: _passwordController.text,
                //   ).then(
                //         (value) {
                //       EasyLoading.dismiss();
                //       if (value) {
                //         navigatorKey.currentState!.pushNamedAndRemoveUntil(
                //           PagesRouteName.signIn,
                //               (route) => false,
                //         );
                //       }
                //     },
                //   );
                // }
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: ColorPalette.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              child: Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.black,
                ),
              ).setVerticalPadding(context, 0.015),
            ).setVerticalPadding(context, 0.025),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: "Already Have Account ? ",
                    style: TextStyle(fontSize: 16, color: ColorPalette.white),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        navigatorKey.currentState!.pop();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorPalette.primaryColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorPalette.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).setCenter().setHorizontalPadding(context, 0.05),
      ),
    );
  }
}
