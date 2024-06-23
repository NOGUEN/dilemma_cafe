// ignore_for_file: use_key_in_widget_constructors

import 'package:dillema_cafe/core/viewmodels/ticket_store_viewmodel.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/design_system/font_styles.dart';
import 'package:dillema_cafe/ui/widgets/ticket_list_cell.dart';
import 'package:flutter/material.dart';
import 'package:dillema_cafe/ui/widgets/base_widget.dart';
import 'package:flutter_svg/svg.dart';

class TicketStoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<TicketStoreViewmodel>(
      model: TicketStoreViewmodel(),
      onModelReady: (TicketStoreViewmodel model) => model.initModel(),
      builder: (BuildContext context, TicketStoreViewmodel model, _) {
        model.fetchTickets();

        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text(
              "티켓 상점",
              style: TextStyle(
                fontFamily: "Jalnan",
                color: AppColors.primary,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    SvgPicture.asset(
                      "assets/image/ticket_icon.svg",
                      colorFilter: const ColorFilter.mode(
                          AppColors.primary, BlendMode.srcIn),
                      width: 150,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "티켓을 구매해서 나만의 딜레마를 게재해보세요!",
                      style: AppTextStyles.subhead3Bold
                          .copyWith(color: AppColors.white),
                    ),
                    const SizedBox(height: 30),
                    if (model.tickets.isEmpty)
                      const CircularProgressIndicator(color: AppColors.primary),
                    if (model.tickets.isNotEmpty)
                      for (var ticket in model.tickets)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: TicketListCell(
                            ticketCount: ticket.ticket_count,
                            cost: ticket.cost,
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
