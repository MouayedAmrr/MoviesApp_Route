import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:route_movies_app/core/extensions/extensions.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/extensions/validations.dart';
import '../../../core/routes/pages_route_name.dart';
import '../../../core/services/firebase_auth_serivce.dart';
import '../../../core/theme/color_palette.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../main.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final List<String> avatars = [
    "assets/avatars/avatar_1.png",
    "assets/avatars/avatar_2.png",
    "assets/avatars/avatar_3.png",
    "assets/avatars/avatar_4.png",
    "assets/avatars/avatar_5.png",
    "assets/avatars/avatar_6.png",
    "assets/avatars/avatar_7.png",
    "assets/avatars/avatar_8.png",
    "assets/avatars/avatar_9.png",
  ];

  late final PageController _pageController;
  int selectedIndex = 3;
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: selectedIndex,
      viewportFraction: 0.6,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
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
          "Register",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: ColorPalette.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: avatars.length,
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final scale =
                        selectedIndex == index ? 1.0 : 0.7; // center bigger
                    return TweenAnimationBuilder(
                      tween: Tween<double>(begin: scale, end: scale),
                      duration: const Duration(milliseconds: 300),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: Image.asset(avatars[index], fit: BoxFit.fill),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: const Text(
                  "Avatar",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: _nameController,
                hint: "Name",
                hintColor: ColorPalette.generalGreyColor,
                fillColor: ColorPalette.Textformfireldbg,
                onValidate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "please enter your name";
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
                hintColor: ColorPalette.generalGreyColor,
                fillColor: ColorPalette.Textformfireldbg,
                onValidate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "please enter your password";
                  }
                  if (!Validations.validatePassword(value)) {
                    return "please enter a valid password";
                  }
                  return null;
                },
                prefixIcon: ImageIcon(
                  AssetImage(AppAssets.passwordIcn),
                  color: ColorPalette.white,
                ),
              ).setOnlyPadding(context, 0.015, 0.0, 0.0, 0.0),

              CustomTextField(
                isPassword: true,
                maxLines: 1,
                hint: "Re-Password",
                hintColor: ColorPalette.generalGreyColor,
                fillColor: ColorPalette.Textformfireldbg,
                onValidate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "please enter your password again";
                  }
                  if (value != _passwordController.text) {
                    return "re-password doesn't match.";
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
                fillColor: ColorPalette.Textformfireldbg,
                hintColor: ColorPalette.generalGreyColor,
                onValidate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "please enter your phone number";
                  }
                  if (value.length < 11) {
                    return "please enter a valid phone number";
                  }
                  return null;
                },
                prefixIcon: ImageIcon(
                  AssetImage(AppAssets.phoneIcn),
                  color: ColorPalette.white,
                ),
              ).setOnlyPadding(context, 0.015, 0.0, 0.0, 0.0),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FirebaseAuthService.createAccount(
                      emailAddress: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                      name: _nameController.text.trim(),
                      phone: _phoneController.text.trim(),
                      avatarUrl: avatars[selectedIndex],
                    ).then((value) {
                      EasyLoading.dismiss();
                      if (value) {
                        navigatorKey.currentState!.pushNamedAndRemoveUntil(
                          PagesRouteName.signIn,
                          (route) => false,
                        );
                      }
                    });
                  }
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
      ),
    );
  }
}
