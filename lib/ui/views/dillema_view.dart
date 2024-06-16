// ignore_for_file: must_be_immutable

import 'package:dillema_cafe/core/constants/app_constants.dart';
import 'package:dillema_cafe/core/viewmodels/dillema_viewmodel.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/widgets/dillema_cafe_button.dart';
import 'package:dillema_cafe/ui/widgets/dillema_pick_button.dart';
import 'package:dillema_cafe/ui/widgets/dillema_textfield.dart';
import 'package:flutter/material.dart';
import 'package:dillema_cafe/ui/widgets/base_widget.dart';

class DillemaView extends StatefulWidget {
  @override
  State<DillemaView> createState() => _DillemaViewState();

  bool isTapped = false;

  DillemaView({super.key});
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
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Column(
            children: [
              DillemaPickButton(
                height: dillemaPickButtonHeight,
                imgUrl: null,
                titleText: "titleText",
                isTapped: model.chosenDillema[0],
                onTapFunction: () {
                  setState(() {
                    model.pickDillema(0);
                  });
                },
              ),
              DillemaPickButton(
                height: dillemaPickButtonHeight,
                imgUrl: null,
                titleText: "titleText",
                isTapped: model.chosenDillema[1],
                onTapFunction: () {
                  setState(() {
                    model.pickDillema(1);
                  });
                },
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
