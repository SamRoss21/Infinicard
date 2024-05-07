import 'package:flutter/material.dart';

class Bar extends StatefulWidget {
  final Map params;

  final List<String> argNames = ["key", "leading", "automaticallyImplyLeading", "title", "actions", "flexibleSpace", 
  "bottom", "elevation", "scrolledUnderElevation", "notificationPredicate", "shadowColor", "surfaceTintColor", 
  "shape", "backgroundColor", "foregroundColor", "iconTheme", "actionsIconTheme", "primary", "centerTitle", 
  "excludeHeaderSemantics", "titleSpacing", "toolbarOpacity", "bottomOpacity", "toolbarHeight", "leadingWidth", 
"toolbarTextStyle", "titleTextStyle", "systemOverlayStyle", "forceMaterialTransparency", "clipBehavior"];
  var args = Map();

  var defaults = Map();

  Bar(this.params){
    //assign parameter special defaults
    defaults["automaticallyImplyLeading"] = true;
    defaults["notificationPredicate"] = defaultScrollNotificationPredicate;
    defaults["primary"] = true;
    defaults["excludeHeaderSemantics"] = false;
    defaults["toolbarOpacity"] = 1.0;
    defaults["bottomOpacity"] = 1.0;
    defaults["forceMaterialTransparency"] = false;

    //get null values for parameters
    for(var arg in argNames){
      args[arg] = null; 
    }
    //assign default values when necessary
    for(var def in defaults.keys){
      args[def] = defaults[def];
    }
    //override values when user specifies
    for(var key in params.keys){
      args[key] = params[key]; 
    }

  }

  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {

    return AppBar(key:widget.args["key"], leading:widget.args["leading"], 
      automaticallyImplyLeading:widget.args["automaticallyImplyLeading"], 
      title:widget.args["title"], actions:widget.args["actions"], 
      flexibleSpace:widget.args["flexibleSpace"], bottom:widget.args["bottom"], 
      elevation:widget.args["elevation"], scrolledUnderElevation:widget.args["scrolledUnderElevation"], 
      notificationPredicate:widget.args["notificationPredicate"], shadowColor:widget.args["shadowColor"], 
      surfaceTintColor:widget.args["surfaceTintColor"], shape:widget.args["shape"], 
      backgroundColor:widget.args["backgroundColor"], foregroundColor:widget.args["foregroundColor"], 
      iconTheme:widget.args["iconTheme"], actionsIconTheme:widget.args["actionsIconTheme"], 
      primary:widget.args["primary"], centerTitle:widget.args["centerTitle"], 
      excludeHeaderSemantics:widget.args["excludeHeaderSemantics"], 
      titleSpacing:widget.args["titleSpacing"], toolbarOpacity:widget.args["toolbarOpacity"], 
      bottomOpacity:widget.args["bottomOpacity"], toolbarHeight:widget.args["toolbarHeight"], 
      leadingWidth:widget.args["leadingWidth"], toolbarTextStyle:widget.args["toolbarTextStyle"], 
      titleTextStyle:widget.args["titleTextStyle"], systemOverlayStyle:widget.args["systemOverlayStyle"],
      forceMaterialTransparency:widget.args["forceMaterialTransparency"], 
      clipBehavior:widget.args["clipBehavior"]);
  }

}
