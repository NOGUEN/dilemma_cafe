import 'package:dillema_cafe/core/models/json_models/dillema_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'dillema_service.g.dart';

@RestApi(baseUrl: 'https://cfqdnaomjctsvpoczwcm.supabase.co/rest/v1')
abstract class DillemaService {
  factory DillemaService(Dio dio, {String baseUrl}) = _DillemaService;

  @GET('/Dillema')
  Future<List<DillemaModel>> getPopularDillemaList(
    @Header('apikey') String token,
    @Header('Authorization') String auth,
  );

  @GET('/Dillema')
  Future<List<DillemaModel>> getDillemaList(
    @Header('apikey') String token,
    @Header('Authorization') String auth,
  );
}
