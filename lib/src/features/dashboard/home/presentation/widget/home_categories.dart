import 'package:coffee_mobile/src/features/dashboard/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_category_card.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: context.read<HomeCubit>().getCategories().length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 160,
          mainAxisSpacing: 16,
          crossAxisSpacing: 15,
          childAspectRatio: 1
      ),
      itemBuilder: (context, index) {
        return HomeCategoryCard(index: index);
      },
    );
  }
}