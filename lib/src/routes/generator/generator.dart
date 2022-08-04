import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Generator extends StatefulWidget {
  const Generator({Key? key}) : super(key: key);
  static const String routeName = '/generator';

  @override
  State<Generator> createState() => _GeneratorState();
}

class _GeneratorState extends State<Generator> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _subtitleFont = const TextStyle(fontSize: 18);

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _subtitleFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(
              children: divided,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.list),
      //       onPressed: _pushSaved,
      //       tooltip: 'Saved Suggestions',
      //     ),
      //   ],
      // ),
      child: Column(
        children: [
          ElevatedButton(
            child: const Text('Go to name generate page'),
            onPressed: _pushSaved,
          ),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
              itemBuilder: (context, i) {
                if (i.isOdd) return const Divider(height: 1);

                final index = i ~/ 2;
                if (index >= _suggestions.length) {
                  _suggestions.addAll(generateWordPairs().take(10));
                }
                final alreadySaved = _saved.contains(_suggestions[index]);

                return ListTile(
                  title: Text(
                    _suggestions[index].asPascalCase,
                    style: _subtitleFont,
                  ),
                  trailing: Icon(
                    alreadySaved ? Icons.favorite : Icons.favorite_border,
                    color: alreadySaved ? Colors.red : null,
                    semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  onTap: () {
                    setState(() {
                      if (alreadySaved) {
                        _saved.remove(_suggestions[index]);
                      } else {
                        _saved.add(_suggestions[index]);
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
