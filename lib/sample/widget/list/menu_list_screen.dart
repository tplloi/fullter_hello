import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_word/lib/common/const/dimen_constants.dart';
import 'package:hello_word/lib/util/uI_utils.dart';
import 'package:hello_word/sample/widget/list/contact_page_screen/contact_page_screen.dart';
import 'package:hello_word/sample/widget/list/draggable_scrollbar_demo/draggable_scrollbar_demo_screen.dart';
import 'package:hello_word/sample/widget/list/flutter_sticky_header/flutter_sticky_header_screen.dart';
import 'package:hello_word/sample/widget/list/header_body_footer/header_body_footer_screen.dart';
import 'package:hello_word/sample/widget/list/lazy_load_scrollview/lazy_load_scrollview_screen.dart';
import 'package:hello_word/sample/widget/list/list_body_widget/list_body_screen.dart';
import 'package:hello_word/sample/widget/list/list_random_words/random_words_screen.dart';
import 'package:hello_word/sample/widget/list/list_search/list_view_search_screen.dart';
import 'package:hello_word/sample/widget/list/list_title_widget/list_tile_screen.dart';
import 'package:hello_word/sample/widget/list/load_more/list_view_load_more_screen.dart';
import 'package:hello_word/sample/widget/list/pull_to_refresh/pull_to_refresh_screen.dart';

class MenuListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIUtils.getAppBar(
        "MenuListScreen",
        () {
          Get.back();
        },
        null,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(DimenConstants.marginPaddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            UIUtils.getButton(
              "ContactPageScreen",
              () {
                Get.to(ContactPageScreen());
              },
            ),
            UIUtils.getButton(
              "DraggableScrollBarDemo",
              () {
                Get.to(DraggableScrollBarDemo());
              },
            ),
            UIUtils.getButton(
              "FlutterStickyHeaderScreen",
                  () {
                Get.to(FlutterStickyHeaderScreen());
              },
            ),
            UIUtils.getButton(
              "HeaderBodyFooterScreen",
                  () {
                Get.to(HeaderBodyFooterScreen());
              },
            ),
            UIUtils.getButton(
              "RandomWordsScreen",
              () {
                Get.to(RandomWordsScreen());
              },
            ),
            UIUtils.getButton(
              "ListViewSearchScreen",
              () {
                Get.to(ListViewSearchScreen());
              },
            ),
            UIUtils.getButton(
              "LazyLoadScrollViewScreen",
              () {
                Get.to(LazyLoadScrollViewScreen());
              },
            ),
            UIUtils.getButton(
              "ListBodyScreen",
                  () {
                Get.to(ListBodyScreen());
              },
            ),
            UIUtils.getButton(
              "ListTileScreen",
              () {
                Get.to(ListTileScreen());
              },
            ),
            UIUtils.getButton(
              "ListViewLoadMoreScreen",
              () {
                Get.to(ListViewLoadMoreScreen());
              },
            ),
            UIUtils.getButton(
              "PullToRefreshScreen",
                  () {
                Get.to(PullToRefreshScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
