import 'package:coffee_mobile/src/features/auth/presentation/widget/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:coffee_mobile/src/core/router/app_routes.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
final String imgURL = 'https://images.unsplash.com/photo-1652006836828-64039c0b3f82?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

@override
  void initState() {
    super.initState();
    Future.microtask(() {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushNamed(context, AppRoutes.onboarding);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            imgURL,
            height: MediaQuery.sizeOf(context).height,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            right: 0,
            top: -60,
            child: LogoWidget()
            ),
        ],
      ),
    );
  }
}

