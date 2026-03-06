import 'package:coffee_mobile/src/core/constants/color/app_colors.dart';
import 'package:coffee_mobile/src/core/widget/app_button.dart';
import 'package:coffee_mobile/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:coffee_mobile/src/features/auth/presentation/widget/custom_text_field.dart';
import 'package:coffee_mobile/src/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/utils/snackbar/snackbar_service.dart';
import '../widget/auth_swap_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthErrorState) {
              SnackbarService.error(
                context,
                state.errorMessage!.contains("connection error")
                    ? "Connection error"
                    : "Something went wrong",
              );
            } else if (state is AuthSuccessState) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (_) => false,
              );
              SnackbarService.success(context, "Logged");
            }
          },
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 46, bottom: 24),
                        child: Text(
                          "Log In",
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        "Welcome back",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppColors.textGrey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 46, bottom: 46),
                        child: Form(
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: usernameController,
                                hintText: 'Username',
                                iconName: Assets.icons.person,
                              ),
                              const SizedBox(height: 36),
                              CustomTextField(
                                controller: passwordController,
                                hintText: 'Password',
                                iconName: Assets.icons.password,
                              ),
                            ],
                          ),
                        ),
                      ),
                      AuthSwapWidget(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.signup);
                        },
                        title: "Sign up",
                        subtitle: "Don't have an account ? ",
                      ),
                      AppButton(
                        onTap: () {
                          context.read<AuthCubit>().login(
                            username: usernameController.text,
                            password: passwordController.text,
                          );
                        },
                        label: state is AuthLoadingState ? 'Logging' : 'Log in',
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
