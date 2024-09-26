import 'package:get/get.dart';
import 'package:ui_articles/src/controller/article/article_controller.dart';
import 'package:ui_articles/src/controller/bookmarks/bookmark_controller.dart';
import 'package:ui_articles/src/controller/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ArticleController>(() => ArticleController());
    Get.lazyPut<BookmarksController>(() => BookmarksController());
  }
}
