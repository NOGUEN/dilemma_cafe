import 'package:dillema_cafe/core/models/json_models/ticket_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'ticket_service.g.dart';

@RestApi(baseUrl: 'https://cfqdnaomjctsvpoczwcm.supabase.co/rest/v1')
abstract class TicketService {
  factory TicketService(Dio dio, {String baseUrl}) = _TicketService;

  @GET('/Ticket')
  Future<List<TicketModel>> getTickets(
    @Header('apikey') String token,
    @Header('Authorization') String auth,
  );
}
