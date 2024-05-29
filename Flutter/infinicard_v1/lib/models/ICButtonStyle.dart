import 'package:flutter/material.dart';
import 'package:infinicard_v1/models/ICColor.dart';
import 'package:xml/xml.dart';

class ICButtonStyle {
  MaterialStateProperty<Color>? backgroundColor;

  ICColor? bgColor = ICColor("");
  ICColor? bgPressed;
  ICColor? bgHovered;
  ICButtonStyle();

  void setBackgroundColor({ICColor? color, ICColor? pressed, ICColor? hovered}) {
    bgColor = color;
    bgPressed = pressed;
    bgHovered = hovered;
    
    Set<MaterialState> states = {};
    if (pressed != null) {states.add(MaterialState.pressed);}
    if (hovered != null) {states.add(MaterialState.hovered);}
    
    backgroundColor = MaterialStateProperty.resolveWith(getColorForStates);
  }

  Color getColorForStates(Set<MaterialState> states){
    if(states.contains(MaterialState.pressed)){
      var pressedColor = bgPressed != null ? bgPressed?.toFlutter() : Colors.transparent;
      return pressedColor as Color;
      }
    if(states.contains(MaterialState.hovered)){
      var hoveredColor = bgHovered != null ? bgHovered?.toFlutter() : Colors.transparent;
      return hoveredColor as Color;
      }
    return Colors.transparent;
  }

  ButtonStyle toFlutter({BuildContext? context}) {
    var style = ButtonStyle(backgroundColor: backgroundColor);

    return style;
  }

  XmlElement toXml({bool verbose=false}){
    final element = XmlElement(XmlName("buttonStyle"));

    final bgElement = XmlElement(XmlName("backgroundColor"));

    final bgDefaultElement = backgroundColor != null ? XmlElement(XmlName("default"),[],[XmlText(bgColor!.toColorString())]) : XmlElement(XmlName("default"),[],[XmlText("")]);
    final bgHoveredElement = bgHovered != null ? XmlElement(XmlName("hovered"),[],[XmlText(bgHovered!.toColorString())]) : XmlElement(XmlName("hovered"),[],[XmlText("")]);
    final bgPressedElement = bgPressed != null ? XmlElement(XmlName("pressed"),[],[XmlText(bgPressed!.toColorString())]) : XmlElement(XmlName("pressed"),[],[XmlText("")]);

    if(verbose==false){
      if(backgroundColor!=null){
        bgElement.children.add(bgDefaultElement);
        if(bgHovered!=null){bgElement.children.add(bgHoveredElement);}
        if(bgPressed!=null){bgElement.children.add(bgPressedElement);}
        element.children.add(bgElement);
      }
    } else {
      bgElement.children.add(bgDefaultElement);
      bgElement.children.add(bgHoveredElement);
      bgElement.children.add(bgPressedElement);
      element.children.add(bgElement);
    }
    return element;
  }
}
