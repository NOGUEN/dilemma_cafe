import 'package:dillema_cafe/core/api/dilemma_service.dart';
import 'package:dillema_cafe/core/models/json_models/dilemma_model.dart';
import 'package:dillema_cafe/core/viewmodels/base_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllDilemmaViewModel extends BaseModel {
  List<bool> tapped = [true, false];
  List<DilemmaModel> allDilemmas = List.empty(growable: true);

  @override
  Future<void> initModel() async {
    setBusy(true);

    await fetchAllDilemmas();

    setBusy(false);
  }

  Future<void> fetchAllDilemmas() async {
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
      List<DilemmaModel> allDilemma = await DilemmaService(dio).getDilemmaList(
        anonKey,
        'Bearer $anonKey',
      );
      allDilemmas = allDilemma;
    } catch (e) {
      debugPrint("anonKey $anonKey ${e.toString()}");
    }
  }

  void changeDilemmaType(int index) {
    for (int i = 0; i < tapped.length; i++) {
      if (i == index) {
        tapped[i] = true;
      } else {
        tapped[i] = false;
      }
    }
    notifyListeners();
  }
}
