import 'package:dillema_cafe/core/api/dilemma_service.dart';
import 'package:dillema_cafe/core/models/json_models/dilemma_model.dart';
import 'package:dillema_cafe/core/viewmodels/base_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends BaseModel {
  // HomeViewModel({
  //   required this.postApi,
  // });

  // final PostApi postApi;

  List<DilemmaModel> popularDillemas = List.empty(growable: true);

  @override
  Future<void> initModel() async {
    setBusy(true);

    await fetchPopularDilemma();

    setBusy(false);
  }

  Future<void> fetchPopularDilemma() async {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger());

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String anonKey = prefs.getString('ANON_KEY') ?? '';

    try {
      List<DilemmaModel> popularDilemma =
          await DilemmaService(dio).getPopularDilemmaList(
        anonKey,
        'Bearer $anonKey',
      );
      popularDillemas = popularDilemma;
    } catch (e) {
      debugPrint("anonKey $anonKey ${e.toString()}");
    }
  }
}
