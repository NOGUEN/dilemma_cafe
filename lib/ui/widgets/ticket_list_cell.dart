import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/design_system/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TicketListCell extends StatelessWidget {
  const TicketListCell({
    super.key,
    required this.cost,
    required this.ticketCount,
  });

  final int cost;
  final int ticketCount;

  @override
  Widget build(BuildContext context) {
    Widget ticketImg;

    if (ticketCount >= 20 && ticketCount < 50) {
      ticketImg = SvgPicture.asset(
        'assets/image/ticket2_icon.svg',
        colorFilter: const ColorFilter.mode(
          AppColors.primary,
          BlendMode.srcIn,
        ),
      );
    } else if (ticketCount >= 50) {
      ticketImg = SvgPicture.asset(
        'assets/image/ticket3_icon.svg',
        colorFilter: const ColorFilter.mode(
          AppColors.primary,
          BlendMode.srcIn,
        ),
      );
    } else {
      ticketImg = SvgPicture.asset(
        'assets/image/ticket_icon.svg',
        colorFilter: const ColorFilter.mode(
          AppColors.primary,
          BlendMode.srcIn,
        ),
      );
    }

    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkGray,
        borderRadius: BorderRadius.circular(AppValues.boxBorderRadius),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          SizedBox(
            width: 40,
            height: 40,
            child: ticketImg,
          ),
          const SizedBox(width: 10),
          Text(
            "티켓 $ticketCount개",
            style: AppTextStyles.dillemaSubhead2.copyWith(
              color: AppColors.white,
            ),
          ),
          const Spacer(),
          Text(
            "$cost 원",
            style: AppTextStyles.dillemaSubhead2.copyWith(
              color: AppColors.white,
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.gray),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
