import 'package:flutter/material.dart';
import 'package:infinicard_v1/models/ICColor.dart';
import 'package:xml/xml.dart';
import 'package:infinicard_v1/models/ICButtonStyle.dart';
import 'helpers.dart';

ICButtonStyle getButtonStyle(XmlElement styleElement){
  var buttonStyle = ICButtonStyle();

  var properties = styleElement.childElements;
  for(var property in properties){
    var type = property.name.toString();
    switch(type){
      case "backgroundColor": 
        var stateVals = getStateValues(property);
        buttonStyle.setBackgroundColor(color:stateVals.defaultVal, pressed: stateVals.pressed, hovered:stateVals.hovered);
        break;
      default:
        debugPrint("Tried to build unrecognized button style type: $type");
    }
  }
  return buttonStyle;
}

StateColorVals getStateValues(XmlElement element){
  var states = element.childElements;
  var stateVals = StateColorVals();
  for(var state in states){
    var type = state.name.toString();
    switch(type){
      case "default":
        stateVals.defaultVal = ICColor(state.innerText);
        break;
      case "pressed":
        stateVals.pressed = ICColor(state.innerText);
        break;
      case "hovered":
        stateVals.hovered = ICColor(state.innerText);
        break;
    }
  }
  return stateVals;
}

class StateColorVals {
  ICColor? defaultVal;
  ICColor? pressed;
  ICColor? hovered;

  StateColorVals({this.defaultVal, this.pressed, this.hovered});
}