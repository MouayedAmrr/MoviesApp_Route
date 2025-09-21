import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:route_movies_app/core/theme/color_palette.dart';

class SnackBarService {
  static void showSuccessMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (cancelFunc) {
        return Container(
          constraints: const BoxConstraints(maxWidth: 380),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: ColorPalette.secondaryColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50,
                width: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF46c234),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              const SizedBox(width: 10),
              Lottie.asset(
                "assets/icons/face_success_icon.json",
                repeat: false,
                width: 80,
                height: 80,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Success",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      msg,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: cancelFunc,
                icon: const Icon(Icons.close, color: Colors.white70, size: 20),
              ),
            ],
          ),
        );
      },
      duration: const Duration(seconds: 3),
      dismissDirections: [DismissDirection.endToStart],
    );
  }

  static void showErrorMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (cancelFunc) {
        return Container(
          constraints: const BoxConstraints(maxWidth: 380),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: ColorPalette.secondaryColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50,
                width: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFFd12e2e),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              const SizedBox(width: 10),
              Lottie.asset(
                "assets/icons/face_wrong_icon.json",
                repeat: false,
                width: 60,
                height: 60,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Error",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      msg,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: cancelFunc,
                icon: const Icon(Icons.close, color: Colors.white54, size: 20),
              ),
            ],
          ),
        );
      },
      duration: const Duration(seconds: 5),
      dismissDirections: [DismissDirection.endToStart],
    );
  }
}
