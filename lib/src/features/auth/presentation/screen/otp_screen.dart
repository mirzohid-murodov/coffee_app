import 'dart:async';
import 'package:coffee_mobile/src/core/constants/color/app_colors.dart';
import 'package:coffee_mobile/src/core/constants/theme/pinput_theme.dart';
import 'package:coffee_mobile/src/core/extension/timer_format.dart';
import 'package:coffee_mobile/src/core/utils/snackbar/snackbar_service.dart';
import 'package:coffee_mobile/src/core/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
  late Timer? timer;
  int num = 5;

  @override
  void initState() {
    super.initState();
    _otpTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _otpTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (time) {
      if (num == 0) {
        timer?.cancel();
      } else {
        setState(() {
          num--;
        });
      }
    });
  }

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
              AppRoutes.main,
              (_) => false,
            );
            return SnackbarService.success(context, "Successfully registered");
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Pinput(
                length: 6,
                controller: codeController,
                defaultPinTheme: PinputTheme.defaultPinTheme,
                focusedPinTheme: PinputTheme.focusedPinTheme,
                submittedPinTheme: PinputTheme.submittedPinTheme,
              ),
              SizedBox(
                height: 60,
                child: Center(
                  child: num == 0
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              num = 120;
                            });
                            _otpTimer();
                          },
                          icon: Icon(
                            Icons.refresh,
                            color: AppColors.primary,
                            size: 30,
                          ),
                        )
                      : Text(
                          num.formatTime(num),
                          style: GoogleFonts.poppins(
                            color: AppColors.textGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                ),
              ),
            ],
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
