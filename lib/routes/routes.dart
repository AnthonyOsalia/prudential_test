import 'package:get/get.dart';
import 'package:prudential_test/screens/posts-details/bindings.dart';
import 'package:prudential_test/screens/posts-details/post-details.dart';
import 'package:prudential_test/screens/posts/bindings.dart';
import 'package:prudential_test/screens/posts/posts.dart';
import 'package:prudential_test/screens/splash/splash.dart';

class Routes {
  static String splash = "/splash";
  static String posts = "/posts";
  static String post_details = "/post-details";

  static var initial = splash;
}

class Pages {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: Routes.splash,
        page: () => SplashScreen(),
      ),
      GetPage(
        name: Routes.posts,
        page: () => PostsScreen(),
        bindings: [
          PostsBindings(),
        ],
      ),
      GetPage(
        name: Routes.post_details,
        page: () => PostDetailsScreen(),
        bindings: [
          PostDetailsBindings(),
        ],
      ),
    ];
  }
}
