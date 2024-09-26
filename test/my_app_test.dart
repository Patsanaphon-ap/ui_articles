import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:ui_articles/src/controller/article/article_controller.dart';
import 'package:ui_articles/src/controller/bookmarks/bookmark_controller.dart';
import 'package:ui_articles/src/ui/page/home/home_page.dart';
import 'package:ui_articles/src/ui/page/home/search_widget.dart';
import 'package:ui_articles/src/ui/page/home/today_article_widget.dart';
import 'package:ui_articles/src/ui/widget/my_appbar.dart';

void main() {
  // Initialize GetX
  setUp(() {
    // Assuming ArticleController doesn't have any dependencies
    Get.put<ArticleController>(ArticleController());
    Get.put<BookmarksController>(BookmarksController());
  });

  testWidgets(
      'HomePage displays MyAppbar, SearchWidget, ArticleMenu, and TodayArticleWidget',
      (WidgetTester tester) async {
    // Build the HomePage widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: HomePage(),
      ),
    );

    // Verify that MyAppbar is displayed
    expect(find.byType(MyAppbar), findsOneWidget);
    expect(find.text('Hi There,'), findsOneWidget);
    expect(find.text('Good Morning!'), findsOneWidget);

    // Verify that SearchWidget is displayed
    expect(find.byType(SearchWidget), findsOneWidget);

    // Verify that ArticleMenu is displayed
    expect(find.byType(ArticleMenu), findsOneWidget);

    // Verify that TodayArticleWidget is displayed
    expect(find.byType(TodayArticleWidget), findsOneWidget);
  });

  testWidgets('ArticleMenu calls onLoadJson with the selected value',
      (WidgetTester tester) async {
    // Arrange
    Get.find<ArticleController>();
    await tester.pumpWidget(
      const GetMaterialApp(
        home: Scaffold(
          body: ArticleMenu(),
        ),
      ),
    );

    // Act
    final dropdownFinder = find.byType(DropdownButtonFormField<String>);
    await tester.tap(dropdownFinder);
    await tester.pumpAndSettle(); // Wait for the dropdown to open

    // Select 'business'
    await tester.tap(find.text('business').last);
    await tester.pumpAndSettle();
  });
}
