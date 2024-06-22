import 'package:dillema_cafe/core/api/dillema_service.dart';
import 'package:dillema_cafe/core/models/json_models/dillema_model.dart';
import 'package:dillema_cafe/core/viewmodels/base_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllDillemaViewModel extends BaseModel {
  List<bool> tapped = [true, false];
  List<DillemaModel> allDillemas = List.empty(growable: true);

  @override
  Future<void> initModel() async {
    setBusy(true);

    await fetchAllDillemas();

    setBusy(false);
  }

  Future<void> fetchAllDillemas() async {
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
      List<DillemaModel> allDillema = await DillemaService(dio).getDillemaList(
        anonKey,
        'Bearer $anonKey',
      );
      allDillemas = allDillema;
    } catch (e) {
      debugPrint("anonKey $anonKey ${e.toString()}");
    }
  }

  void changeDillemaType(int index) {
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
