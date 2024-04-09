import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

import 'package:infinicard_v1/models/InfinicardImage.dart';

Widget buildImage(XmlElement image){
  var params = Map();
  var containerHeight = 0.0;
  var containerWidth = 0.0;

  var path = image.getElement('Path');
  if(path!=null){
    params['path'] = path.innerText.toString();
  }

  var altText = image.getElement('AltText');
  if(altText!=null){
    params['semanticLabel'] = altText.innerText.toString();
  }

  var properties = image.getElement("Properties");
  if(properties!=null){
    var height = properties.getElement("height");
    if(height!=null){
      containerHeight = double.parse(height.innerText.toString());
      params["height"] = containerHeight;
      
    }
    
    var width = properties.getElement("width");
    if(width!=null){
      containerWidth = double.parse(width.innerText.toString());
      params["width"] = containerWidth;
    }
  }

  return Container(height:containerHeight, width:containerWidth, child:InfinicardImage(params));
  
}