import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

import 'package:infinicard_v1/models/InfinicardText.dart';
import 'getTextStyle.dart';

Widget buildText(XmlElement text){
  var params = Map();
  var properties = text.getElement("Properties");
  var data = text.getElement("data");
  var containerHeight = 60.0;
  var containerWidth = 500.0;

  if(data!=null){
    var textData = data.innerText.toString();
    params['data'] = textData;
  }
  if(properties!=null){
    var style = properties.getElement("style");
    if(style!=null){
      params["style"] = getStyle(style);
    }

    var textAlign = properties.getElement('textAlign');
    if(textAlign!=null){
      params['textAlign'] = getTextAlign(textAlign);
    }

  }

  return Container(height:containerHeight, width:containerWidth, child:InfinicardText(params));
  
}

TextStyle getStyle(XmlElement style){
  var params = Map();

  var colorElement = style.getElement("color");
  if(colorElement!=null){
    var color = int.parse(colorElement.innerText.toString());
    params["color"] = Color(color);
  }

  var weightElement = style.getElement("fontWeight");
  if(weightElement!=null){
    var weight = weightElement.innerText.toString();
    if(weight=="bold"){
      params["fontWeight"] = FontWeight.bold;
    }
    else{
      params["fontWeight"] = FontWeight.normal;
    }
  }

  var sizeElement = style.getElement("fontSize");
  if(sizeElement!=null){
    var size = double.parse(sizeElement.innerText.toString());
    params["fontSize"] = size;
  }

  var fontElement = style.getElement("fontFamily");
  if(fontElement!=null){
    var fontFamily = fontElement.innerText.toString();
    params["fontFamily"] = fontFamily;
  }

  var textStyle = getTextStyle(params);
  return textStyle;

}

TextAlign getTextAlign(XmlElement textAlignElement){
  var align = textAlignElement.innerText.toString();
  if(align == "right"){
    return TextAlign.right;
  }else if(align == "left"){
    return TextAlign.left;
  }else if(align == "center"){
    return TextAlign.center;
  }else if(align == "justify"){
    return TextAlign.justify;
  }else if(align == "start"){
    return TextAlign.start;
  }else if(align == "end"){
    return TextAlign.end;
  }else{
    return TextAlign.left;
  }
}