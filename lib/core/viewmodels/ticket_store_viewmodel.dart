import 'package:dillema_cafe/core/api/ticket_service.dart';
import 'package:dillema_cafe/core/models/json_models/ticket_model.dart';
import 'package:dillema_cafe/core/viewmodels/base_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicketStoreViewmodel extends BaseModel {
  List<TicketModel> tickets = List.empty(growable: true);

  @override
  Future<void> initModel() async {
    setBusy(true);
    await fetchTickets();
    setBusy(false);
  }

  Future<void> fetchTickets() async {
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
      List<TicketModel> ticket = await TicketService(dio).getTickets(
        anonKey,
        'Bearer $anonKey',
      );
      tickets = ticket;
    } catch (e) {
      debugPrint("anonKey $anonKey");
    }
  }
}
