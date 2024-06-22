// ignore_for_file: must_be_immutable

import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/core/models/json_models/dillema_model.dart';
import 'package:dillema_cafe/core/viewmodels/dillema_viewmodel.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/widgets/dillema_cafe_button.dart';
import 'package:dillema_cafe/ui/widgets/dillema_pick_button.dart';
import 'package:dillema_cafe/ui/widgets/dillema_textfield.dart';
import 'package:flutter/material.dart';
import 'package:dillema_cafe/ui/widgets/base_widget.dart';

class DillemaView extends StatefulWidget {
  DillemaView({
    super.key,
    required this.dillemaModel,
  });

  @override
  State<DillemaView> createState() => _DillemaViewState();

  final DillemaModel dillemaModel;

  bool isTapped = false;
}

class _DillemaViewState extends State<DillemaView> {
  @override
  Widget build(BuildContext context) {
    double dillemaPickButtonHeight = MediaQuery.of(context).size.height * 2 / 7;

    return BaseWidget<DillemaViewModel>(
      model: DillemaViewModel(),
      onModelReady: (DillemaViewModel model) => model.initModel(),
      builder: (BuildContext context, DillemaViewModel model, _) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      DillemaPickButton(
                        height: dillemaPickButtonHeight,
                        imgUrl: widget.dillemaModel.image1,
                        titleText: widget.dillemaModel.dillema1,
                        isTapped: model.chosenDillema[0],
                        onTapFunction: () {
                          setState(
                            () {
                              model.pickDillema(0);
                            },
                          );
                        },
                      ),
                      DillemaPickButton(
                        height: dillemaPickButtonHeight,
                        imgUrl: widget.dillemaModel.image2,
                        titleText: widget.dillemaModel.dillema2,
                        isTapped: model.chosenDillema[1],
                        onTapFunction: () {
                          setState(
                            () {
                              model.pickDillema(1);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const Positioned.fill(
                    child: Center(
                      child: Text(
                        "VS",
                        style: TextStyle(
                          fontFamily: "Jalnan",
                          fontSize: 30,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.horizontalPadding,
                ),
                child: DillemaTextfield(
                  textEditingController: model.textEditingController,
                ),
              ),
              const Spacer(),
            ],
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppValues.horizontalPadding,
              ),
              child: DillemaCafeButton(
                height: 50,
                titleText: "등록!",
                isAvailable: model.checkSubmitAvailable(),
                onTapFunction: () {},
              ),
            ),
          ),
        );
      },
    );
  }
}
