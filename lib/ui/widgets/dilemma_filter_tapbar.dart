import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/core/viewmodels/all_dilemma_viewmodel.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/design_system/font_styles.dart';
import 'package:flutter/material.dart';

class DilemmaFilterTapbar extends StatelessWidget {
  const DilemmaFilterTapbar({
    super.key,
    required this.allDilemmaViewModel,
  });

  final AllDilemmaViewModel allDilemmaViewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          DillemaFilterButton(
            titleText: "개별 딜레마",
            isTapped: allDilemmaViewModel.tapped[0],
            onTapFunction: () {
              allDilemmaViewModel.changeDilemmaType(0);
            },
          ),
          const SizedBox(width: 10),
          DillemaFilterButton(
            titleText: "모음 딜레마",
            isTapped: allDilemmaViewModel.tapped[1],
            onTapFunction: () {
              allDilemmaViewModel.changeDilemmaType(1);
            },
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
