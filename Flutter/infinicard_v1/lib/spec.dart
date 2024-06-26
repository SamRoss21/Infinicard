const String uiXML = 
  '''
    <root>
      <bar>
        <properties>
          <backgroundColor>pink</backgroundColor>
          <height>75.0</height>
          <toolbarHeight>75.0</toolbarHeight>
          <centerTitle>false</centerTitle>
          <text>
            <data>My Website</data>
            <properties>
              <textStyle>
                <color>white</color>
                <fontSize>40.0</fontSize>
                <fontWeight>bold</fontWeight>
                <fontFamily>Garamond</fontFamily>
              </textStyle>
            </properties>
          </text>
          <actions>
            <textButton id="button1">
              <properties>
                <child>
                  <text>
                    <data>Flutter</data>
                    <properties>
                      <textStyle>
                        <color>black</color>
                        <fontSize>20</fontSize>
                      </textStyle>
                    </properties>
                  </text>
                </child>
                <onPressed>
                  <type>link</type>
                  <target>https://docs.flutter.dev/</target>
                </onPressed>
                <size>
                  <height>50</height>
                  <width>100</width>
                </size>
                <buttonStyle>
                  <backgroundColor>
                    <default>white</default>
                    <hovered>pink</hovered>
                    <pressed>thistle</pressed>
                  </backgroundColor>
                </buttonStyle>
              </properties>
            </textButton>
          </actions>
        </properties>
      </bar>
      <row>
        <properties>
          <mainAxisAlignment>left</mainAxisAlignment>
        </properties>
        <children>
          <image>
          <path>Susan-B-Anthony.jpeg</path>
          <properties>
            <size>
              <height>300</height>
              <width>250</width>
            </size>
            <altText>Susan</altText>
          </properties>
          </image>
          <text>
            <data>  Bio...</data>
            <properties>
              <textStyle>
                <color>darkcyan</color>
                <fontSize>40.0</fontSize>
                <fontWeight>bold</fontWeight>
                <fontFamily>Garamond</fontFamily>
              </textStyle>
              <size>
                <height>100.0</height>
                <width>300.0</width>
              </size>
            </properties>
          </text>
        </children>
      </row>
      

    </root>''';

