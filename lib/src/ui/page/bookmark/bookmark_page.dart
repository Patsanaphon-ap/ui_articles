import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_articles/src/controller/bookmarks/bookmark_controller.dart';
import 'package:ui_articles/src/ui/page/bookmark/widget/article_card_widget.dart';
import 'package:ui_articles/src/ui/widget/my_loading.dart';
import 'package:ui_articles/src/ui/widget/my_page.dart';
import 'package:ui_articles/src/ui/widget/my_text.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarkCtrl = Get.put(BookmarksController());
    return MyPage(
      useScroll: false,
      appbar: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: _appbar(),
      ),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: GetBuilder<BookmarksController>(
          builder: (_) {
            if (bookmarkCtrl.isloading) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: MyLoadingWidget()),
                ],
              );
            } else if (bookmarkCtrl.bookmarksdata.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/bookmark_save.png'),
                  text18Bold('Hey, Let\'s book something...'),
                ],
              );
            }
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Obx(() => ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return ArticleCardWidget(
                          bookmarksdata: bookmarkCtrl.bookmarksdata[index],
                        );
                      },
                      separatorBuilder: (_, index) {
                        return const Divider();
                      },
                      itemCount: bookmarkCtrl.bookmarksdata.length,
                    )),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _appbar() {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      title: text18Bold('Book Marks'),
      leading: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back_ios_new_outlined,
        ),
      ),
    );
  }
}
