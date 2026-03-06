import 'package:coffee_mobile/src/core/constants/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/icons/logo.svg'),
        Positioned(
          bottom: 270,
          right: 0,
          left: 0,
          child: Text(
            "Magic Coffee",
            textAlign: TextAlign.center,
            style: GoogleFonts.reenieBeanie(
              color: AppColors.white,
              fontSize: 64,
              fontWeight: FontWeight.w400
            )
          ),
        )
      ],
    );
  }
}
