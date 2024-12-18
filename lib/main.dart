import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Architecture Lab',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Architecture Lab'),
        ),
        body: Column(
          children: [
            Container(
                color: Colors.blue,
                height: 100,
                width: double.infinity,
                child: Center(
                    child: Text('Top Banner',
                        style: TextStyle(color: Colors.white)))),
            Expanded(
              child: Center(
                child:
                    Text('Main Content Area', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ));
  }
}
