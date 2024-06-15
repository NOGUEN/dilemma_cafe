import 'package:flutter/material.dart';

class AppTextStyles {
  static const double _baseLetterSpacing = -0.5;
  static TextStyle _baseStyle(double size, FontWeight weight) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      fontFamily: 'Pretendard',
      letterSpacing: _baseLetterSpacing,
    );
  }

  static final TextStyle display2Bold = _baseStyle(28, FontWeight.w700);
  static final TextStyle display2SemiBold = _baseStyle(28, FontWeight.w600);
  static final TextStyle display1Bold = _baseStyle(24, FontWeight.w700);
  static final TextStyle display1SemiBold = _baseStyle(24, FontWeight.w600);
  static final TextStyle headlineBold = _baseStyle(20, FontWeight.w700);
  static final TextStyle headlineSemiBold = _baseStyle(20, FontWeight.w600);
  static final TextStyle subhead4Bold = _baseStyle(18, FontWeight.w700);
  static final TextStyle subhead4SemiBold = _baseStyle(18, FontWeight.w600);
  static final TextStyle subhead3Bold = _baseStyle(16, FontWeight.w700);
  static final TextStyle subhead3SemiBold = _baseStyle(16, FontWeight.w600);
  static final TextStyle subhead2Bold = _baseStyle(14, FontWeight.w700);
  static final TextStyle subhead2SemiBold = _baseStyle(14, FontWeight.w600);
  static final TextStyle subhead1Bold = _baseStyle(12, FontWeight.w700);
  static final TextStyle subhead1SemiBold = _baseStyle(12, FontWeight.w600);
  static final TextStyle body3Medium = _baseStyle(18, FontWeight.w500);
  static final TextStyle body3Regular = _baseStyle(18, FontWeight.w400);
  static final TextStyle body2Medium = _baseStyle(16, FontWeight.w500);
  static final TextStyle body2Regular = _baseStyle(16, FontWeight.w400);
  static final TextStyle body1Medium = _baseStyle(14, FontWeight.w500);
  static final TextStyle body1Regular = _baseStyle(14, FontWeight.w400);
  static final TextStyle captionMedium = _baseStyle(12, FontWeight.w500);
  static final TextStyle captionRegular = _baseStyle(12, FontWeight.w400);
  static final TextStyle descriptionMedium = _baseStyle(10, FontWeight.w500);
  static final TextStyle descriptionRegular = _baseStyle(10, FontWeight.w400);
}
