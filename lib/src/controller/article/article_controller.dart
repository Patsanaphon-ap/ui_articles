import 'package:get/get.dart';
import 'package:ui_articles/src/data/api/articles/articles_api.dart';
import 'package:ui_articles/src/data/local/share_prefs.dart';
import 'package:ui_articles/src/data/model/articles_model.dart';

class ArticleController extends GetxController {
  ArticleController();
  //For calling api
  final SharePreferencesImp prefs = SharePreferencesImp();
  final ArticlesRemote _articlesApi = ArticlesRemoteDateImp();

  bool isloading = true;
  String errormessage = '';
  String article = 'latest';
  List<ArticlesModel> articlesData = [];
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 400))
        .then((value) => onLoadData());
    super.onInit();
  }

  //load data from google news
  void onLoadData({bool? onRefresh, String? value}) async {
    currentIndex = 0.obs;
    isloading = true;
    article = value ?? 'latest';
    errormessage = '';
    update();

    final response = await _articlesApi.getArticle(article: article);
    final res = response.isSuccess();

    if (res) {
      articlesData = response.tryGetSuccess() ?? [];
      //save articles to local storage when load complete
      await prefs.setArticles(prefsKey: article, articleData: articlesData);
    } else {
      //use storage data when load not complete
      articlesData = await prefs.getSavedArticles(prefsKey: article);
    }
    isloading = false;
    update();
  }

  //for testing only when reach limit
  // void onLoadJson({String? value}) async {
  //   currentIndex = 0.obs;
  //   isloading = true;
  //   article = value ?? 'latest';
  //   update();

  //   String jsonString =
  //       await rootBundle.loadString('assets/json/$article.json');
  //   // Parse the JSON string into a Map
  //   final Map<String, dynamic> response = jsonDecode(jsonString);
  //   articlesData = List<ArticlesModel>.from(
  //     (response['items'] ?? []).map(
  //       (e) => ArticlesModel.fromJson(e),
  //     ),
  //   );
  //   isloading = false;
  //   update();
  // }

  //previous function on homepage articles
  void onPrevious() {
    currentIndex.value--;
    update();
  }

  //next function on homepage articles
  void onNext() {
    currentIndex.value++;
    update();
  }
}
