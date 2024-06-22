import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/core/models/json_models/dillema_model.dart';
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
                  DillemaFilterTapbar(
                    allDillemaViewModel: model,
                  ),
                  const SizedBox(height: 15),
                  if (model.tapped[0] == true)
                    if (model.allDillemas.isEmpty)
                      const CircularProgressIndicator(color: AppColors.primary),
                  if (model.tapped[0] == true)
                    if (model.allDillemas.isNotEmpty)
                      for (DillemaModel dillema in model.allDillemas)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: DillemaListCell(
                            titleText: dillema.title,
                            likeCount: dillema.like,
                            participateCount: 0,
                            onTapFunction: () {
                              Navigator.of(context).pushNamed(
                                RoutePaths.Dillema,
                                arguments: dillema,
                              );
                            },
                          ),
                        ),
                  if (model.tapped[1] == true) const SizedBox(),
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
