import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

import 'package:infinicard_v1/models/InfinicardRow.dart';
import 'package:infinicard_v1/functions/buildFromXml.dart';
import 'helpers.dart';

Widget? buildRow(XmlElement child){
  var params = Map();
  List<Widget> children = [];
  var rowChildren = child.getElement("Children");
  var rowChildList = rowChildren != null ? rowChildren.childElements : const Iterable.empty();
  for(var rowChild in rowChildList){
    var childElement = buildUIElement(rowChild);
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
  var row = children != [] ? InfinicardRow(params) : null;
  return row;
}