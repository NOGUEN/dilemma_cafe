// ignore_for_file: use_key_in_widget_constructors

import 'package:dillema_cafe/core/viewmodels/my_page_viewmodel.dart';
import 'package:dillema_cafe/ui/design_system/app_colors.dart';
import 'package:dillema_cafe/ui/widgets/dillema_avatar_card.dart';
import 'package:dillema_cafe/ui/widgets/user_info_card.dart';
import 'package:flutter/material.dart';
import 'package:dillema_cafe/ui/widgets/base_widget.dart';

class MyPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<MyPageViewmodel>(
      model: MyPageViewmodel(),
      onModelReady: (MyPageViewmodel model) => model.initModel(),
      builder: (BuildContext context, MyPageViewmodel model, _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text(
              "마이페이지",
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
                children: [
                  SizedBox(height: 15),
                  DillemaAvatarCard(
                    height: 200,
                  ),
                  SizedBox(height: 15),
                  UserInfoCard(
                    likeCount: 100,
                    dillemaCount: 100,
                    ticketCount: 0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
