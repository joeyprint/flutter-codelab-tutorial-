import 'package:flutter/material.dart';

import 'package:flutter_app_test/src/views/components/article_item/article_item.dart';

class Articles extends StatelessWidget {
  static const String routeName = '/articles';
  const Articles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < 10; i++)
              const ArticleItem(
                imageUrl: 'https://picsum.photos/200/300',
                title: 'Lorem Ipsum',
                description: 'Lorem description',
                createdAt: '18 Feb 2022',
              )
          ],
        ),
      ),
    );
  }
}
