import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

import "buildAppBar.dart";
import "buildTextButton.dart";
import "buildImage.dart";
import "buildText.dart";

Map buildXML(String XML){
  final document = XmlDocument.parse(XML);
  final root = document.getElement("root");
  final elements = root?.childElements;

  var UI = Map();
  List<Widget> UIElements = [];

  for(var child in elements!){
    var type = child.name.toString();
    if(type=="Bar"){
      var bar = buildBar(child);
      UIElements.add(bar);
    }
    if(type=="Image"){
      var image = buildImage(child);
      UIElements.add(image);
    }
    if(type=="TextButton"){
      var button = buildTextButton(child);
      UIElements.add(button);
    }
    if(type=="Text"){
      var text = buildText(child);
      UIElements.add(text);
    }
  }
  UI['children'] = UIElements;
  return UI;
}