import 'package:coffee_mobile/src/core/constants/color/app_colors.dart';
import 'package:coffee_mobile/src/core/utils/snackbar/snackbar_service.dart';
import 'package:coffee_mobile/src/core/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/router/app_routes.dart';
import '../cubit/auth_cubit.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.email});

  final String email;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController codeController = TextEditingController();
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: AppColors.grey.withAlpha(100),
      border: Border.all(color: AppColors.grey),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  get focusedPinTheme => defaultPinTheme.copyDecorationWith(
    border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
    borderRadius: BorderRadius.circular(20),
  );

  get submittedPinTheme => defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: Colors.green.withAlpha(50),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthErrorState) {
            return SnackbarService.error(
              context,
              state.errorMessage ?? "OTP bad request",
            );
          } else if (state is AuthSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.home,
              (_) => false,
            );
            return SnackbarService.success(context, "Successfully registered");
          }
        },
        child: Center(
          child: Pinput(
            length: 6,
            controller: codeController,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: AppButton(
          onTap: () {
            context.read<AuthCubit>().otp(
              email: widget.email,
              code: codeController.text,
            );
          },
          label: "Confirm code",
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
