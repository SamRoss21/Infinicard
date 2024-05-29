import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

import 'package:infinicard_v1/models/ICColor.dart';
class ICTextStyle{
  TextStyle? textStyle;
  ICColor? textColor;

  ICTextStyle({this.textStyle});

  void color(ICColor color){
    textColor=color;
    textStyle = textStyle != null ? textStyle?.copyWith(color:color.toFlutter()) : const TextStyle().copyWith(color: color.toFlutter());
  }

  void fontSize(double? fontSize){
    textStyle = textStyle != null ? textStyle?.copyWith(fontSize:fontSize) : const TextStyle().copyWith(fontSize: fontSize);
  }

  void fontWeight(FontWeight? fontWeight){
    textStyle = textStyle != null ? textStyle?.copyWith(fontWeight:fontWeight) : const TextStyle().copyWith(fontWeight: fontWeight);
  }

  void fontFamily(String? fontFamily){
    textStyle = textStyle != null ? textStyle?.copyWith(fontFamily:fontFamily) : const TextStyle().copyWith(fontFamily: fontFamily);
  }

  TextStyle? toFlutter({BuildContext? context}){
    return textStyle?.copyWith(inherit: true);
  }

  XmlElement toXml({bool verbose=false}){
    final element = XmlElement(XmlName('textStyle'), [], [XmlText("")]);

    if(textStyle != null){
      final style = textStyle as TextStyle;

      final colorElement = textColor != null ? XmlElement(XmlName("color"), [], [XmlText(textColor!.toColorString())]) : XmlElement(XmlName("color"),[],[XmlText("")]);
      final fontSizeElement = style.fontSize!=null ? XmlElement(XmlName("fontSize"), [], [XmlText(style.fontSize.toString())]) : XmlElement(XmlName("fontSize"),[],[XmlText("")]);
      final fontWeightElement = style.fontWeight!=null ? XmlElement(XmlName("fontWeight"), [], [XmlText(style.fontWeight.toString())]) : XmlElement(XmlName("fontWeight"),[],[XmlText("")]);
      final fontFamilyElement = style.fontFamily!=null ? XmlElement(XmlName("fontFamily"), [], [XmlText(style.fontFamily.toString())]) : XmlElement(XmlName("fontFamily"),[],[XmlText("")]);

      if(verbose==false){
        if(textColor!=null){element.children.add(colorElement);}
        if(style.fontSize!=null){element.children.add(fontSizeElement);}
        if(style.fontWeight!=null){element.children.add(fontWeightElement);}
        if(style.fontFamily!=null){element.children.add(fontFamilyElement);}
      } else {
        element.children.add(colorElement);
        element.children.add(fontSizeElement);
        element.children.add(fontWeightElement);
        element.children.add(fontFamilyElement);
      }
    }
    
    return element;
  }
}