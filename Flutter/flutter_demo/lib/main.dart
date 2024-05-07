import 'package:flutter/material.dart';
import 'models/bar.dart';
import 'models/textelement.dart';
import 'models/group.dart';
import 'models/img.dart';
import 'models/cards.dart';
import 'models/functions.dart';
import 'models/UIStack.dart';
import 'models/xmlUI.dart';
import 'dart:convert';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  var uiXML = getXML();

  @override
  Widget build(BuildContext context) {
    var UIElements = buildXML(uiXML);
    var UI = UIStack(UIElements);

    return MaterialApp(home: UI);
  }
}

//reflection 