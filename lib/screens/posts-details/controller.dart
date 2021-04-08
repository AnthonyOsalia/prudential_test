import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prudential_test/api_service/Urls.dart';
import 'package:prudential_test/api_service/api_service.dart';
import 'package:prudential_test/commons/models/comment.dart';
import 'package:prudential_test/commons/models/post.dart';
import 'package:prudential_test/utils/util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostDetailsController extends GetxController {
  var current_time = DateTime.now().hour.obs;

  var user = {}.obs;
  String get greeting {
    if (current_time < 12) {
      return 'Good Morning';
    }
    if (current_time < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  String get firstName {
    if (user.value != null) {
      return user.value['first_name'];
    }

    return '';
  }

  RxList<Comment> comments = RxList();
  var isLoading = false.obs;

  BuildContext context;
  Post post;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  PostDetailsController({this.context, @required this.post});

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    //this would be meant to get user details from db or shared preferences

    user.value = {
      "first_name": "Anthony Osalia",
    };

    getComments();
  }

  void getComments() {
    isLoading.value = true;
    ApiService.get(Urls.posts + "${post.id.toString()}/comments/").then((res) {
      // print(res);
      isLoading.value = false;
      comments.value = commentFromMap(res.body);
    }, onError: (e) {
      isLoading.value = false;
      Util.showNoInternetError(context);
    });
  }
}
