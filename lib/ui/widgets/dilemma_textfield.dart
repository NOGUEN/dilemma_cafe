import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/design_system/font_styles.dart';
import 'package:flutter/material.dart';

class DilemmaTextfield extends StatelessWidget {
  const DilemmaTextfield({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 50,
      maxLines: 3,
      controller: textEditingController,
      cursorColor: AppColors.primary,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: AppTextStyles.body2Regular.copyWith(color: AppColors.white),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.circular(AppValues.boxBorderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.gray, width: 1),
          borderRadius: BorderRadius.circular(AppValues.boxBorderRadius),
        ),
      ),
    );
  }
}

class DilemmaSearchTextField extends StatelessWidget {
  const DilemmaSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primary,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: AppTextStyles.body2Regular.copyWith(color: AppColors.white),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.circular(AppValues.boxBorderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.gray, width: 1),
          borderRadius: BorderRadius.circular(AppValues.boxBorderRadius),
        ),
        hintText: "검색어를 입력해주세요",
        hintStyle:
            AppTextStyles.body2Regular.copyWith(color: AppColors.lightGray),
      ),
      onSubmitted: (value) {
        if (value.isNotEmpty) debugPrint(value);
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
