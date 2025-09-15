import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:route_movies_app/core/extensions/extensions.dart';
import 'package:route_movies_app/core/routes/pages_route_name.dart';
import 'package:route_movies_app/core/theme/color_palette.dart';
import 'package:route_movies_app/main.dart';
import '../../../core/widgets/custom_elevated_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final uid = FirebaseAuth.instance.currentUser!.uid;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorPalette.bgcolor,
        body: StreamBuilder<DocumentSnapshot>(
          stream:
              FirebaseFirestore.instance
                  .collection("users")
                  .doc(uid)
                  .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            var userData = snapshot.data!;
            String userName = userData["name"] ?? "Unknown";
            String? photoUrl = userData["avatar"];

            return Column(
              children: [
                Container(
                  width: size.width,
                  height: 480,
                  color: ColorPalette.Textformfireldbg,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(75),
                                child:
                                    photoUrl != null && photoUrl.isNotEmpty
                                        ? (photoUrl.startsWith("http")
                                            ? Image.network(
                                              photoUrl,
                                              width: 150,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            )
                                            : Image.asset(
                                              photoUrl,
                                              width: 150,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ))
                                        : Image.asset(
                                          "assets/images/profileImage.png",
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                userName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ).setHorizontalAndVerticalPadding(
                            context,
                            0.06,
                            0.07,
                          ),

                          // wish list column
                          Column(
                            children: [
                              const Text(
                                "12",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Wish List",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ).setOnlyPadding(context, 0.035, 0.02, 0.05, 0.02),

                          // history column
                          Column(
                            children: [
                              const Text(
                                "10",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "History",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ).setOnlyPadding(context, 0.035, 0.02, 0.02, 0.02),
                        ],
                      ),

                      // buttons row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              width: 250,
                              height: 55,
                              child: CustomElevatedButton(
                                title: 'Edit profile',
                                titleSize: 20,
                                bgColor: ColorPalette.primaryColor,
                                titleColor: ColorPalette.black,
                                borderRadius: 15,
                                onTap: () {
                                  navigatorKey.currentState!.pushNamed(
                                    PagesRouteName.UpdateProfile,
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 150,
                              height: 55,
                              child: CustomElevatedButton(
                                onTap: () {
                                  FirebaseAuth.instance.signOut();
                                  Navigator.pushReplacementNamed(
                                    context,
                                    PagesRouteName.signIn,
                                  );
                                },
                                title: 'Exit',
                                titleSize: 18,
                                titleColor: ColorPalette.white,
                                bgColor: ColorPalette.red,
                                suffixIcon: Icons.exit_to_app,
                                borderRadius: 15,
                              ),
                            ),
                          ),
                        ],
                      ).setHorizontalPadding(context, 0.035),

                      // tabs
                      TabBar(
                        indicatorColor: Colors.transparent,
                        labelColor: ColorPalette.primaryColor,
                        labelStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            width: 4.0,
                            color: ColorPalette.primaryColor,
                          ),
                        ),
                        tabs: const [
                          Tab(
                            icon: Icon(
                              Icons.list,
                              color: ColorPalette.primaryColor,
                              size: 40,
                            ),
                            child: Text(
                              "Watch List",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Tab(
                            icon: Icon(
                              Icons.folder,
                              color: ColorPalette.primaryColor,
                              size: 40,
                            ),
                            child: Text(
                              "History",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // tab views
                Expanded(
                  child: TabBarView(
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/search_image_tab.png",
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          "assets/images/search_image_tab.png",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
