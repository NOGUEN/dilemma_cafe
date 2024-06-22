import 'package:dillema_cafe/core/api/dillema_service.dart';
import 'package:dillema_cafe/core/models/json_models/dillema_model.dart';
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

  List<DillemaModel> popularDillemas = List.empty(growable: true);

  @override
  Future<void> initModel() async {
    setBusy(true);

    await fetchPopularDillema();

    setBusy(false);
  }

  Future<void> fetchPopularDillema() async {
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
      List<DillemaModel> popularDillema =
          await DillemaService(dio).getPopularDillemaList(
        anonKey,
        'Bearer $anonKey',
      );
      popularDillemas = popularDillema;
    } catch (e) {
      debugPrint("anonKey $anonKey ${e.toString()}");
    }
  }
}
