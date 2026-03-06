import 'package:coffee_mobile/src/core/constants/color/app_colors.dart';
import 'package:coffee_mobile/src/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.iconName,
    this.validator,
  });

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hintText;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(iconName),
                  const SizedBox(width: 20),
                  Container(height: 20, width: 1.5, color: AppColors.textGrey),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  validator: validator,
                  controller: controller,
                  cursorColor: AppColors.textGrey,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: GoogleFonts.poppins(
                      color: AppColors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(color: AppColors.textGrey),
      ],
    );
  }
}
