import 'package:flutter/material.dart';

import 'package:flutter_app_test/src/routes/articles/container/article_list.dart';

class Articles extends StatelessWidget {
  static const String routeName = '/articles';
  const Articles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleList();
  }
}
