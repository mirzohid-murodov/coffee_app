import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../color/app_colors.dart';

class PinputTheme {
  static final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
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

  static get focusedPinTheme => defaultPinTheme.copyDecorationWith(
    border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
    borderRadius: BorderRadius.circular(20),
  );

  static get submittedPinTheme => defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: Colors.green.withAlpha(50),
    ),
  );
}