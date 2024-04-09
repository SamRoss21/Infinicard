import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfinicardTextButton extends StatefulWidget {
  final Map params;

  final List<String> argNames = ['key', 'onPressed', 'child', 'textStyle', 'backgroundColor', 'foregroundColor'];

  var args = Map();
  var defaults = Map(); //our default arguments

  InfinicardTextButton(this.params){
    //get null values for parameters
    for(var arg in argNames){
      args[arg] = null; 
    }

    //override our/flutter's default values when user specifies
    for(var key in params.keys){
      if(args.containsKey(key)){
        args[key] = params[key]; 
      }
    }

  }

@override
  _InfinicardTextButton createState() => _InfinicardTextButton();

}

class _InfinicardTextButton extends State<InfinicardTextButton> {
  @override
  Widget build(BuildContext context) {
    var button = TextButton(key:widget.args['key'], onPressed:(){onPressed(widget.args['onPressed']);}, 
    child:widget.args['child'], style:TextButton.styleFrom(textStyle:widget.args['textStyle'], 
    backgroundColor:widget.args['backgroundColor'], foregroundColor:widget.args['foregroundColor']));


    return button;
  }
}

void onPressed(Map action){
  var type = action['type'];
  var target = action['target'];

  if(type=='link'){
    launchUrl(Uri.parse(target));
  }
}