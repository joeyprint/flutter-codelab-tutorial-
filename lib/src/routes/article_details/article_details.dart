import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Article Title')),
      body: Container(
        child: Text('This is article details page'),
      ),
    );
  }
}
