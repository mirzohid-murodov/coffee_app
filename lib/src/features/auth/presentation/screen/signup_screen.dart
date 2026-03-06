import 'package:coffee_mobile/src/core/constants/color/app_colors.dart';
import 'package:coffee_mobile/src/core/router/app_routes.dart';
import 'package:coffee_mobile/src/core/utils/snackbar/snackbar_service.dart';
import 'package:coffee_mobile/src/core/widget/app_button.dart';
import 'package:coffee_mobile/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:coffee_mobile/src/features/auth/presentation/widget/auth_swap_widget.dart';
import 'package:coffee_mobile/src/features/auth/presentation/widget/custom_text_field.dart';
import 'package:coffee_mobile/src/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Navigator.pushNamed(
              context,
              AppRoutes.otp,
              arguments: emailController.text,
            );
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
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      "Welcome to Our Community",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColors.textGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 46, bottom: 27),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "Enter username";
                                }
                                return null;
                              },
                              controller: usernameController,
                              hintText: 'Username',
                              iconName: Assets.icons.person,
                            ),
                            const SizedBox(height: 36),
                            CustomTextField(
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "Enter email";
                                } else if (!v.contains(".") || v.length < 5) {
                                  return "Enter a valid email !!";
                                }
                                return null;
                              },
                              controller: emailController,
                              hintText: 'Email address',
                              iconName: Assets.icons.message,
                            ),
                            const SizedBox(height: 36),
                            CustomTextField(
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "Enter username";
                                } else if (v.length <= 7) {
                                  return "Password must be 8 characters at least";
                                }
                                return null;
                              },
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
                        Navigator.pushNamed(context, AppRoutes.login);
                      },
                      title: "Log in",
                      subtitle: "Already have an account ? ",
                    ),
                    AppButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().register(
                            username: usernameController.text,
                            password: passwordController.text,
                            email: emailController.text,
                          );
                        }
                      },
                      label: state is AuthLoadingState
                          ? "Registering.."
                          : "Register",
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
