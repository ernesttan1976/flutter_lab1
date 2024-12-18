// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

//Subcomponent that is static so it is defined as stateless
class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const Header({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(10),
      child: Text(
        "Footer Text",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 100;

  void darkenPage() {
    setState(() {
      if (counter < 900) {
        counter = counter + 100;
      }
    });
  }

  void lightenPage() {
    setState(() {
      if (counter > 100) {
        counter = counter - 100;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(title: "This is a static title in the header"),
        bottomNavigationBar: Footer(),
        body: Stack(
          children: [
            Container(color: Colors.blue[counter]),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            lightenPage();
                          },
                          child: Text("+ lighten")),
                      ElevatedButton(
                          onPressed: () {
                            darkenPage();
                          },
                          child: Text("- darken")),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.orange,
                      child: Text(
                        "This is a centered column",
                        style: TextStyle(fontSize: 18),
                      ))
                ])
          ],
        ));
  }
}

void main() {
  runApp(MyApp());
}
