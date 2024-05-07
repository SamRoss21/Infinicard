const String uiXML = 
  '''
    <root>
       <Bar>
        <Properties>
          <height>50</height>
          <backgroundColor>blue</backgroundColor>
          <title>Infinicard Made Site</title>
          <centerTitle>false</centerTitle>
          <textStyle>
            <color>yellow</color>
            <fontWeight>normal</fontWeight>
            <fontSize>30</fontSize>
          </textStyle>
        </Properties>
        <Actions>
          <TextButton>
            <Properties>
              <label>Google</label>
              <textStyle>
                <fontSize>20.0</fontSize>
                <fontWeight>bold</fontWeight>
                <fontFamily>Garamond</fontFamily>
              </textStyle>
              <buttonStyle>
                <foregroundColor>green</foregroundColor>
              </buttonStyle>
              <onPressed>
                <type>link</type>
                <target>https://google.com</target>
              </onPressed>
            </Properties>
          </TextButton>
        </Actions>
       </Bar>

    </root>''';

getXML(){
  return uiXML;
}