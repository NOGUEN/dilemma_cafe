import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/design_system/font_styles.dart';
import 'package:flutter/material.dart';

class DilemmaPickButton extends StatefulWidget {
  const DilemmaPickButton({
    super.key,
    required this.height,
    required this.imgUrl,
    required this.titleText,
    required this.isTapped,
    required this.onTapFunction,
  });

  final double height;
  final String? imgUrl;
  final String titleText;
  final bool isTapped;
  final void Function() onTapFunction;

  @override
  State<DilemmaPickButton> createState() => _DillemaPickButtonState();
}

class _DillemaPickButtonState extends State<DilemmaPickButton> {
  late Widget image;

  @override
  void initState() {
    try {
      image = Image.network(
        widget.imgUrl!,
        height: widget.height,
        width: double.infinity,
        fit: BoxFit.fill,
      );
    } catch (e) {
      image = Container(
        height: widget.height,
        width: double.infinity,
        color: AppColors.darkGray,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onTapFunction();
        });
      },
      child: Stack(
        children: [
          image,
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.titleText,
                style: AppTextStyles.dillemaDisplay1.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          if (widget.isTapped)
            Container(
              height: widget.height,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                  color: AppColors.primary,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
