import 'package:constrained_scrollable_views/constrained_scrollable_views.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Constrained Scrollable Views Demo',
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ConstrainedScrollView(
              padding: const EdgeInsets.all(8),
              physics: const BouncingScrollPhysics(),
              constraintsBuilder: (constraints) => BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight,
              ),
              child: const Center(
                child: Text('ScrollView value'),
              ),
            ),
          ),
          Expanded(
            child: ScrollableColumn(
              padding: const EdgeInsets.all(8),
              physics: const BouncingScrollPhysics(),
              constraintsBuilder: (constraints) => BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              children: [
                for (var i = 0; i <= 100; i++)
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text('Column value: $i'),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ScrollableRow(
              padding: const EdgeInsets.all(8),
              physics: const BouncingScrollPhysics(),
              constraintsBuilder: (constraints) => BoxConstraints(
                minWidth: constraints.maxWidth,
              ),
              children: [
                for (var i = 0; i <= 100; i++)
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text('Row value: $i'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
