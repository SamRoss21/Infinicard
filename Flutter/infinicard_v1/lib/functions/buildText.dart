import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

import 'package:infinicard_v1/models/InfinicardText.dart';
import 'helpers.dart';

Widget buildText(XmlElement text) {
  var params = Map();
  var properties = text.getElement("Properties");
  var data = text.getElement("data");
  var containerHeight = 60.0;
  var containerWidth = 500.0;

  params['data'] = data != null ? getString(data) : null;

  var propertiesList = properties != null ? properties.childElements : const Iterable.empty();
  for (var property in propertiesList) {
    var type = property.name.toString();
    switch (type) {
      case "textStyle":
        params["style"] = getTextStyle(property);
        break;
      case "textAlign":
        params['textAlign'] = getTextAlign(property);
        break;
      default:
        debugPrint("Tried to build unrecognized type: $type");
    }
  }
  return Container(
      height: containerHeight,
      width: containerWidth,
      child: InfinicardText(params));
}
