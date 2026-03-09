import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/color/app_colors.dart';

class DetailTileWidget extends StatelessWidget {
  const DetailTileWidget({
    super.key,
    required this.trailingWidget,
    this.hasDivider = true,
    required this.title,
  });

  final Widget trailingWidget;
  final bool hasDivider;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailingWidget,
            ],
          ),
        ),
        Visibility(
          visible: hasDivider,
          child: Divider(color: AppColors.normalGrey),
        ),
      ],
    );
  }
}
