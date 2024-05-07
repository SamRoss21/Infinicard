import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

import 'package:infinicard_v1/models/InfinicardAppBar.dart';
import 'package:infinicard_v1/functions/buildTextButton.dart';
import 'helpers.dart';

Widget buildBar(XmlElement bar){
  var params = Map();
  var properties = bar.getElement("Properties");
  var propertiesList = properties != null ? properties.childElements : const Iterable.empty();

  var containerHeight = 0.0;

  //AppBar Properties
  for(var property in propertiesList){
    var type = property.name.toString();
    switch(type){
      case "backgroundColor":
        params["backgroundColor"] = getColor(property);
        break;
      case "toolbarHeight":
        params["toolbarHeight"] = getHeight(property);
        break;
      case "height":
        containerHeight = getHeight(property); //Internal height understanding, may change XML structure later
        break;
      case "textStyle":
        break; //Can decide how best to handle, currently getting style in 'title' case
      case "title":
        var titleTextStyleElement = properties!.getElement("textStyle");
        params['titleTextStyle'] = titleTextStyleElement != null ? getTextStyle(titleTextStyleElement) : TextStyle();
        params["title"] = getText(property, params["titleTextStyle"]);
        break;
      case "centerTitle":
        params["centerTitle"] = getCenter(property);
        break;
      default:
        debugPrint("Tried to build unrecognized property: $type");
    }
  }

  //AppBar Actions
  var actionElements = bar.getElement('Actions');
  var actionsList = actionElements != null ? actionElements.childElements : Iterable.empty();
  List<Widget> actions = [];

  for(var action in actionsList){
    var type = action.name.toString();
    switch(type){
      case "TextButton":
        var button = buildTextButton(action);
        actions.add(button);
        break;
      default:
        debugPrint("Tried to build unrecognized action item: $type");
    }
  }
  params['actions'] = actions;
  return Container(height:containerHeight, child:InfinicardAppBar(params));
  
}