import 'package:flutter/material.dart';
import 'package:infinicard_v1/models/InfinicardTextButton.dart';
import 'package:xml/xml.dart';

import 'helpers.dart';

Widget buildTextButton(XmlElement button){
  var params = Map();
  var containerHeight = 30.0;
  var containerWidth = 100.0;

  var properties = button.getElement("Properties");
  var propertiesList = properties != null ? properties.childElements : const Iterable.empty();

  for (var property in propertiesList) {
    var type = property.name.toString();
    switch (type) {
      case "height":
        params['height'] = getHeight(property);
        break;
      case "width":
        params['width'] = getWidth(property);
        break;
      case "label":
        params['child'] = getText(property, TextStyle());
        break;
      case "onPressed":
        params['onPressed'] = getOnPressed(property);
        break;
      case "textStyle":
        params['textStyle'] = getTextStyle(property);
        break;
      case "buttonStyle":
        var styleList = property.childElements; 
        for(var style in styleList){
          var styleType = style.name.toString();
          switch(styleType){
            case "backgroundColor":
              params["backgroundColor"] = getColor(style);
              break;
            case "foregroundColor":
              params['foregroundColor'] = getColor(style);
              break;
            default:
              debugPrint("Tried to build unrecognized button style: $styleType");
          }
        }
        break;
      default:
        debugPrint("Tried to build unrecognized button property: $type");
    }}

  return Container(height:containerHeight, width:containerWidth, child:InfinicardTextButton(params));
  
}

Map getOnPressed(XmlElement onPressedElement){
  var action = Map();
  action['type'] = null;
  action['target'] = null;
  var typeElement = onPressedElement.getElement('type');
  if(typeElement!=null){
    var type = typeElement.innerText.toString();
    if(type=="link"){
      var targetElement = onPressedElement.getElement('target');
      if(targetElement!=null){
        var target = targetElement.innerText.toString();
        action['type'] = 'link';
        action['target'] = target;
      }
    }
  }
  return action;
}
