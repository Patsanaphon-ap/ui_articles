import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_articles/src/route/route_path.dart';
import 'package:ui_articles/src/ui/widget/my_text.dart';

class MyAppbar extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const MyAppbar({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text14Bold(
                title ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              text24Bold(
                subtitle ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const BookMarksIcon(),
      ],
    );
  }
}

class BookMarksIcon extends StatelessWidget {
  const BookMarksIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(RoutePath.bookmarks);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(
                width: .5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: const Icon(
              Icons.bookmark_outline_outlined,
            ),
          ),
        ),
      ],
    );
  }
}
