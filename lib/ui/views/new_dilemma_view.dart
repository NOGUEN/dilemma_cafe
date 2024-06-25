// ignore_for_file: use_key_in_widget_constructors

import 'package:dillema_cafe/core/viewmodels/new_dilemma_viewmodel.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dillema_cafe/ui/widgets/base_widget.dart';

class NewDilemmaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<NewDilemmaViewModel>(
      model: NewDilemmaViewModel(),
      onModelReady: (NewDilemmaViewModel model) => model.initModel(),
      builder: (BuildContext context, NewDilemmaViewModel model, _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text(
              "새로운 딜레마",
              style: TextStyle(
                fontFamily: "Jalnan",
                color: AppColors.primary,
              ),
            ),
          ),
          body: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [],
              ),
            ),
          ),
        );
      },
    );
  }
}
