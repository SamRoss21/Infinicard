import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

import 'package:infinicard_v1/models/InfinicardColumn.dart';
import 'package:infinicard_v1/functions/buildFromXml.dart';
import 'helpers.dart';

Widget? buildColumn(XmlElement child){
  var params = Map();
  List<Widget> children = [];
  var columnChildren = child.getElement("Children");
  var columnChildList = columnChildren != null ? columnChildren.childElements : const Iterable.empty();
  for(var columnChild in columnChildList){
    var childElement = buildUIElement(columnChild);
    if(childElement != null) children.add(childElement);
  }
  params["children"] = children;

  var properties = child.getElement("Properties");
  var propertiesList = properties != null ? properties.childElements : const Iterable.empty();
  for(var property in propertiesList){
    var type = property.name.toString();
    switch (type) {
      case "mainAxisAlignment":
        params["mainAxisAlignment"] = getMainAxisAlignment(property);
        break;
      case "mainAxisSize":
        params["mainAxisSize"] = getMainAxisSize(property);
        break;
      case "crossAxisAlignment":
        params["crossAxisAlignment"] = getCrossAxisAlignment(property);
        break;
      default:
    }
  }
  var column = children != [] ? InfinicardColumn(params) : null;
  return column;
}