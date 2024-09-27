import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_articles/src/data/model/articles_model.dart';
import 'package:ui_articles/src/route/route_path.dart';
import 'package:ui_articles/src/ui/page/home/widget/thumbnail_widget.dart';
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
        //thumnail image
        ThumbnailWidget(
          thumbnailImage: bookmarksdata.images?.thumbnail ?? '',
          onTap: () {
            Get.toNamed(
              RoutePath.articledetail,
              arguments: {
                'image': bookmarksdata.images?.thumbnail,
                'data': bookmarksdata
              },
            );
          },
        ),
        //publisher name
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
        //title
        text16Bold(
          bookmarksdata.title,
        ),
        //snippet
        text16Normal(
          bookmarksdata.snippet,
        ),
        //timestamp
        text14Bold(
          TimeStamp.timeStampParse(
            bookmarksdata.timestamp,
          ),
        ),
      ],
    );
  }
}
