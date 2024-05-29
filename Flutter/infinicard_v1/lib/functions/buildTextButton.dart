import 'package:flutter/material.dart';
import 'package:infinicard_v1/models/ICTextButton.dart';
import 'package:infinicard_v1/functions/buildFromXml.dart';
import 'package:infinicard_v1/functions/buildButtonStyle.dart';
import 'package:infinicard_v1/functions/buildText.dart';

import 'package:xml/xml.dart';

import 'helpers.dart';

ICTextButton getTextButton(XmlElement button, BuildContext context){
  var properties = button.getElement("properties");
  var propertiesList = properties != null ? properties.childElements : const Iterable.empty();

  var textButton = ICTextButton();

  for (var property in propertiesList) {
    var type = property.name.toString();
    switch (type) {
      case "child":
        textButton.setChild(getText(property.firstElementChild, context));
        break;
      case "onPressed":
        textButton.setAction(getAction(property));
        break;
      case "size":
        var size = getSize(property);
        textButton.setSize(heightArg:size[0], widthArg:size[1]);
      case "buttonStyle":
        textButton.setStyle(getButtonStyle(property));
      default:
        debugPrint("Tried to build unrecognized button property: $type");
    }}

  return textButton;
  
}

Widget buildTextButton(XmlElement button, BuildContext context){
  var textButton = getTextButton(button, context);
  var height = textButton.height;
  var width = textButton.width;

  return SizedBox(height: height, width: width, child: textButton.toFlutter(context));
}

Map getAction(XmlElement onPressedElement){
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
