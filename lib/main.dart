import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/controller/news_data.dart';
import 'package:provider_api/view/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        //creating an instance of the class
        create: (context) => Newsdata(),
        builder: (context, child) {
          return HomeScreen();
        },
      ),
    );
  }
}
