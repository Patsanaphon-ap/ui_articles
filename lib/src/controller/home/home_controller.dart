import 'package:get/get.dart';
import 'package:ui_articles/src/data/model/articles_model.dart';

class HomeController extends GetxController {
  bool isloading = true;
  String errormessage = '';
  List<ArticlesModel> articlesData = [];

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 400))
        .then((value) => onLoadData());
    super.onInit();
  }

  void onLoadData() async {
    isloading = true;
    update();

    update();
  }
}
