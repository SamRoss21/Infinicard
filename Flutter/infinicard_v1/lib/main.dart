import 'package:flutter/material.dart';

import 'spec.dart';

import 'functions/buildFromXml.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var uiXML = getXML();
    var UIElements = buildXML(uiXML);
    var UI = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: UIElements["children"]);

    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyle(color: Colors.yellow, fontFamily: "Roboto", fontSize: 20),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
      ),
      home: Builder(builder: (context) {
        return UI;
      }),
    );
  }
}
