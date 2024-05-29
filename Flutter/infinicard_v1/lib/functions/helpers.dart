import 'package:flutter/material.dart';
import 'package:infinicard_v1/functions/buildFromXml.dart';
import 'package:infinicard_v1/models/ICColor.dart';
import 'package:xml/xml.dart';
import 'package:infinicard_v1/colors.dart';
import 'package:infinicard_v1/models/ICTextStyle.dart';
import 'package:infinicard_v1/models/ICObject.dart';

// Color getColor(XmlElement colorElement){
//   String colorString = colorElement.innerText.toString().toLowerCase().replaceAll(' ', '');
//   RegExp hexColor = RegExp(r'^0x([0-9a-fA-F]{8})$');

//   bool hexMatch = hexColor.hasMatch(colorString);
//   Color color = Colors.transparent;
//   switch(hexMatch){
//     case true:
//       color = Color(int.parse(colorString));
//       break;
//     case false:
//       color = supportedColors.containsKey(colorString) ? Color(int.parse(supportedColors[colorString]!)) : Colors.transparent;
//       break;
//   }
    
//   return color;
// }

double? getFontSize(XmlElement sizeElement){
  final sizeVal = sizeElement.innerText.toString();
  var size = sizeVal!="" ? double.parse(sizeVal) : null;
  return size;
}

FontWeight getFontWeight(XmlElement weightElement){
  var weightName = weightElement.innerText.toString();
  FontWeight weight;
  switch(weightName.toLowerCase()){
    case "fontweight.w100" || "thin":
      weight = FontWeight.w100;
      break;
    case "fontweight.w200" || "extra-light":
      weight = FontWeight.w200;
      break;
    case "fontweight.w300" || "light":
      weight = FontWeight.w300;
      break;
    case "fontweight.w400" || "normal":
      weight = FontWeight.w400;
      break;
    case "fontweight.w500" || "medium":
      weight = FontWeight.w500;
      break;
    case "fontweight.w600" || "semi-bold":
      weight = FontWeight.w600;
      break;
    case "fontweight.w700" || "bold":
      weight = FontWeight.w700;
      break;
    case "fontweight.w800" || "extra-bold":
      weight = FontWeight.w800;
      break;
    case "fontweight.w900" || "black":
      weight = FontWeight.w900;
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


ICTextStyle getTextStyle(XmlElement styleElement){
  var style = ICTextStyle();
  var properties = styleElement.childElements;
  for(var property in properties){
    var type = property.name.toString();
    switch(type){
      case "color": 
        style.color(ICColor(property.innerText));
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
  return style;
}

bool? getCenter(XmlElement centerElement){
  var centerVal = centerElement.innerText.toString();
  var center = centerVal != "" ? bool.parse(centerElement.innerText.toString()) : null;
  return center;
}

double? getHeight(XmlElement heightElement){
  var height = heightElement.innerText.toString();
  var heightVal = height!="" ? double.parse(height) : null;
  return heightVal;
}

double? getWidth(XmlElement widthElement){
  var width = widthElement.innerText.toString();
  var widthVal = width!="" ? double.parse(width) : null;
  return widthVal;
}

List<double?> getSize(XmlElement sizeElement){
  var heightElement = sizeElement.getElement("height");
  var height = heightElement?.innerText.toString();
  var heightVal = height!="" && height!=null? double.parse(height) : null;

  var widthElement = sizeElement.getElement("width");
  var width = widthElement?.innerText.toString();
  var widthVal = width!="" && width!=null ? double.parse(width) : null;
  
  return [heightVal, widthVal];
}

String getString(XmlElement? string){
  var value = string != null ? string.innerText.toString() : "";
  return value;
}

String getImgPath(XmlElement? path){
  var value = path != null ? path.innerText.toString() : "error.png";
  return value;
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
    case "center" || "MainAxisAlignment.center":
      align = MainAxisAlignment.center;
      break;
    case "start" || "MainAxisAlignment.start":
      align = MainAxisAlignment.start;
      break;
    case "end" || "MainAxisAlignment.end":
      align = MainAxisAlignment.end;
      break;
    case "spaceBetween" || "MainAxisAlignment.spaceBetween":
      align = MainAxisAlignment.spaceBetween;
      break;
    case "spaceAround" || "MainAxisAlignment.spaceAround":
      align = MainAxisAlignment.spaceAround;
      break;
    case "spaceEvenly" || "MainAxisAlignment.spaceEvenly":
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
    case "min" || "MainAxisSize.min":
      align = MainAxisSize.min;
      break;
    case "max" || "MainAxisSize.max":
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
    case "center" || "CrossAxisAlignment.center":
      align = CrossAxisAlignment.center;
      break;
    case "start" || "CrossAxisAlignment.start":
      align = CrossAxisAlignment.start;
      break;
    case "end" || "CrossAxisAlignment.end":
      align = CrossAxisAlignment.end;
      break;
    case "stretch" || "CrossAxisAlignment.stretch":
      align = CrossAxisAlignment.stretch;
      break;
    case "baseline" || "CrossAxisAlignment.baseline":
      align = CrossAxisAlignment.baseline;
      break;
    default:
      align = CrossAxisAlignment.center;
  }
  return align;
}

List<ICObject> getActions(XmlElement action, context){
  var actionsList = action.childElements;
  List<ICObject> actions = [];

  for(var action in actionsList){
    actions.add(getUIElement(action, context));
  }
  return actions;
}