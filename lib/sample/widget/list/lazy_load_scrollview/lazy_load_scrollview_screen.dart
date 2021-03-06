import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_word/lib/common/const/dimen_constants.dart';
import 'package:hello_word/lib/common/const/string_constants.dart';
import 'package:hello_word/lib/core/base_stateful_state.dart';
import 'package:hello_word/lib/util/log_dog_utils.dart';
import 'package:hello_word/lib/util/uI_utils.dart';
import 'package:hello_word/lib/util/url_launcher_utils.dart';
import 'package:hello_word/sample/widget/list/lazy_load_scrollview/demo_item.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class LazyLoadScrollViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LazyLoadScrollViewScreenState();
  }
}

class _LazyLoadScrollViewScreenState
    extends BaseStatefulState<LazyLoadScrollViewScreen> {
  List<int> verticalData = [];
  List<int> horizontalData = [];

  final int increment = 10;

  bool isLoadingVertical = false;
  bool isLoadingHorizontal = false;

  Future _loadMoreVertical() async {
    Dog.d("_loadMoreVertical");
    setState(() {
      isLoadingVertical = true;
    });

    // Add in an artificial delay
    await new Future.delayed(const Duration(seconds: 1));

    verticalData.addAll(
        List.generate(increment, (index) => verticalData.length + index));

    setState(() {
      isLoadingVertical = false;
    });
  }

  Future _loadMoreHorizontal() async {
    Dog.d("_loadMoreHorizontal");
    setState(() {
      isLoadingHorizontal = true;
    });

    // Add in an artificial delay
    await new Future.delayed(const Duration(seconds: 1));

    horizontalData.addAll(
        List.generate(increment, (index) => horizontalData.length + index));

    setState(() {
      isLoadingHorizontal = false;
    });
  }

  @override
  void initState() {
    _loadMoreVertical();
    _loadMoreHorizontal();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIUtils.getAppBar(
        "LazyLoadScrollViewScreen",
            () {
          Get.back();
        },
            () {
          UrlLauncherUtils.launchInWebViewWithJavaScript(
              "https://pub.dev/packages/lazy_load_scrollview");
        },
      ),
      body: LazyLoadScrollView(
        isLoading: isLoadingVertical,
        onEndOfPage: () => _loadMoreVertical(),
        child: CupertinoScrollbar(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(
                    DimenConstants.marginPaddingMedium),
                child: UIUtils.getText("Nested horizontal ListView"),
              ),
              Container(
                height: 180,
                child: LazyLoadScrollView(
                  isLoading: isLoadingHorizontal,
                  scrollDirection: Axis.horizontal,
                  onEndOfPage: () => _loadMoreHorizontal(),
                  child: Scrollbar(
                    child: ListView.builder(
                      itemCount: horizontalData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, position) {
                        return DemoItem(position);
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                    DimenConstants.marginPaddingMedium),
                child: UIUtils.getText("Vertical ListView"),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: verticalData.length,
                itemBuilder: (context, position) {
                  return DemoItem(position);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
