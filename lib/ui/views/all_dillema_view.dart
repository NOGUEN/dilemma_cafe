import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/core/viewmodels/all_dillema_viewmodel.dart';
import 'package:dillema_cafe/ui/widgets/dillema_filter_tapbar.dart';
import 'package:dillema_cafe/ui/widgets/dillema_list_cell.dart';
import 'package:dillema_cafe/ui/widgets/dillema_textfield.dart';
import 'package:flutter/material.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/widgets/base_widget.dart';

class AllDillemaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<AllDillemaViewModel>(
      model: AllDillemaViewModel(),
      onModelReady: (AllDillemaViewModel model) => model.initModel(),
      builder: (BuildContext context, AllDillemaViewModel model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "모두 보기",
              style: TextStyle(
                fontFamily: "Jalnan",
                color: AppColors.primary,
              ),
            ),
            centerTitle: false,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.horizontalPadding),
              child: Column(
                children: [
                  const DillemaSearchTextField(),
                  const SizedBox(height: 15),
                  const DillemaFilterTapbar(),
                  const SizedBox(height: 15),
                  for (int i = 0; i < 10; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: DillemaListCell(
                        titleText: "titleText",
                        likeCount: 100,
                        participateCount: 100,
                        onTapFunction: () {},
                      ),
                    ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
