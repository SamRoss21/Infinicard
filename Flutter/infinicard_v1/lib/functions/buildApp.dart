import 'package:flutter/material.dart';
import 'package:infinicard_v1/functions/buildFromXml.dart';
import 'package:infinicard_v1/functions/buildTheme.dart';
import 'package:infinicard_v1/models/ICThemeData.dart';

Widget infinicardApp(String xmlString) {
  ICThemeData theme = getTheme(xmlString);
  return MaterialApp(
    theme: theme.toFlutter(),
    home: Scaffold(
      body: Builder(
        builder: (context) {
          return buildXML(xmlString, context);
        },
      ),
    ),
  );
}
