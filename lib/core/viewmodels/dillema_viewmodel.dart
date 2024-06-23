import 'package:dillema_cafe/core/viewmodels/base_viewmodel.dart';
import 'package:flutter/material.dart';

class DilemmaViewModel extends BaseModel {
  // HomeViewModel({
  //   required this.postApi,
  // });

  // final PostApi postApi;

  // List<Post> posts = <Post>[];

  List<bool> chosenDilemma = [false, false];
  TextEditingController textEditingController = TextEditingController();

  void pickDilemma(int index) {
    if (index == 0) {
      chosenDilemma[0] = true;
      chosenDilemma[1] = false;
    } else {
      chosenDilemma[0] = false;
      chosenDilemma[1] = true;
    }
  }

  bool checkSubmitAvailable() {
    if (chosenDilemma.any((element) => element == true) == false) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<void> initModel() async {
    setBusy(true);

    await fetchPosts();

    setBusy(false);
  }

  Future<void> fetchPosts() async {
    // final HttpResponse<List<Post>> response = await postApi.getPosts();

    // final int responseCode = response.response.statusCode ?? 0;
    // if (responseCode < 200 || responseCode > 299) {
    //   return;
    // }

    // posts = response.data;
  }
}
