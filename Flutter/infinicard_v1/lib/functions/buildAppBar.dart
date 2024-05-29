import 'package:flutter/material.dart';
import 'package:infinicard_v1/functions/buildText.dart';
import 'package:infinicard_v1/models/ICColor.dart';
import 'package:xml/xml.dart';

import 'package:infinicard_v1/models/ICAppBar.dart';
import 'package:infinicard_v1/functions/buildFromXml.dart';
import 'helpers.dart';

ICAppBar getBar(XmlElement bar, BuildContext context){
  var properties = bar.getElement("properties");
  var propertiesList = properties != null ? properties.childElements : const Iterable.empty();
  
  var appBar = ICAppBar();

  //AppBar Properties
  for(XmlElement property in propertiesList){
    var type = property.name.toString();
    bool content = property.innerText != "";
    switch([type, content]){
      case ["backgroundColor", true]:
        appBar.setBackgroundColor(ICColor(property.innerText));
        break;
      case ["toolbarHeight", true]:
        appBar.setToolbarHeight(getHeight(property));
        break;
      case ["height", true]:
        appBar.setHeight(getHeight(property));
        break;
      case ["text", true]:
        appBar.setTitle(getText(property, context));
        break;
      case ["centerTitle", true]:
        appBar.setCenterTitle(getCenter(property));
        break;
      case ["leading", true]:
        if(property.firstElementChild != null){
          XmlElement leading = property.firstElementChild as XmlElement;
          appBar.setLeading(getUIElement(leading, context));}
        break;
      case ["actions", true]:
        appBar.setActions(getActions(property, context));
        break;
      default:
        debugPrint("Tried to build unrecognized property: $type");
    }
    
  }
  return appBar;
}



Widget buildBar(XmlElement appBarElement, BuildContext context){
  var bar = getBar(appBarElement, context);
  var height = bar.toolbarHeight;

  return SizedBox(height:height, child:bar.toFlutter(context));
}