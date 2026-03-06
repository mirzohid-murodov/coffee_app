import 'package:coffee_mobile/src/core/constants/color/app_colors.dart';
import 'package:flutter/material.dart';

class SnackbarService {
  static void show(BuildContext context, String message, {Color color = Colors.green, IconData icon = Icons.check_circle}) {
    OverlayState? overlayState = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlayState.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

  static void success(BuildContext context, String message) => show(context, message, color: AppColors.primary, icon: Icons.check_circle);
  static void error(BuildContext context, String message) => show(context, message, color: Colors.redAccent, icon: Icons.error);
  static void warning(BuildContext context, String message) => show(context, message, color: Colors.orange, icon: Icons.warning);
  static void add(BuildContext context, String message) => show(context, message, color: Colors.blueAccent, icon: Icons.add_comment_rounded);
}