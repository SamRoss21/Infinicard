const String uiXML = 
  '''<root>
       <Bar id="bar1">
 	        <Value>bar</Value>
 	        <Properties>
            <backgroundColor>0xffC9A9EA</backgroundColor>
            <title>Susan B. Anthony</title>
            <height>50.0</height>
            <toolbarHeight>50.0</toolbarHeight>
            <centerTitle>false</centerTitle>
            <titleTextStyle>
              <color>0xff000000</color>
              <fontSize>30.0</fontSize>
              <fontWeight>bold</fontWeight>
              <fontFamily>Garamond</fontFamily>
            </titleTextStyle>
 	        </Properties>
 	        <Actions>
 		        <TextButton id="button1">
 			        <Properties>
 				        <Label>Flutter Docs</Label>
                <ButtonStyle>
 				          <backgroundColor>0xffffffff</backgroundColor>
                  <foregroundColor>0xff000000</foregroundColor>
                </ButtonStyle>
                <TextStyle>
                  <color>0xff000000</color>
                  <fontSize>15.0</fontSize>
                  <fontWeight>normal</fontWeight>
                  <fontFamily>Garamond</fontFamily>
                </TextStyle>
                <onPressed>
                  <type>link</type>
                  <target>https://docs.flutter.dev/</target>
                </onPressed>
 			        </Properties>
 		        </TextButton>
 	        </Actions>
        </Bar>
        <Image id="img1">
          <Value>Image</Value>
          <Path>assets/Susan-B-Anthony.jpeg</Path>
          <AltText>A portrait of Susan B. Anthony</AltText>
          <Properties>
            <height>200</height>
            <width>200</width>
          </Properties>
        </Image>
        <Text>
          <data>Bio</data>
          <Properties>
            <style>
              <color>0xff000000</color>
              <fontSize>50.0</fontSize>
              <fontWeight>bold</fontWeight>
              <fontFamily>Garamond</fontFamily>
            </style>
            <textAlign>left</textAlign>
          </Properties>
        </Text>
        <Text>
          <data>Susan B. Anthony was born in ...</data>
          <Properties>
            <style>
              <color>0xff000000</color>
              <fontSize>20.0</fontSize>
              <fontWeight>normal</fontWeight>
              <fontFamily>Garamond</fontFamily>
            </style>
            <textAlign>left</textAlign>
          </Properties>
        </Text>
        

    </root>''';

getXML(){
  return uiXML;
}