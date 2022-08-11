import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../../../views/components/article_item/article_item.dart';

Future<List> fetchArticles() async {
  final response = await http.get(
      Uri.parse('https://5fb39fd2b6601200168f7a41.mockapi.io/api/articles'));
  if (response.statusCode == 200) {
    final List articleList = jsonDecode(response.body) as List<dynamic>;
    return articleList;
  } else {
    throw Exception('Failed to load articles');
  }
}

class Article {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final int createdAt;
  final int updatedAt;

  const Article({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

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
                        imageUrl: 'https://picsum.photos/200/300',
                        // imageUrl: article.imageUrl,
                        title: '${index + 1} ${article.title}',
                        description: article.description,
                        createdAt: '${DateTime.now()}',
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
