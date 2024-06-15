import 'package:dillema_cafe/ui/design_system/font_styles.dart';
import 'package:flutter/material.dart';

class MainCell extends StatelessWidget {
  const MainCell({
    required this.titleText,
    required this.descriptionText,
    required this.bottomImg,
    required this.backgroundColor,
    required this.height,
    required this.onTapFunction,
    super.key,
  });

  final String titleText;
  final String descriptionText;
  final Widget bottomImg;
  final Color backgroundColor;
  final double height;
  final void Function() onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTapFunction,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titleText, style: AppTextStyles.dillemaSubhead3),
                Text(
                  descriptionText,
                  style: AppTextStyles.captionRegular,
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: bottomImg,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
