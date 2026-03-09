import 'package:coffee_mobile/src/core/constants/color/app_colors.dart';
import 'package:coffee_mobile/src/features/auth/presentation/screen/login_screen.dart';
import 'package:coffee_mobile/src/features/auth/presentation/screen/signup_screen.dart';
import 'package:coffee_mobile/src/features/dashboard/cart/presentation/screen/cart_screen.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/presentation/screens/detail_screen.dart';
import 'package:coffee_mobile/src/features/dashboard/home/presentation/screen/home_screen.dart';
import 'package:coffee_mobile/src/features/dashboard/post/presentation/screen/post_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController controller = PageController();
  int currentPage = 0;

  void swapPage(int p) {
    if (currentPage != p) {
      controller.animateToPage(
        p,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInCirc,
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            allowImplicitScrolling: true,
            onPageChanged: (page) {
              setState(() {
                currentPage = page;
              });
            },
            scrollDirection: Axis.horizontal,
            children: [HomeScreen(), PostScreen(), CartScreen()],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.fromLTRB(26, 0, 26, 16),
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.qaymoqRang,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      swapPage(0);
                    },
                    icon: Icon(
                      Icons.home_max_outlined,
                      size: 26,
                      color: currentPage == 0 ? Colors.black : Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      swapPage(1);
                    },
                    icon: Icon(
                      Icons.add_box_outlined,
                      size: 26,
                      color: currentPage == 1 ? Colors.black : Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      swapPage(2);
                    },
                    icon: Icon(
                      Icons.shopping_cart_checkout_outlined,
                      size: 26,
                      color: currentPage == 2 ? Colors.black : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// navigationBar sahifalarni tagini to'sib qolmaslik uchun ajratilgan joy
double navbarHeight = 90;
