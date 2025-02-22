import 'package:flutter/material.dart';
import 'package:route_movies_app/core/extensions/extensions.dart';

import '../../core/constants/app_assets.dart';
import '../../core/routes/pages_route_name.dart';
import '../../core/theme/color_palette.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../main.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.black,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.moviesAppLogo, height: 0.30.height),
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
            ).setOnlyPadding(context, 0.01, 0.03, 0.0, 0.0),
            CustomTextField(
              controller: _passwordController,
              isPassword: true,
              maxLines: 1,
              hint: "Password",
              hintColor: ColorPalette.white,
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "plz enter your email address";
                }
                return null;
              },
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.passwordIcn),
                color: ColorPalette.white,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  navigatorKey.currentState!.pushNamed(
                    PagesRouteName.forgetPassword,
                  );
                },
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                    color: ColorPalette.primaryColor,
                    fontWeight: FontWeight.w400,
                    decorationColor: ColorPalette.primaryColor,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   FirebaseAuthService.login(
                //       emailAddress: _emailController.text,
                //       password: _passwordController.text)
                //       .then(
                //         (value) {
                //       EasyLoading.dismiss();
                //       if (value) {
                //         navigatorKey.currentState!.pushNamedAndRemoveUntil(
                //           PagesRouteName.layout,
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
                "Login",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: ColorPalette.black,
                ),
              ).setVerticalPadding(context, 0.015),
            ).setVerticalPadding(context, 0.025),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: "Don’t Have Account ? ",
                    style: TextStyle(
                      color: ColorPalette.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        navigatorKey.currentState!.pushNamed(
                          PagesRouteName.signUp,
                        );
                      },
                      child: Text(
                        "Create One",
                        style: TextStyle(
                          color: ColorPalette.primaryColor,
                          fontWeight: FontWeight.w900,
                          decorationColor: ColorPalette.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: ColorPalette.primaryColor,
                    indent: 40,
                    endIndent: 20,
                  ),
                ),
                Text(
                  "OR",
                  style: TextStyle(
                    color: ColorPalette.primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: ColorPalette.primaryColor,
                    indent: 20,
                    endIndent: 40,
                  ),
                ),
              ],
            ).setVerticalPadding(context, 0.02),
            SizedBox(height: 2,),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: ColorPalette.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  side: const BorderSide(color: ColorPalette.primaryColor),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.googleIcn, height: 0.03.height),
                  const SizedBox(width: 10),
                  Text(
                    "Login With Google",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ColorPalette.black,
                    ),
                  ).setVerticalPadding(context, 0.015),
                ],
              ),
            ).setVerticalPadding(context, 0.025),
          ],
        ).setCenter().setHorizontalPadding(context, 0.05),
      ),
    );
  }
}
