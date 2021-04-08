import 'package:get/get.dart';
import 'package:prudential_test/screens/posts-details/controller.dart';

class PostDetailsBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PostDetailsController());
  }
}
