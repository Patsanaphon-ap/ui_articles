import 'package:get/get.dart';
import 'package:ui_articles/src/data/local/share_prefs.dart';
import 'package:ui_articles/src/data/model/articles_model.dart';

class BookmarksController extends GetxController {
  bool isloading = true;
  final SharePreferencesImp prefs = SharePreferencesImp();
  List<ArticlesModel> bookmarksdata = <ArticlesModel>[].obs;

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 400)).then(
      (value) => onLoadData(),
    );
    super.onInit();
  }

  void onLoadData() async {
    isloading = true;
    update();
    var storedBookmarks = await prefs.getBookMarks();
    bookmarksdata.assignAll(storedBookmarks);
    isloading = false;
    update();
  }

//clear bookmark didn't use
  Future<void> removeAllBookMark() async {
    bookmarksdata.clear();
    await prefs.removeBookMarks();
  }

//save bookmark when select
  Future<void> addBookMark(ArticlesModel article, {bool isFav = false}) async {
    if (!isBookMarked(article.title)) {
      bookmarksdata.add(article);
      await prefs.setBookMarks(article);
    }
  }

  //delete bookmark when unselect
  Future<void> deleteBookMark(ArticlesModel article) async {
    if (isBookMarked(article.title)) {
      bookmarksdata.removeWhere((e) => e.title == article.title);
      await prefs.deleteBookMarks(article.title);
    }
  }

  void checkbookmark() async {
    await prefs.getBookMarks();
  }

  bool isBookMarked(String title) {
    return bookmarksdata.any((e) => e.title == title);
  }
}
