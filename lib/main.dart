import 'package:flutter/material.dart';
import 'package:flutter_demo/page/home_page/home_page.dart';
import 'package:flutter_demo/page/web_page/web_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        "home_page": (context) => HomePage(),
        "web_page": (context) => WebPage(
              url: ModalRoute.of(context).settings.arguments,
            ),
      },
    );
  }
}
