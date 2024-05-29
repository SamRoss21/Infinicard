import 'package:flutter/material.dart';
import 'package:infinicard_v1/models/ICColor.dart';
import 'package:xml/xml.dart';

class ICTextTheme {
  TextTheme theme = Typography.blackCupertino;

  String? font;
  ICColor? color;

  ICTextTheme();

  void setFontFamily(String? fontFamily){
    font = fontFamily;
  }

  void setColor(ICColor? color){
    color = color;
  }

  TextTheme toFlutter() {
    return theme.apply(fontFamily: font, bodyColor: color?.toFlutter()); 
  }

  XmlElement toXml({bool verbose = false}) {
    final element = XmlElement(XmlName("textTheme"),[],[XmlText("")]);
    final propertiesElement = XmlElement(XmlName("properties"),[],[XmlText("")]);

    final fontElement = font != null ? XmlElement(XmlName("fontFamily"),[],[XmlText(font as String)]) : XmlElement(XmlName("fontFamily"),[],[XmlText("")]);
    final colorElement = color != null ? XmlElement(XmlName("color"),[],[XmlText(color.toString())]) : XmlElement(XmlName("color"),[],[XmlText("")]);
    
    if(verbose==false){
      if(font!=null){propertiesElement.children.add(fontElement);}
      if(color!=null){propertiesElement.children.add(colorElement);}
      if(propertiesElement.children.isNotEmpty){element.children.add(propertiesElement);}
    } else {
      propertiesElement.children.add(fontElement);
      propertiesElement.children.add(colorElement);
      element.children.add(propertiesElement);
    }
    
    return element;
  }
}
