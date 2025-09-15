import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:route_movies_app/core/extensions/extensions.dart';
import 'package:route_movies_app/core/theme/color_palette.dart';
import 'package:route_movies_app/core/widgets/custom_elevated_button.dart';
import '../../../core/routes/pages_route_name.dart';
import '../../../core/widgets/custom_text_field.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

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

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      final doc =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();
      if (doc.exists) {
        final data = doc.data()!;
        _nameController.text = data["name"] ?? "";
        _phoneController.text = data["phone"] ?? "";
        final avatarUrl = data["avatar"];
        if (avatarUrl != null) {
          selectedIndex = avatars.indexOf(avatarUrl);
          if (selectedIndex == -1) selectedIndex = 0;
        }
        setState(() {});
      }
    }
  }

  Future<void> _updateProfile() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      await FirebaseFirestore.instance.collection("users").doc(uid).update({
        "name": _nameController.text.trim(),
        "phone": _phoneController.text.trim(),
        "avatar": avatars[selectedIndex],
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile updated successfully")),
      );
    }
  }

  Future<void> _deleteAccount() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        await FirebaseFirestore.instance.collection("users").doc(uid).delete();
        await FirebaseAuth.instance.currentUser?.delete();
      }
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          PagesRouteName.signIn,
          (route) => false,
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error deleting account: $e")));
    }
  }

  void _showAvatarPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorPalette.bgcolor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: avatars.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          isSelected
                              ? ColorPalette.primaryColor
                              : Colors.transparent,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(avatars[index]),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgcolor,
      appBar: AppBar(
        backgroundColor: ColorPalette.bgcolor,
        foregroundColor: ColorPalette.primaryColor,
        title: Text(
          "Update Profile",
          style: TextStyle(color: ColorPalette.primaryColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          GestureDetector(
            onTap: _showAvatarPicker,
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(avatars[selectedIndex]),
            ),
          ),

          const SizedBox(height: 30),
          CustomTextField(
            controller: _nameController,
            hint: "Name",
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            iconColor: ColorPalette.white,
            hintColor: ColorPalette.white,
            prefixIcon: const Icon(Icons.person),
            fillColor: ColorPalette.Textformfireldbg,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            controller: _phoneController,
            hint: "Phone Number",
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            iconColor: ColorPalette.white,
            hintColor: ColorPalette.white,
            prefixIcon: const Icon(Icons.phone),
            fillColor: ColorPalette.Textformfireldbg,
          ),
          const SizedBox(height: 20),

          const Spacer(),

          // Buttons
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              title: "Delete Account",
              titleSize: 20,
              bgColor: ColorPalette.red,
              onTap: _deleteAccount,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              title: "Update Data",
              titleSize: 20,
              bgColor: ColorPalette.primaryColor,
              onTap: _updateProfile,
            ),
          ),
        ],
      ).setHorizontalAndVerticalPadding(context, 0.05, 0.035),
    );
  }
}
