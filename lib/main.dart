import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'cupertino/home_page.dart';
import 'material/hom_page.dart';

void main() {
  if (false) {
    return runApp(const MyMaterialApp());
  } else {
    return runApp(const MyCupertinoApp());
  }

}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter工程',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const MaterialHomePage(title: '首页'),
    );
  }
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter工程',
      home: CupertinoHomePage(title: '首页'),
    );
  }
}
