import 'package:flutter/material.dart';
import 'package:xml/xml.dart';
import 'bar.dart';

Map buildXML(String XML){
  final document = XmlDocument.parse(XML);
  final root = document.getElement("root");
  final elements = root?.childElements;

  var UI = Map();
  List<Widget> UIElements = [];

  for(var child in elements!){
    var type = child.name.toString();
    if(type=="Bar"){
      var bar = buildBar(child);
      UIElements.add(bar);

    }

  }
  UI['children'] = UIElements;
  return UI;
}

Widget buildBar(XmlElement bar){
  var params = Map();
  var properties = bar.getElement("Properties");

  if(properties!=null){
    for(var param in properties.childElements){
      var type = param.name.toString();
      if(type == "backgroundColor"){
        params[type] = Color(int.parse(param.innerText.toString()));
      }else{
        params[type] = Text(param.innerText.toString());
      }
      
    }

  return Bar(params);

  }else{
    return Bar(Map());
  }
  
}