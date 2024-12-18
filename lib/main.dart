// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // Required for debugPaintSizeEnabled

void main() {
  runApp(MyApp());
}

ValueNotifier<bool> debugPaintSizeNotifier =
    ValueNotifier(debugPaintSizeEnabled);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: debugPaintSizeNotifier,
        builder: (context, isDebugPaintEnabled, child) {
          debugPaintSizeEnabled = isDebugPaintEnabled;
          return MaterialApp(
            title: 'Page Routing Demo',
            theme: ThemeData(primarySwatch: Colors.lightGreen),
            initialRoute: '/',
            routes: {
              '/': (context) => HomePage(),
              '/second': (context) => SecondPage(),
              '/third': (context) => ThirdPage(),
              '/listview': (context) => ListViewPage(),
            },
          );
        });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Home Page"),
        body: Center(
            child: Column(children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            child: Text('Go to Second Page'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
            child: Text('Go to Third Page'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/listview');
            },
            child: Text('Go to List View Page'),
          ),
        ])));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Second Page"),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back')),
        ));
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Third Page"),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back')),
        ));
  }
}

List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "List View Page"),
        body: Column(children: [
          // Center(
          //     child: SizedBox(
          //   width: 200,
          //   height: 300,
          //   child: dynamicListView,
          // )),
          Center(
              child: SizedBox(
            width: 200,
            height: 300,
            child: simpleListView,
          )),
          Center(
              child: SizedBox(
            width: 600,
            height: 100,
            child: horizontalListView,
          )), // horizontalListView,
        ]));
  }
}

ListView dynamicListView = ListView.builder(
    itemBuilder: (context, index) {
      return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0), //line spacing
          child: ListTile(
            title: Text(items[index], textAlign: TextAlign.left),
          ));
    },
    itemCount: items.length);

ListView simpleListView = ListView(
  children: items
      .map((item) => ListTile(
              title: Text(
            item,
            textAlign: TextAlign.left,
          )))
      .toList(),
);

ListView horizontalListView = ListView(
  scrollDirection: Axis.horizontal,
  children: items
      .map((item) => Container(
          width: 50,
          color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
              Random().nextInt(255), 1),
          child: Center(child: Text(item))))
      .toList(),
);

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title), actions: [
      IconButton(
        icon: ValueListenableBuilder<bool>(
            valueListenable: debugPaintSizeNotifier,
            builder: (context, isDebugPaintEnabled, child) {
              return Icon(isDebugPaintEnabled
                  ? Icons.visibility
                  : Icons.visibility_off);
            }),
        onPressed: () {
          debugPaintSizeNotifier.value = !debugPaintSizeNotifier.value;
        },
      )
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
