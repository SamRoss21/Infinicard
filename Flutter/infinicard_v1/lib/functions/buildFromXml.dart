import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

import "buildAppBar.dart";
import "buildTextButton.dart";
import "buildImage.dart";
import "buildText.dart";
import "buildRow.dart";
import "buildColumn.dart";

import "dart:io";
import "package:infinicard_v1/models/ICObject.dart";
import "package:infinicard_v1/models/ICText.dart";

Widget buildXML(String XML, BuildContext context, {String? outPath}){
  final document = XmlDocument.parse(XML);
  final root = document.getElement("root");
  final ui = root?.getElement("ui");
  final elements = ui?.childElements;

  List<ICObject> uiElements = [];
  if(elements!=null){uiElements = getUIElements(elements, context);};

  var uiWidgets = uiElements.map((element) => element.toFlutter(context)).toList();

  if(outPath!=null){
    writeXML(outPath, uiElements);
  }

  return Column(crossAxisAlignment: CrossAxisAlignment.start, children:uiWidgets);
}

List<ICObject> getUIElements(Iterable<XmlElement> elements, BuildContext context){
  List<ICObject> uiElements = [];

  for(var child in elements){
    uiElements.add(getUIElement(child, context));
  }
  return uiElements;
}

Widget buildUIElement(XmlElement child, BuildContext context){
  var uiElement = getUIElement(child, context);
  return SizedBox(child:uiElement.toFlutter(context)); //TO DO: enforce size constraints
}

ICObject getUIElement(XmlElement child, BuildContext context){
  ICObject uiElement;
  final type = child.name.toString();
  switch (type){
    case "bar":
      uiElement = getBar(child, context);
      break;
    case "image":
      uiElement = getImage(child, context);
      break;
    case "textButton":
      uiElement = getTextButton(child, context);
      break;
    case "text":
      uiElement = getText(child, context);
      break;
    case "row":
      uiElement = getRow(child, context);
      break;
    case "column":
      uiElement = getColumn(child, context);
      break;
    default:
      uiElement = ICText("MissingWidget");
      debugPrint("Tried to build unrecognized type: $type");
  }
  return uiElement;
}


void writeXML(String path, List<ICObject> uiElements){
  var xmlOut = XmlElement(XmlName("root"));
  var uiOut = XmlElement(XmlName("ui"));
  for(var element in uiElements){
    uiOut.children.add(element.toXml(verbose:true));
  }
  xmlOut.children.add(uiOut);
  File(path).createSync(exclusive: false);
  final File file = File(path);
  file.writeAsStringSync(xmlOut.toXmlString(pretty:true));
}