import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/color/app_colors.dart';
import '../screens/detail_screen.dart';

class RistrettoObject extends StatelessWidget {
  const RistrettoObject({
    super.key,
    required this.onTap,
    required this.onDoubleTap,
    required this.title,
    required this.index,
  });
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: ristIndex == index
                ? AppColors.primary
                : AppColors.normalGrey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
