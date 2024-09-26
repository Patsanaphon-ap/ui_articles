import 'package:get/get.dart';
import 'package:ui_articles/src/data/model/articles_model.dart';

class ArticleDetailController extends GetxController {
  bool isloading = true;
  ArticlesModel data = ArticlesModel();

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 400))
        .then((value) => onLoadData());
    super.onInit();
  }

  void onLoadData() async {
    isloading = true;
    update();
    //Get data from navigator
    data = Get.arguments['data'];
    Future.delayed(const Duration(milliseconds: 400));
    isloading = false;
    update();
  }
}
