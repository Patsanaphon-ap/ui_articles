import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_articles/src/controller/articledetail/article_detail_controller.dart';
import 'package:ui_articles/src/controller/bookmarks/bookmark_controller.dart';
import 'package:ui_articles/src/data/model/articles_model.dart';
import 'package:ui_articles/src/ui/page/home/widget/thumbnail_widget.dart';
import 'package:ui_articles/src/ui/widget/my_loading.dart';
import 'package:ui_articles/src/ui/widget/my_page.dart';
import 'package:ui_articles/src/ui/widget/my_text.dart';
import 'package:ui_articles/src/util/format_util.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailPage extends StatelessWidget {
  ArticleDetailPage({super.key});

  final articleDetailCtrl = Get.put(ArticleDetailController());
  final bookmarkCtrl = Get.put(BookmarksController());

  @override
  Widget build(BuildContext context) {
    return MyPage(
      appbar: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: _appbar(),
      ),
      //custom bottomnav for read more
      bottomNavigationBar: _bottomNavigator(context),
      //pull to refresh if error
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            //image
            _thumbnail(articleDetailCtrl),
            //body article
            GetBuilder<ArticleDetailController>(
              builder: (_) {
                //if loading
                if (articleDetailCtrl.isloading) {
                  return const Center(
                    child: MyLoadingWidget(),
                  );
                }
                //else show body if correct
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //publishName
                    _publisherName(),
                    //titleName
                    text16Bold(
                      articleDetailCtrl.data.title,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    //snippet
                    text16Normal(
                      articleDetailCtrl.data.snippet,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    //timestamp
                    text14Bold(
                      TimeStamp.timeStampParse(
                          articleDetailCtrl.data.timestamp),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  //bottomnav bar
  Widget _bottomNavigator(context) {
    return GetBuilder<ArticleDetailController>(
      builder: (_) {
        if (articleDetailCtrl.isloading) {
          return const SizedBox();
        }
        return Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom + 12,
            top: 8,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () async {
                        final Uri launchUri = Uri.parse(
                          articleDetailCtrl.data.newsUrl,
                        );
                        try {
                          await launchUrl(
                            launchUri,
                          );
                        } catch (e) {
                          throw e.toString();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: text18BoldWhite('Read More'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  //  publisherName
  Widget _publisherName() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(
          width: .5,
          color: Colors.grey,
        ),
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: text12Bold(
        articleDetailCtrl.data.publisher,
      ),
    );
  }

//thumbnailimage
  Widget _thumbnail(ArticleDetailController articleDetailCtrl) {
    return ThumbnailWidget(thumbnailImage: Get.arguments['image'] ?? '');
  }

  //custom appbar
  Widget _appbar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back_ios_new_outlined,
        ),
      ),
      actions: [
        GetBuilder<ArticleDetailController>(
          builder: (_) {
            if (articleDetailCtrl.isloading) {
              return const SizedBox();
            }
            return ArticleBookMark(
              articleData: articleDetailCtrl.data,
            );
          },
        ),
      ],
    );
  }
}

//bookmark for save
class ArticleBookMark extends StatelessWidget {
  final ArticlesModel articleData;
  ArticleBookMark({required this.articleData, super.key});

  final bookmarkCtrl = Get.put(BookmarksController());

  @override
  Widget build(BuildContext context) {
    return ObxValue(
      (data) {
        // Observing the reactive value directly in Obx
        bool isBookmarked = bookmarkCtrl.isBookMarked(articleData.title);
        //bookmark widget
        return ElevatedButton(
          onPressed: () {
            if (isBookmarked) {
              bookmarkCtrl.deleteBookMark(articleData);
            } else {
              bookmarkCtrl.addBookMark(articleData, isFav: !isBookmarked).then(
                    (value) => isBookmarked =
                        bookmarkCtrl.isBookMarked(articleData.title),
                  );
            }
          },
          child: Icon(
            isBookmarked
                ? Icons.bookmark_rounded
                : Icons.bookmark_border_rounded,
          ),
        );
      },
      bookmarkCtrl.isBookMarked(articleData.title).obs,
    );
  }
}
