import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/color/app_colors.dart';

class AuthSwapWidget extends StatelessWidget {
  const AuthSwapWidget({
    super.key, required this.onTap, required this.title, required this.subtitle,
  });

  final VoidCallback onTap;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            subtitle,
            style: GoogleFonts.poppins(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
