import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_articles/src/controller/article/article_controller.dart';
import 'package:ui_articles/src/ui/page/home/search_widget.dart';
import 'package:ui_articles/src/ui/page/home/today_article_widget.dart';
import 'package:ui_articles/src/ui/widget/my_appbar.dart';

import 'package:ui_articles/src/ui/widget/my_page.dart';
import 'package:ui_articles/src/ui/widget/my_text.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final articleCtrl = Get.find<ArticleController>();

  @override
  Widget build(BuildContext context) {
    return MyPage(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: const [
          // Custom app bar with a title and subtitle
          MyAppbar(
            title: 'Hi There,',
            subtitle: 'Good Morning!',
          ),
          //Search bar widget not work didn't do
          SearchWidget(),
          // Dropdown menu for selecting news categories
          ArticleMenu(),
          // Widget displaying today's articles
          TodayArticleWidget(),
        ],
      ),
    );
  }
}

class ArticleMenu extends StatelessWidget {
  const ArticleMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //dropdown select category
        DropdownButtonFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          value: 'latest', // Default selected value
          onChanged: (String? newValue) {
            // Update the article list based on the selected category
            Get.put(ArticleController()).onLoadData(value: newValue);
          },
          items: <String>[
            'latest',
            'entertainment',
            'world',
            'business',
            'health',
            'sport',
            'science',
            'technology'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: text18Normal(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
