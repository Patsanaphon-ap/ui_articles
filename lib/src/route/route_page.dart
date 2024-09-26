import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_articles/src/controller/home/home_binding.dart';
import 'package:ui_articles/src/route/route_path.dart';
import 'package:ui_articles/src/ui/page/bookmark/bookmark_page.dart';
import 'package:ui_articles/src/ui/page/detail/article_detail_page.dart';
import 'package:ui_articles/src/ui/page/home/home_page.dart';

class RoutePages {
  RoutePages._();

  static final routes = [
    GetPage(
      name: RoutePath.pageNotfound,
      page: () => const Scaffold(body: Center(child: Text('Page Not Found.'))),
    ),
    GetPage(
      name: RoutePath.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutePath.articledetail,
      page: () => ArticleDetailPage(),
    ),
    GetPage(
      name: RoutePath.bookmarks,
      page: () => const BookmarkPage(),
    ),
  ];
}
