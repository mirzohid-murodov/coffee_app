import 'package:coffee_mobile/src/core/constants/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 98, bottom: 25),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primary
            ),
            child: Center(
              child: Stack(
                children: [
                  SvgPicture.asset('assets/icons/logo.svg')
                ]
              ),
            )
          ),
          Text(
            'Feel yourself like a barista!',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: AppColors.black,
              fontSize: 28,
              fontWeight: FontWeight.w400
            )
          ),
          Text(
            'Magic coffee on order.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: AppColors.secondary,
              fontSize: 18,
              fontWeight: FontWeight.w400
            )
          )
        ]
      )
    );
  }
}