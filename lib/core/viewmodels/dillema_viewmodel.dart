import 'package:dillema_cafe/core/viewmodels/base_viewmodel.dart';
import 'package:flutter/material.dart';

class DillemaViewModel extends BaseModel {
  // HomeViewModel({
  //   required this.postApi,
  // });

  // final PostApi postApi;

  // List<Post> posts = <Post>[];

  List<bool> chosenDillema = [false, false];
  TextEditingController textEditingController = TextEditingController();

  void pickDillema(int index) {
    if (index == 0) {
      chosenDillema[0] = true;
      chosenDillema[1] = false;
    } else {
      chosenDillema[0] = false;
      chosenDillema[1] = true;
    }
  }

  bool checkSubmitAvailable() {
    if (chosenDillema.any((element) => element == true) == false) {
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
