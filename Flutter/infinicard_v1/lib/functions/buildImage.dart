import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

import 'package:infinicard_v1/models/InfinicardImage.dart';
import 'helpers.dart';

Widget buildImage(XmlElement image) {
  var params = Map();
  var containerHeight = 0.0;
  var containerWidth = 0.0;
  var properties = image.getElement("Properties");
  var propertiesList = properties != null ? properties.childElements : const Iterable.empty();

  for (var property in propertiesList) {
    var type = property.name.toString();
    switch (type) {
      case "path":
        params['path'] = getString(property);
        break;
      case "altText":
        params['semanticLabel'] = getString(property);
        break;
      case "height":
        params['height'] = getHeight(property);
        containerHeight = params['height'];
        break;
      case "width":
        params['width'] = getWidth(property);
        containerWidth = params['width'];
        break;
      default:
        debugPrint("Tried to build unrecognized property: $type");
    }
  }

  return Container(
      height: containerHeight,
      width: containerWidth,
      child: InfinicardImage(params));
}
