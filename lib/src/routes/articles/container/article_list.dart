import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_app_test/src/domains/articles/articles_repository.dart';
import 'package:flutter_app_test/src/domains/articles/models/article.dart';
import 'package:flutter_app_test/src/routes/article_details/article_details.dart';
import '../../../views/components/article_item/article_item.dart';

class ArticleList extends StatefulWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FutureBuilder<List>(
            future: fetchArticles(),
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                final List? articles = snapshot.data;

                return Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: articles?.length,
                    itemBuilder: (BuildContext context, int index) {
                      final article = Article.fromJson(articles![index]);

                      return ArticleItem(
                        imageUrl:
                            'https://picsum.photos/200/300', // Cannot get image url from fake.js
                        title: article.title,
                        description: article.description,
                        createdAt: DateFormat.yMMMMd()
                            .format(DateTime.parse(article.createdAt)),
                        onCardTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ArticleDetails(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              return Text('Loading Data');
            },
          ),
        ],
      ),
    );
  }
}
