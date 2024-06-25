import 'package:dillema_cafe/core/models/json_models/dilemma_model.dart';
import 'package:dillema_cafe/core/viewmodels/base_viewmodel.dart';

class NewDilemmaViewModel extends BaseModel {
  List<bool> tapped = [true, false];
  List<DilemmaModel> allDilemmas = List.empty(growable: true);

  @override
  Future<void> initModel() async {
    setBusy(true);

    await fetchAllDilemmas();

    setBusy(false);
  }

  Future<void> fetchAllDilemmas() async {}
}
