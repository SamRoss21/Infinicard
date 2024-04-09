import 'package:flutter/material.dart';
import 'package:infinicard_v1/models/InfinicardTextButton.dart';
import 'package:xml/xml.dart';

import 'getTextStyle.dart';

Widget buildTextButton(XmlElement button){
  var params = Map();
  var containerHeight = 30.0;
  var containerWidth = 100.0;

  var properties = button.getElement("Properties");
  if(properties!=null){
    var height = properties.getElement("height");
    if(height!=null){
      containerHeight = double.parse(height.innerText.toString());
      params["height"] = containerHeight;
    }
    
    var width = properties.getElement("width");
    if(width!=null){
      containerWidth = double.parse(width.innerText.toString());
      params["width"] = containerWidth;
    }

    var label = properties.getElement("Label");
    if(label!=null){
      params['child'] = getLabel(label);
    }

    var textStyle = properties.getElement("TextStyle");
    if(textStyle!=null){
      params['textStyle'] = buildTextStyle(textStyle);
    }

    var buttonStyle = properties.getElement("ButtonStyle");
    if(buttonStyle!=null){
      var backgroundColor = buttonStyle.getElement('backgroundColor');
      if(backgroundColor!=null){
        params["backgroundColor"] = getColor(backgroundColor);
      }
      var foregroundColor = buttonStyle.getElement('foregroundColor');
      if(foregroundColor!=null){
        params["foregroundColor"] = getColor(foregroundColor);
      }
    }

    var onPressedElement = properties.getElement("onPressed");
    if(onPressedElement!=null){
      params['onPressed'] = getOnPressed(onPressedElement);
    }
  }

  return Container(height:containerHeight, width:containerWidth, child:InfinicardTextButton(params));
  
}

Widget getLabel(XmlElement labelElement){
  var label = labelElement.innerText.toString();
  return Text(label);
}

Color getColor(XmlElement col){
  var color = int.parse(col.innerText.toString());
  return Color(color);
}

TextStyle buildTextStyle(XmlElement textStyle){
  var params = Map();

  var colorElement = textStyle.getElement("color");
  if(colorElement!=null){
    var color = int.parse(colorElement.innerText.toString());
    params["color"] = Color(color);
  }

  var weightElement = textStyle.getElement("fontWeight");
  if(weightElement!=null){
    var weight = weightElement.innerText.toString();
    if(weight=="bold"){
      params["fontWeight"] = FontWeight.bold;
    }
    else{
      params["fontWeight"] = FontWeight.normal;
    }
  }

  var sizeElement = textStyle.getElement("fontSize");
  if(sizeElement!=null){
    var size = double.parse(sizeElement.innerText.toString());
    params["fontSize"] = size;
  }

  var fontElement = textStyle.getElement("fontFamily");
  if(fontElement!=null){
    var fontFamily = fontElement.innerText.toString();
    params["fontFamily"] = fontFamily;
  }

  var style = getTextStyle(params);
  return style;
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
