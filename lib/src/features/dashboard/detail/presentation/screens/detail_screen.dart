import 'package:coffee_mobile/src/core/constants/color/app_colors.dart';
import 'package:coffee_mobile/src/core/widget/app_button.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/data/model/product_model.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/presentation/cubit/detail_cubit.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/presentation/widget/detail_tile_widget.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/presentation/widget/ristretto_object.dart';
import 'package:coffee_mobile/src/features/dashboard/main/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../widget/detail_app_bar.dart';
import '../widget/order_count_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int coffeeCount = 1;
  bool isSwitch = false;

  void getIndex(int i) {
    setState(() {
      ristIndex = i;
    });
  }

  void addOrder() {
    setState(() {
      coffeeCount++;
    });
  }

  void removeOrder() {
    if (coffeeCount > 0) {
      setState(() {
        coffeeCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(),
      body: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          if (state is DetailLoadingState) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (state is DetailErrorState) {
            return Center(child: Text(state.errorMessage));
          } else if (state is DetailSuccessState) {
            final List<ProductModel> product = state.products;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1510591509098-f4fdc6d0ff04?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress != null) {
                            return Shimmer.fromColors(
                              baseColor: AppColors.grey,
                              highlightColor: AppColors.white,
                              child: Container(
                                color: AppColors.grey,
                                width: double.infinity,
                                height: 150,
                              ),
                            );
                          }
                          return child;
                        },
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  DetailTileWidget(
                    title: product[7].name,
                    trailingWidget: Text(product[7].name),
                  ),
                  DetailTileWidget(
                    title: "Order",
                    trailingWidget: OrderCountWidget(
                      orderCount: coffeeCount,
                      add: () {
                        addOrder();
                      },
                      remove: () {
                        removeOrder();
                      },
                    ),
                  ),
                  DetailTileWidget(
                    title: "Ristretto",
                    trailingWidget: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RistrettoObject(
                            onTap: () {
                              getIndex(1);
                            },
                            onDoubleTap: () {
                              getIndex(0);
                            },
                            title: "One",
                            index: 1,
                          ),
                          const SizedBox(width: 20),
                          RistrettoObject(
                            onTap: () {
                              getIndex(2);
                            },
                            onDoubleTap: () {
                              getIndex(0);
                            },
                            title: "Two",
                            index: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  DetailTileWidget(
                    title: "Onsite/Takeaway",
                    trailingWidget: Container(),
                  ),
                  DetailTileWidget(
                    title: "Volume, ml",
                    trailingWidget: Container(),
                  ),
                  DetailTileWidget(
                    title: "Prepare by a certain time today?",
                    trailingWidget: Switch(
                      trackOutlineColor: WidgetStatePropertyAll(
                        isSwitch ? AppColors.green : AppColors.secondary,
                      ),
                      activeThumbColor: Colors.white,
                      activeTrackColor: AppColors.green,
                      inactiveThumbColor: AppColors.secondary,
                      inactiveTrackColor: Colors.white,
                      value: isSwitch,
                      onChanged: (v) {
                        setState(() {
                          isSwitch = v;
                        });
                      },
                    ),
                    hasDivider: false,
                  ),
                  const SizedBox(height: 20),
                  AppButton(onTap: () {}, label: "Next"),
                  SizedBox(height: navbarHeight),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}

//Ristretto tile ida ishlatiladigan index
int ristIndex = 0;
