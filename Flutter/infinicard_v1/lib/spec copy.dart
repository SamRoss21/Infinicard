const String uiXML = 
  '''<root>
       <Bar id="bar1">
 	        <Value>bar</Value>
 	        <Properties>
            <backgroundColor>thistle</backgroundColor>
            <title>Susan B. Anthony</title>
            <height>100.0</height>
            <toolbarHeight>100.0</toolbarHeight>
            <centerTitle>false</centerTitle>
            <textStyle>
              <color>0xffffffff</color>
              <fontSize>60.0</fontSize>
              <fontWeight>bold</fontWeight>
              <fontFamily>Garamond</fontFamily>
            </textStyle>
 	        </Properties>
 	        <Actions>
 		        <TextButton id="button1">
 			        <Properties>
 				        <label>Flutter Docs</label>
                <buttonStyle>
 				          <backgroundColor>0xffffffff</backgroundColor>
                  <foregroundColor>0xff000000</foregroundColor>
                </buttonStyle>
                <textStyle>
                  <color>0xff000000</color>
                  <fontSize>15.0</fontSize>
                  <fontWeight>normal</fontWeight>
                  <fontFamily>Garamond</fontFamily>
                </textStyle>
                <onPressed>
                  <type>link</type>
                  <target>https://docs.flutter.dev/</target>
                </onPressed>
 			        </Properties>
 		        </TextButton>
 	        </Actions>
        </Bar>
        <Column>
          <Properties>
            <crossAxisAlignment>stretch</crossAxisAlignment>
          </Properties>
          <Children>
            <Image id="img1">
              <Value>Image</Value>
              <Properties>
                <path>assets/Susan-B-Anthony.jpeg</path>
                <altText>A portrait of Susan B. Anthony</altText>
                <height>200</height>
                <width>200</width>
              </Properties>
            </Image>
            <Image id="img1">
              <Value>Image</Value>
              <Properties>
                <path>assets/Susan-B-Anthony.jpeg</path>
                <altText>A portrait of Susan B. Anthony</altText>
                <height>200</height>
                <width>200</width>
              </Properties>
            </Image>
          </Children>
        </Column>
        <Text>
          <data>Bio</data>
          <Properties>
            <textStyle>
              <color>0xff000000</color>
              <fontSize>50.0</fontSize>
              <fontWeight>bold</fontWeight>
              <fontFamily>Garamond</fontFamily>
            </textStyle>
            <textAlign>left</textAlign>
          </Properties>
        </Text>
        <Text>
          <data>Susan B. Anthony was born in ...</data>
          <Properties>
            <textStyle>
              <color>0xff000000</color>
              <fontSize>20.0</fontSize>
              <fontWeight>normal</fontWeight>
              <fontFamily>Garamond</fontFamily>
            </textStyle>
            <textAlign>left</textAlign>
          </Properties>
        </Text>

    </root>''';

getXML(){
  return uiXML;
}