import 'package:flutter/material.dart';

const String uiXML = 
  '''<root>
       <Bar id="bar1">
 	        <Value>bar</Value>
 	        <Properties>
 		        <backgroundColor>0xe292f4FF</backgroundColor>
            <title>Bar</title>
 	        </Properties>
 	        <Children>
 		        <Button id="button1">
 			        <Properties>
 				        <Label>Click Me</Label>
 				        <Color>0xaa443a11</Color>
 			        </Properties>
 		        </Button>
 	        </Children>
        </Bar>
    </root>''';

getXML(){
  return uiXML;
}