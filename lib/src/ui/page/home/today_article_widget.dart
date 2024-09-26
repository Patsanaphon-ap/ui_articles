import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_articles/src/controller/article/article_controller.dart';
import 'package:ui_articles/src/data/model/articles_model.dart';
import 'package:ui_articles/src/route/route_path.dart';
import 'package:ui_articles/src/ui/widget/my_error.dart';
import 'package:ui_articles/src/ui/widget/my_loading.dart';
import 'package:ui_articles/src/ui/widget/my_text.dart';
import 'package:ui_articles/src/util/format_util.dart';

class TodayArticleWidget extends StatelessWidget {
  const TodayArticleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final articleCtrl = Get.put(ArticleController());

    return GetBuilder<ArticleController>(
      builder: (_) {
        if (articleCtrl.isloading) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: const Column(
              children: [
                Center(
                  child: MyLoadingWidget(),
                ),
              ],
            ),
          );
        } else if (articleCtrl.errormessage.isNotEmpty) {
          return MyErrorWidget(
            onPressed: () {
              articleCtrl.onLoadData(onRefresh: true);
            },
          );
        } else if (articleCtrl.articlesData.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/bookmark_empty.png'),
              text18Bold('Empty for now...'),
            ],
          );
        }
        ArticlesModel data =
            articleCtrl.articlesData[articleCtrl.currentIndex.value];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: text22Bold('Today\'s Article'),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(
                  RoutePath.articledetail,
                  arguments: {'image': data.images?.thumbnail, 'data': data},
                );
              },
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: Get.height * 0.25,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                        child: Image.network(
                          data.images?.thumbnail ?? '',
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(Icons.error),
                            ); // Placeholder icon or widget
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
                data.publisher,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text16Bold(
                  data.title,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 12,
                ),
                text16Normal(
                  data.snippet,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 12,
                ),
                text14Bold(
                  TimeStamp.timeStampParse(data.timestamp),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: articleCtrl.currentIndex.value > 0
                          ? () => articleCtrl.onPrevious()
                          : null,
                      child: text16Bold('Previous'),
                    ),
                    ElevatedButton(
                      onPressed: articleCtrl.currentIndex.value <
                              articleCtrl.articlesData.length - 1
                          ? () => articleCtrl.onNext()
                          : null,
                      child: text16Bold('Next'),
                    ),
                  ],
                )),
            const Divider(),
          ],
        );
      },
    );
  }
}
