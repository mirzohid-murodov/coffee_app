import 'package:coffee_mobile/src/core/constants/color/app_colors.dart';
import 'package:coffee_mobile/src/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubit/home_cubit.dart';

class HomeCategoryCard extends StatelessWidget {
  const HomeCategoryCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.detail);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.normalGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(50),
                child: Image.network(
                  context.read<HomeCubit>().getCategories()[index]["imgUrl"],
                  fit: BoxFit.cover,
                  height: 85,
                  width: 85,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                context.read<HomeCubit>().getCategories()[index]["name"],
                style: GoogleFonts.poppins(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
