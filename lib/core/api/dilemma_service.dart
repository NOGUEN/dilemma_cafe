import 'package:dillema_cafe/core/models/json_models/dilemma_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'dilemma_service.g.dart';

@RestApi(baseUrl: 'https://cfqdnaomjctsvpoczwcm.supabase.co/rest/v1')
abstract class DilemmaService {
  factory DilemmaService(Dio dio, {String baseUrl}) = _DilemmaService;

  @GET('/Dilemma')
  Future<List<DilemmaModel>> getPopularDilemmaList(
    @Header('apikey') String token,
    @Header('Authorization') String auth,
  );

  @GET('/Dilemma')
  Future<List<DilemmaModel>> getDilemmaList(
    @Header('apikey') String token,
    @Header('Authorization') String auth,
  );
}
