import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_articles/src/data/model/articles_model.dart';
import 'package:ui_articles/src/route/route_path.dart';
import 'package:ui_articles/src/ui/widget/my_text.dart';
import 'package:ui_articles/src/util/format_util.dart';

class ArticleCardWidget extends StatelessWidget {
  const ArticleCardWidget({
    super.key,
    required this.bookmarksdata,
  });

  final ArticlesModel bookmarksdata;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(
              RoutePath.articledetail,
              arguments: {
                'image': bookmarksdata.images?.thumbnail,
                'data': bookmarksdata,
              },
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
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    child: Image.network(
                      bookmarksdata.images?.thumbnail ?? '',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
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
            bookmarksdata.publisher,
          ),
        ),
        text16Bold(
          bookmarksdata.title,
        ),
        text16Normal(
          bookmarksdata.snippet,
        ),
        text14Bold(
          TimeStamp.timeStampParse(
            bookmarksdata.timestamp,
          ),
        ),
      ],
    );
  }
}
