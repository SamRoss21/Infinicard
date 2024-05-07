import 'package:flutter/material.dart';

class InfinicardTextStyle{
  TextStyle textStyle;

  InfinicardTextStyle({this.textStyle=const TextStyle()});

  void color(Color color){
    textStyle = textStyle.copyWith(color:color);
  }

  void fontSize(double fontSize){
    textStyle = textStyle.copyWith(fontSize:fontSize);
  }

  void fontWeight(FontWeight fontWeight){
    textStyle = textStyle.copyWith(fontWeight:fontWeight);
  }

  void fontFamily(String fontFamily){
    textStyle = textStyle.copyWith(fontFamily:fontFamily);
  }

  TextStyle style(){
    return textStyle;
  }
}