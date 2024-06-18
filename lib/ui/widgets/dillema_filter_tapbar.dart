import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/design_system/font_styles.dart';
import 'package:flutter/material.dart';

class DillemaFilterTapbar extends StatelessWidget {
  const DillemaFilterTapbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          DillemaFilterButton(
            titleText: "개별 딜레마",
            isTapped: true,
            onTapFunction: () {},
          ),
          const SizedBox(width: 10),
          DillemaFilterButton(
            titleText: "모음 딜레마",
            isTapped: false,
            onTapFunction: () {},
          ),
        ],
      ),
    );
  }
}

class DillemaFilterButton extends StatelessWidget {
  const DillemaFilterButton({
    super.key,
    required this.titleText,
    required this.isTapped,
    required this.onTapFunction,
  });

  final String titleText;
  final bool isTapped;
  final void Function() onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(AppValues.circularBoxBorderRadius),
          color: isTapped ? AppColors.primary : AppColors.darkGray,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Text(
            titleText,
            style: AppTextStyles.body1Medium.copyWith(
              color: isTapped ? AppColors.black : AppColors.gray,
            ),
          ),
        ),
      ),
    );
  }
}
