import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

import "buildAppBar.dart";
import "buildTextButton.dart";
import "buildImage.dart";
import "buildText.dart";
import "buildRow.dart";
import "buildColumn.dart";

Map buildXML(String XML){
  final document = XmlDocument.parse(XML);
  final root = document.getElement("root");
  final elements = root?.childElements;

  var UI = Map();
  List<Widget> UIElements = [];

  for(var child in elements!){
    var childWidget = buildUIElement(child);
    if(childWidget!=null) UIElements.add(childWidget);
  }
  UI['children'] = UIElements;
  return UI;
}

Widget? buildUIElement(XmlElement child){
  var uiElement;
  var type = child.name.toString();
    switch (type){
      case "Bar":
        uiElement = buildBar(child);
        break;
      case "Image":
        uiElement = buildImage(child);
        break;
      case "TextButton":
        uiElement = buildTextButton(child);
        break;
      case "Text":
        uiElement = buildText(child);
        break;
      case "Row":
        uiElement = buildRow(child);
        break;
      case "Column":
        uiElement = buildColumn(child);
        break;
      default:
        debugPrint("Tried to build unrecognized type: $type");
    }
  return uiElement;
}

