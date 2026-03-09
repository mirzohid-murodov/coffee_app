import 'package:coffee_mobile/src/features/auth/presentation/screen/login_screen.dart';
import 'package:coffee_mobile/src/features/auth/presentation/screen/onboarding_screen.dart';
import 'package:coffee_mobile/src/features/auth/presentation/screen/otp_screen.dart';
import 'package:coffee_mobile/src/features/auth/presentation/screen/signup_screen.dart';
import 'package:coffee_mobile/src/features/auth/presentation/screen/splash_screen.dart';
import 'package:coffee_mobile/src/features/dashboard/cart/presentation/screen/cart_screen.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/presentation/screens/detail_screen.dart';
import 'package:coffee_mobile/src/features/dashboard/home/presentation/screen/home_screen.dart';
import 'package:coffee_mobile/src/features/dashboard/main/screen/main_screen.dart';
import 'package:coffee_mobile/src/features/dashboard/post/presentation/screen/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:coffee_mobile/src/core/router/app_routes.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.main:
        return MaterialPageRoute(builder: (context) => MainScreen());
      case "/splash":
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case "/onboarding":
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      case "/login":
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case "/signup":
        return MaterialPageRoute(builder: (context) => SignupScreen());
      case "/otp":
        return MaterialPageRoute(
          builder: (context) => OtpScreen(email: settings.arguments.toString()),
        );
      case "/resetEmail":
        return MaterialPageRoute(builder: (context) => Container());
      case "/verification":
        return MaterialPageRoute(builder: (context) => Container());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case AppRoutes.detail:
        return MaterialPageRoute(builder: (context) => DetailScreen());
      case AppRoutes.post:
        return MaterialPageRoute(builder: (context) => PostScreen());
      case AppRoutes.cart:
        return MaterialPageRoute(builder: (context) => CartScreen());
      default:
        return MaterialPageRoute(builder: (context) => NoPageRoute());
    }
  }
}

class NoPageRoute extends StatelessWidget {
  const NoPageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.main);
        },
        child: Icon(Icons.home),
      ),
      body: Center(child: Text('404 not found')),
    );
  }
}
