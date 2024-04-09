import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

import 'package:infinicard_v1/models/InfinicardAppBar.dart';
import 'package:infinicard_v1/functions/buildTextButton.dart';
import 'getTextStyle.dart';

Widget buildBar(XmlElement bar){
  var params = Map();
  var properties = bar.getElement("Properties");
  var containerHeight = 0.0;

  if(properties!=null){
    var backgroundColor = properties.getElement("backgroundColor");
    if(backgroundColor!=null){
      params["backgroundColor"] = getColor(backgroundColor);
    }
    
    var toolbarHeight = properties.getElement("toolbarHeight");
    if(toolbarHeight!=null){
      params["toolbarHeight"] = getHeight(toolbarHeight);
    }

    //for container height, not internal appbar height
    var heightElement = properties.getElement("toolbarHeight"); 
    if(heightElement!=null){
      containerHeight = getHeight(heightElement);
    }

    var titleTextStyle = properties.getElement("titleTextStyle");
    if(titleTextStyle!=null){
      params["titleTextStyle"] = getTitleTextStyle(titleTextStyle);
    }

    var title = properties.getElement("title");
    if(title!=null){
      params["title"] = getTitle(title, params["titleTextStyle"]);
    }

    var center = properties.getElement("centerTitle");
    if(center!=null){
      params["centerTitle"] = getCenter(center);
    }
  }

  var actionElements = bar.getElement('Actions');
  List<Widget> actions = [];

  if(actionElements!=null){
    var children = actionElements.childElements;
    for(var child in children){
      var type = child.name.toString();
      if(type=="TextButton"){
        var button = buildTextButton(child);
        actions.add(button);
      }
    }
  }
  params['actions'] = actions;

  return Container(height:containerHeight, child:InfinicardAppBar(params));
  
}

Color getColor(XmlElement col){
  var color = int.parse(col.innerText.toString());
  return Color(color);
}

double getHeight(XmlElement heightElement){
  var height = double.parse(heightElement.innerText.toString());
  return height;
}

Widget getTitle(XmlElement titleElement, TextStyle titleStyle){
  var title = titleElement.innerText.toString();
  return Text(title, style:titleStyle);
}

TextStyle getTitleTextStyle(XmlElement titleStyle){
  var params = Map();

  var colorElement = titleStyle.getElement("color");
  if(colorElement!=null){
    var color = int.parse(colorElement.innerText.toString());
    params["color"] = Color(color);
  }

  var weightElement = titleStyle.getElement("fontWeight");
  if(weightElement!=null){
    var weight = weightElement.innerText.toString();
    if(weight=="bold"){
      params["fontWeight"] = FontWeight.bold;
    }
    else{
      params["fontWeight"] = FontWeight.normal;
    }
  }

  var sizeElement = titleStyle.getElement("fontSize");
  if(sizeElement!=null){
    var size = double.parse(sizeElement.innerText.toString());
    params["fontSize"] = size;
  }

  var fontElement = titleStyle.getElement("fontFamily");
  if(fontElement!=null){
    var fontFamily = fontElement.innerText.toString();
    params["fontFamily"] = fontFamily;
  }

  var style = getTextStyle(params);
  return style;

}

bool getCenter(XmlElement centerElement){
  var center = bool.parse(centerElement.innerText.toString());
  return center;
}