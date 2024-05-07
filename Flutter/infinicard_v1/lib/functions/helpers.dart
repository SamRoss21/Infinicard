import 'package:flutter/material.dart';
import 'package:xml/xml.dart';
import 'package:infinicard_v1/colors.dart';
import 'package:infinicard_v1/models/InfinicardTextStyle.dart';

Color getColor(XmlElement colorElement){
  String colorString = colorElement.innerText.toString().toLowerCase().replaceAll(' ', '');
  RegExp hexColor = RegExp(r'^0x([0-9a-fA-F]{8})$');

  bool hexMatch = hexColor.hasMatch(colorString);
  Color color = Colors.transparent;
  switch(hexMatch){
    case true:
      color = Color(int.parse(colorString));
      break;
    case false:
      color = supportedColors.containsKey(colorString) ? Color(int.parse(supportedColors[colorString]!)) : Colors.transparent;
      break;
  }
    
  return color;
}

double getFontSize(XmlElement sizeElement){
  var size = double.parse(sizeElement.innerText.toString());
  return size;
}

FontWeight getFontWeight(XmlElement weightElement){
  var weightName = weightElement.innerText.toString();
  FontWeight weight;
  switch(weightName){
    case "normal":
      weight = FontWeight.normal;
      break;
    case "bold":
      weight = FontWeight.bold;
      break;
    default:
      weight = FontWeight.normal;
  }
  return weight;
}

String getFontFamily(XmlElement fontElement){
  var fontFamily = fontElement.innerText.toString();
  return fontFamily;
}


TextStyle getTextStyle(XmlElement styleElement){
  var style = InfinicardTextStyle();
  var properties = styleElement.childElements;
  for(var property in properties){
    var type = property.name.toString();
    switch(type){
      case "color": 
        style.color(getColor(property));
        break;
      case "fontSize":
        style.fontSize(getFontSize(property));
        break;
      case "fontWeight":
        style.fontWeight(getFontWeight(property));
        break;
      case "fontFamily":
        style.fontFamily(getFontFamily(property));
        break;
      default:
        debugPrint("Tried to build unrecognized text style: $type");
    }
  }
  return style.style();
}

Map getButtonStyle(XmlElement styleElement){
  var params = Map();
  var properties = styleElement.childElements;
  for(var property in properties){
    var type = property.name.toString();
    switch(type){
      case "backgroundColor": 
        params['backgroundColor'] = getColor(property);
        break;
      case "foregroundColor": 
        params['backgroundColor'] = getColor(property);
        break;
      default:
        debugPrint("Tried to build unrecognized button style type: $type");
    }
  }
  return params;
}

Text getText(XmlElement textElement, TextStyle? textStyle){
  var string = textElement.innerText.toString();
  var text = string ?? "NoTextError";

  return Text(text);
}

bool getCenter(XmlElement centerElement){
  var center = bool.parse(centerElement.innerText.toString());
  return center;
}

double getHeight(XmlElement heightElement){
  var height = double.parse(heightElement.innerText.toString());
  return height;
}

double getWidth(XmlElement widthElement){
  var height = double.parse(widthElement.innerText.toString());
  return height;
}

String getString(XmlElement string){
  return string.innerText.toString();
}

TextAlign getTextAlign(XmlElement textAlign){
  var alignValue = textAlign.innerText.toString();
  TextAlign align;
  switch(alignValue){
    case "right":
      align = TextAlign.right;
      break;
    case "left":
      align = TextAlign.left;
      break;
    case "center":
      align = TextAlign.center;
      break;
    case "justify":
      align = TextAlign.justify;
      break;
    case "start":
      align = TextAlign.start;
      break;
    case "end":
      align = TextAlign.end;
      break;
    default:
      align = TextAlign.left;
  }
  return align;
}

MainAxisAlignment getMainAxisAlignment(XmlElement alignment){
  var alignValue = alignment.innerText.toString();
  MainAxisAlignment align;
  switch(alignValue){
    case "center":
      align = MainAxisAlignment.center;
      break;
    case "start":
      align = MainAxisAlignment.start;
      break;
    case "end":
      align = MainAxisAlignment.end;
      break;
    case "spaceBetween":
      align = MainAxisAlignment.spaceBetween;
      break;
    case "spaceAround":
      align = MainAxisAlignment.spaceAround;
      break;
    case "spaceEvenly":
      align = MainAxisAlignment.spaceEvenly;
      break;
    default:
      align = MainAxisAlignment.start;
  }
  return align;
}

MainAxisSize getMainAxisSize(XmlElement alignment){
  var alignValue = alignment.innerText.toString();
  MainAxisSize align;
  switch(alignValue){
    case "min":
      align = MainAxisSize.min;
      break;
    case "max":
      align = MainAxisSize.max;
      break;
    default:
      align = MainAxisSize.max;
  }
  return align;
}

CrossAxisAlignment getCrossAxisAlignment(XmlElement alignment){
  var alignValue = alignment.innerText.toString();
  CrossAxisAlignment align;
  switch(alignValue){
    case "center":
      align = CrossAxisAlignment.center;
      break;
    case "start":
      align = CrossAxisAlignment.start;
      break;
    case "end":
      align = CrossAxisAlignment.end;
      break;
    case "stretch":
      align = CrossAxisAlignment.stretch;
      break;
    case "baseline":
      align = CrossAxisAlignment.baseline;
      break;
    default:
      align = CrossAxisAlignment.center;
  }
  return align;
}