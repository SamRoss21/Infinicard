import 'package:flutter/material.dart';

InfinicardTextStyle(params){

  final List<String> argNames = ["color","fontSize", "fontWeight", "fontFamily"];

  var args = Map();
  var defaults = Map();

  defaults["inherit"] = false;

  //get null values for parameters
  for(var arg in argNames){
    args[arg] = null; 
  }

  for(var def in defaults.keys){
    args[def] = defaults[def]; 
  }

  //override our/flutter's default values when user specifies
  for(var key in params.keys){
    if(args.containsKey(key)){
      args[key] = params[key]; 
    }
  }

  return TextStyle(inherit:args["inherit"], color:args["color"], fontSize:args['fontSize'], 
  fontWeight:args["fontWeight"], fontFamily:args['fontFamily']);

}