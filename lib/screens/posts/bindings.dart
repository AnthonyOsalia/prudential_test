import 'package:get/get.dart';
import 'package:prudential_test/screens/posts/controller.dart';

class PostsBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PostsController());
  }
}
