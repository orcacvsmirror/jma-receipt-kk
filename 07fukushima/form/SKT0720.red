<?xml version="1.0"?>
<diagram xmlns:dia="http://www.lysator.liu.se/~alla/dia/">
  <dictionarydata>
    <element name="HKNJANUM" occurs="1">
      <appinfo>
        <embed object="string" length="12"/>
      </appinfo>
    </element>
    <element name="HOSPCD" occurs="1">
      <appinfo>
        <embed object="string" length="14"/>
      </appinfo>
    </element>
    <element name="ZAI1" occurs="1">
      <appinfo>
        <embed object="string" length="2"/>
      </appinfo>
    </element>
    <element name="ZAI2" occurs="1">
      <appinfo>
        <embed object="string" length="2"/>
      </appinfo>
    </element>
    <element name="NO" occurs="1">
      <appinfo>
        <embed object="string" length="4"/>
      </appinfo>
    </element>
    <element name="KOH-TBL" occurs="14">
      <element name="KOHNAME" occurs="1">
        <appinfo>
          <embed object="string" length="10"/>
        </appinfo>
      </element>
      <element name="NYUGAI-TBL" occurs="2">
        <element name="KENSU" occurs="1">
          <appinfo>
            <embed object="string" length="5"/>
          </appinfo>
        </element>
        <element name="NISSU" occurs="1">
          <appinfo>
            <embed object="string" length="5"/>
          </appinfo>
        </element>
        <element name="TENSU" occurs="1">
          <appinfo>
            <embed object="string" length="10"/>
          </appinfo>
        </element>
        <element name="ITBFTN" occurs="1">
          <appinfo>
            <embed object="string" length="9"/>
          </appinfo>
        </element>
      </element>
      <element name="S-KENSU" occurs="1">
        <appinfo>
          <embed object="string" length="5"/>
        </appinfo>
      </element>
      <element name="S-NISSU" occurs="1">
        <appinfo>
          <embed object="string" length="5"/>
        </appinfo>
      </element>
      <element name="S-KINGAKU" occurs="1">
        <appinfo>
          <embed object="string" length="9"/>
        </appinfo>
      </element>
      <element name="S-FTNGAKU" occurs="1">
        <appinfo>
          <embed object="string" length="9"/>
        </appinfo>
      </element>
    </element>
  </dictionarydata>
  <diagramdata>
    <attribute name="background">
      <color val="#ffffff"/>
    </attribute>
    <attribute name="paper">
      <composite type="paper">
        <attribute name="name">
          <string>#A4#</string>
        </attribute>
        <attribute name="pswidth">
          <real val="21"/>
        </attribute>
        <attribute name="psheight">
          <real val="29.7"/>
        </attribute>
        <attribute name="tmargin">
          <real val="0"/>
        </attribute>
        <attribute name="bmargin">
          <real val="0"/>
        </attribute>
        <attribute name="lmargin">
          <real val="0"/>
        </attribute>
        <attribute name="rmargin">
          <real val="0"/>
        </attribute>
        <attribute name="is_portrait">
          <boolean val="true"/>
        </attribute>
        <attribute name="scaling">
          <real val="1"/>
        </attribute>
        <attribute name="fitto">
          <boolean val="false"/>
        </attribute>
      </composite>
    </attribute>
  </diagramdata>
  <layer name="&#199;&#216;&#183;&#202;" visible="true">
    <object type="Standard - Box" version="0" id="O0">
      <attribute name="obj_pos">
        <point val="1.00841,6.00703"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99341,5.99203;20.0257,22.965"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="1.00841,6.00703"/>
      </attribute>
      <attribute name="elem_width">
        <real val="19.0023"/>
      </attribute>
      <attribute name="elem_height">
        <real val="16.943"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.03"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O1">
      <attribute name="obj_pos">
        <point val="5.47751,4.14011"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.46251,4.12511;16.5734,5.56954"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="5.47751,4.14011"/>
      </attribute>
      <attribute name="elem_width">
        <real val="11.0809"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1.41443"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.03"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O2">
      <attribute name="obj_pos">
        <point val="5.47751,4.84732"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.47251,4.84232;16.5634,4.85232"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.47751,4.84732"/>
        <point val="16.5584,4.84732"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O1" connection="3"/>
        <connection handle="1" to="O1" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O3">
      <attribute name="obj_pos">
        <point val="6.20841,4.8545"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.20341,4.8495;6.22123,5.55954"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.20841,4.8545"/>
        <point val="6.21623,5.55454"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O4">
      <attribute name="obj_pos">
        <point val="6.95841,4.8545"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.94996,4.8495;6.96341,5.55954"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.95841,4.8545"/>
        <point val="6.95496,5.55454"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O5">
      <attribute name="obj_pos">
        <point val="7.68341,4.8545"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.67841,4.8495;7.68841,5.5345"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="7.68341,4.8545"/>
        <point val="7.68341,5.5295"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O6">
      <attribute name="obj_pos">
        <point val="16.5584,4.14011"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5534,4.13511;16.5634,5.55954"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="16.5584,4.14011"/>
        <point val="16.5584,5.55454"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O1" connection="2"/>
        <connection handle="1" to="O1" connection="7"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O7">
      <attribute name="obj_pos">
        <point val="8.43341,4.8545"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.42742,4.8495;8.43841,5.55954"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="8.43341,4.8545"/>
        <point val="8.43242,5.55454"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O8">
      <attribute name="obj_pos">
        <point val="9.18341,4.8545"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.16614,4.8495;9.18841,5.55954"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="9.18341,4.8545"/>
        <point val="9.17114,5.55454"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O9">
      <attribute name="obj_pos">
        <point val="9.90987,4.14011"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.90487,4.13511;9.91487,5.55954"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="9.90987,4.14011"/>
        <point val="9.90987,5.55454"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O10">
      <attribute name="obj_pos">
        <point val="10.6584,4.8545"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.6436,4.8495;10.6634,5.55954"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.6584,4.8545"/>
        <point val="10.6486,5.55454"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O11">
      <attribute name="obj_pos">
        <point val="11.3873,4.14011"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.3823,4.13511;11.3923,5.55954"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="11.3873,4.14011"/>
        <point val="11.3873,5.55454"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O12">
      <attribute name="obj_pos">
        <point val="12.1334,4.8545"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.1211,4.8495;12.1384,5.55954"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.1334,4.8545"/>
        <point val="12.1261,5.55454"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O13">
      <attribute name="obj_pos">
        <point val="12.8584,4.8545"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8534,4.8495;12.8698,5.55954"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.8584,4.8545"/>
        <point val="12.8648,5.55454"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O14">
      <attribute name="obj_pos">
        <point val="13.6084,4.8545"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.5985,4.8495;13.6134,5.55954"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.6084,4.8545"/>
        <point val="13.6035,5.55454"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O15">
      <attribute name="obj_pos">
        <point val="14.3334,4.8545"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.3284,4.8495;14.3472,5.55954"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.3334,4.8545"/>
        <point val="14.3422,5.55454"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O16">
      <attribute name="obj_pos">
        <point val="15.0834,4.8545"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.076,4.8495;15.0884,5.55954"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.0834,4.8545"/>
        <point val="15.081,5.55454"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O17">
      <attribute name="obj_pos">
        <point val="15.8084,4.8795"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.8034,4.8745;15.8247,5.55954"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.8084,4.8795"/>
        <point val="15.8197,5.55454"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O18">
      <attribute name="obj_pos">
        <point val="16.5584,4.14011"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5534,4.13511;16.5634,5.55954"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="16.5584,4.14011"/>
        <point val="16.5584,5.55454"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O19">
      <attribute name="obj_pos">
        <point val="4.31813,6.44622"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.31313,6.42907;20.0157,6.45122"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4.31813,6.44622"/>
        <point val="20.0107,6.43407"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O20">
      <attribute name="obj_pos">
        <point val="1.00841,7.14398"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.00341,7.13898;20.0157,7.14898"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.00841,7.14398"/>
        <point val="20.0107,7.14398"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O21">
      <attribute name="obj_pos">
        <point val="2.90371,7.71921"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.89871,7.70745;20.0157,7.72421"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.90371,7.71921"/>
        <point val="20.0107,7.71245"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O22">
      <attribute name="obj_pos">
        <point val="1.00841,8.28092"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.00341,8.27592;20.0157,8.28592"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.00841,8.28092"/>
        <point val="20.0107,8.28092"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O23">
      <attribute name="obj_pos">
        <point val="2.90371,8.85075"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.89871,8.8444;20.0157,8.85575"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.90371,8.85075"/>
        <point val="20.0107,8.8494"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O24">
      <attribute name="obj_pos">
        <point val="1.00841,9.41787"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.00341,9.41287;20.0157,9.42287"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.00841,9.41787"/>
        <point val="20.0107,9.41787"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O25">
      <attribute name="obj_pos">
        <point val="2.90371,9.98229"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.89871,9.97729;20.0157,9.99134"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.90371,9.98229"/>
        <point val="20.0107,9.98634"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O26">
      <attribute name="obj_pos">
        <point val="1.01801,10.5416"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.01301,10.5366;20.0157,10.5598"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.01801,10.5416"/>
        <point val="20.0107,10.5548"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O27">
      <attribute name="obj_pos">
        <point val="2.90371,11.1138"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.89871,11.1036;19.9824,11.1188"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.90371,11.1138"/>
        <point val="19.9774,11.1086"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O28">
      <attribute name="obj_pos">
        <point val="1.01801,11.7083"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.01301,11.6868;20.0157,11.7133"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.01801,11.7083"/>
        <point val="20.0107,11.6918"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O29">
      <attribute name="obj_pos">
        <point val="2.90371,12.2454"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.89871,12.2404;20.0157,12.2652"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.90371,12.2454"/>
        <point val="20.0107,12.2602"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O30">
      <attribute name="obj_pos">
        <point val="1.01801,12.8044"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.01301,12.7994;20.0088,12.826"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.01801,12.8044"/>
        <point val="20.0038,12.821"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O31">
      <attribute name="obj_pos">
        <point val="2.90371,13.4123"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.89871,13.3922;20.0157,13.4173"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.90371,13.4123"/>
        <point val="20.0107,13.3972"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O32">
      <attribute name="obj_pos">
        <point val="1.00841,13.9657"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.00341,13.9607;20.0157,13.9707"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.00841,13.9657"/>
        <point val="20.0107,13.9657"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O33">
      <attribute name="obj_pos">
        <point val="2.90371,14.5438"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.89871,14.5291;20.0157,14.5488"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.90371,14.5438"/>
        <point val="20.0107,14.5341"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O34">
      <attribute name="obj_pos">
        <point val="1.00841,15.1026"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.00341,15.0976;20.0157,15.1076"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.00841,15.1026"/>
        <point val="20.0107,15.1026"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O35">
      <attribute name="obj_pos">
        <point val="2.90371,15.6754"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.89871,15.6661;20.0157,15.6804"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.90371,15.6754"/>
        <point val="20.0107,15.6711"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O36">
      <attribute name="obj_pos">
        <point val="1.00841,16.2395"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.00341,16.2345;20.0157,16.2445"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.00841,16.2395"/>
        <point val="20.0107,16.2395"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O37">
      <attribute name="obj_pos">
        <point val="2.90371,16.8069"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.89871,16.8019;20.0157,16.813"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.90371,16.8069"/>
        <point val="20.0107,16.808"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O38">
      <attribute name="obj_pos">
        <point val="1.00841,17.3765"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.00341,17.3715;20.0157,17.3815"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.00841,17.3765"/>
        <point val="20.0107,17.3765"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O39">
      <attribute name="obj_pos">
        <point val="2.90371,17.9384"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.89871,17.9334;20.0157,17.95"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.90371,17.9384"/>
        <point val="20.0107,17.945"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O40">
      <attribute name="obj_pos">
        <point val="1.00841,18.5134"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.00341,18.5084;20.0157,18.5184"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.00841,18.5134"/>
        <point val="20.0107,18.5134"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O41">
      <attribute name="obj_pos">
        <point val="2.90371,19.07"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.89871,19.065;20.0157,19.0869"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.90371,19.07"/>
        <point val="20.0107,19.0819"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O42">
      <attribute name="obj_pos">
        <point val="2.89402,21.3175"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.88902,21.3125;19.9862,21.3279"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.89402,21.3175"/>
        <point val="19.9812,21.3229"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O43">
      <attribute name="obj_pos">
        <point val="1.00841,19.6504"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.00341,19.6454;20.0157,19.6554"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.00841,19.6504"/>
        <point val="20.0107,19.6504"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O44">
      <attribute name="obj_pos">
        <point val="2.89901,5.97569"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.88766,5.97069;2.90401,22.9613"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.89901,5.97569"/>
        <point val="2.89266,22.9563"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O45">
      <attribute name="obj_pos">
        <point val="4.31613,5.96361"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.31113,5.95861;4.32266,22.9613"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4.31613,5.96361"/>
        <point val="4.31766,22.9563"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O46">
      <attribute name="obj_pos">
        <point val="5.47401,6.43605"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.46266,6.43105;5.47901,22.9613"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.47401,6.43605"/>
        <point val="5.46766,22.9563"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O47">
      <attribute name="obj_pos">
        <point val="6.99901,6.43605"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.96266,6.43105;7.00401,22.9613"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.99901,6.43605"/>
        <point val="6.96766,22.9563"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O48">
      <attribute name="obj_pos">
        <point val="11.1475,6.43605"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1377,6.43105;11.1525,22.9863"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="11.1475,6.43605"/>
        <point val="11.1427,22.9813"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O49">
      <attribute name="obj_pos">
        <point val="12.8807,6.01009"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8657,5.99509;12.9077,22.9963"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.8807,6.01009"/>
        <point val="12.8927,22.9813"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O50">
      <attribute name="obj_pos">
        <point val="14.2906,6.43605"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2769,6.43105;14.2956,7.72156"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.2906,6.43605"/>
        <point val="14.2819,7.71656"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O51">
      <attribute name="obj_pos">
        <point val="15.8156,6.43605"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.8019,6.43105;15.8206,7.71699"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.8156,6.43605"/>
        <point val="15.8069,7.71199"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O52">
      <attribute name="obj_pos">
        <point val="17.9906,6.43605"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9769,6.43105;17.9956,7.71542"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.9906,6.43605"/>
        <point val="17.9819,7.71042"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O53">
      <attribute name="obj_pos">
        <point val="0.984538,21.8582"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.979538,21.8532;20.0225,21.8692"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="0.984538,21.8582"/>
        <point val="20.0175,21.8642"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O54">
      <attribute name="obj_pos">
        <point val="2.89402,22.4417"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.88902,22.419;20.0136,22.4467"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.89402,22.4417"/>
        <point val="20.0086,22.424"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O55">
      <attribute name="obj_pos">
        <point val="1.01989,22.9544"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.01489,22.9494;20.049,22.9594"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.01989,22.9544"/>
        <point val="20.044,22.9544"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O56">
      <attribute name="obj_pos">
        <point val="2.89184,20.229"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.88684,20.224;20.0932,20.2367"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.89184,20.229"/>
        <point val="20.0882,20.2317"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O57">
      <attribute name="obj_pos">
        <point val="1.02877,20.763"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.02377,20.758;20.0579,20.768"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.02877,20.763"/>
        <point val="20.0529,20.763"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O58">
      <attribute name="obj_pos">
        <point val="17.9806,8.29042"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9756,8.28542;17.9869,8.86542"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.9806,8.29042"/>
        <point val="17.9819,8.86042"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O59">
      <attribute name="obj_pos">
        <point val="17.9719,9.41542"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9669,9.41042;17.9782,9.99042"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.9719,9.41542"/>
        <point val="17.9732,9.98542"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O60">
      <attribute name="obj_pos">
        <point val="17.9719,10.5654"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9669,10.5604;17.9782,11.1404"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.9719,10.5654"/>
        <point val="17.9732,11.1354"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O61">
      <attribute name="obj_pos">
        <point val="17.9719,11.6904"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9669,11.6854;17.9782,12.2654"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.9719,11.6904"/>
        <point val="17.9732,12.2604"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O62">
      <attribute name="obj_pos">
        <point val="17.9719,12.8404"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9669,12.8354;17.9782,13.4154"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.9719,12.8404"/>
        <point val="17.9732,13.4104"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O63">
      <attribute name="obj_pos">
        <point val="17.9719,13.9654"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9669,13.9604;17.9782,14.5404"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.9719,13.9654"/>
        <point val="17.9732,14.5354"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O64">
      <attribute name="obj_pos">
        <point val="17.9719,15.1154"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9669,15.1104;17.9782,15.6904"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.9719,15.1154"/>
        <point val="17.9732,15.6854"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O65">
      <attribute name="obj_pos">
        <point val="17.9719,16.2404"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9669,16.2354;17.9782,16.8154"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.9719,16.2404"/>
        <point val="17.9732,16.8104"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O66">
      <attribute name="obj_pos">
        <point val="17.9719,17.3904"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9669,17.3854;17.9782,17.9654"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.9719,17.3904"/>
        <point val="17.9732,17.9604"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O67">
      <attribute name="obj_pos">
        <point val="17.9719,18.5154"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9669,18.5104;17.9782,19.0904"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.9719,18.5154"/>
        <point val="17.9732,19.0854"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O68">
      <attribute name="obj_pos">
        <point val="15.7969,8.29199"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7919,8.28699;15.8032,8.86699"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.7969,8.29199"/>
        <point val="15.7982,8.86199"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O69">
      <attribute name="obj_pos">
        <point val="15.7969,9.41699"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7919,9.41199;15.8032,9.99199"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.7969,9.41699"/>
        <point val="15.7982,9.98699"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O70">
      <attribute name="obj_pos">
        <point val="15.7969,10.567"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7919,10.562;15.8032,11.142"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.7969,10.567"/>
        <point val="15.7982,11.137"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O71">
      <attribute name="obj_pos">
        <point val="15.7969,11.6966"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7919,11.6916;15.8032,12.2716"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.7969,11.6966"/>
        <point val="15.7982,12.2666"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O72">
      <attribute name="obj_pos">
        <point val="15.7969,12.8216"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7919,12.8166;15.8032,13.3966"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.7969,12.8216"/>
        <point val="15.7982,13.3916"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O73">
      <attribute name="obj_pos">
        <point val="15.7969,13.9716"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7919,13.9666;15.8032,14.5466"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.7969,13.9716"/>
        <point val="15.7982,14.5416"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O74">
      <attribute name="obj_pos">
        <point val="15.7969,15.0966"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7919,15.0916;15.8032,15.6716"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.7969,15.0966"/>
        <point val="15.7982,15.6666"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O75">
      <attribute name="obj_pos">
        <point val="15.7969,16.2466"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7919,16.2416;15.8032,16.8216"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.7969,16.2466"/>
        <point val="15.7982,16.8166"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O76">
      <attribute name="obj_pos">
        <point val="15.7969,17.3716"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7919,17.3666;15.8032,17.9466"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.7969,17.3716"/>
        <point val="15.7982,17.9416"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O77">
      <attribute name="obj_pos">
        <point val="15.7969,18.5216"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7919,18.5166;15.8032,19.0966"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.7969,18.5216"/>
        <point val="15.7982,19.0916"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O78">
      <attribute name="obj_pos">
        <point val="14.2969,18.5216"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2919,18.5166;14.3032,19.0966"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.2969,18.5216"/>
        <point val="14.2982,19.0916"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O79">
      <attribute name="obj_pos">
        <point val="14.2719,8.29656"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2669,8.29156;14.2782,8.87156"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.2719,8.29656"/>
        <point val="14.2732,8.86656"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O80">
      <attribute name="obj_pos">
        <point val="14.2719,9.42156"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2669,9.41656;14.2782,9.99656"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.2719,9.42156"/>
        <point val="14.2732,9.99156"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O81">
      <attribute name="obj_pos">
        <point val="14.2719,10.5716"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2669,10.5666;14.2782,11.1466"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.2719,10.5716"/>
        <point val="14.2732,11.1416"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O82">
      <attribute name="obj_pos">
        <point val="14.2719,11.6966"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2669,11.6916;14.2782,12.2716"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.2719,11.6966"/>
        <point val="14.2732,12.2666"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O83">
      <attribute name="obj_pos">
        <point val="14.2719,12.8216"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2669,12.8166;14.2782,13.3966"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.2719,12.8216"/>
        <point val="14.2732,13.3916"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O84">
      <attribute name="obj_pos">
        <point val="14.2719,13.9716"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2669,13.9666;14.2782,14.5466"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.2719,13.9716"/>
        <point val="14.2732,14.5416"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O85">
      <attribute name="obj_pos">
        <point val="14.2719,15.0966"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2669,15.0916;14.2782,15.6716"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.2719,15.0966"/>
        <point val="14.2732,15.6666"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O86">
      <attribute name="obj_pos">
        <point val="14.2719,16.2466"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2669,16.2416;14.2782,16.8216"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.2719,16.2466"/>
        <point val="14.2732,16.8166"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O87">
      <attribute name="obj_pos">
        <point val="14.2719,17.3716"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2669,17.3666;14.2782,17.9466"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.2719,17.3716"/>
        <point val="14.2732,17.9416"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O88">
      <attribute name="obj_pos">
        <point val="20.0036,7.71362"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8724,7.70862;20.0086,8.28862"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="20.0036,7.71362"/>
        <point val="12.8774,8.28362"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O89">
      <attribute name="obj_pos">
        <point val="19.9936,8.83862"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8624,8.83362;19.9986,9.41362"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="19.9936,8.83862"/>
        <point val="12.8674,9.40862"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O90">
      <attribute name="obj_pos">
        <point val="19.9936,9.98862"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8624,9.98362;19.9986,10.5636"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="19.9936,9.98862"/>
        <point val="12.8674,10.5586"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O91">
      <attribute name="obj_pos">
        <point val="19.9936,11.1136"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8624,11.1086;19.9986,11.6886"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="19.9936,11.1136"/>
        <point val="12.8674,11.6836"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O92">
      <attribute name="obj_pos">
        <point val="19.9936,12.2636"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8775,12.2586;19.9986,12.8264"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="19.9936,12.2636"/>
        <point val="12.8825,12.8214"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O93">
      <attribute name="obj_pos">
        <point val="19.9936,13.3886"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8624,13.3836;19.9986,13.9636"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="19.9936,13.3886"/>
        <point val="12.8674,13.9586"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O94">
      <attribute name="obj_pos">
        <point val="19.9936,14.5386"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8624,14.5336;19.9986,15.1136"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="19.9936,14.5386"/>
        <point val="12.8674,15.1086"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O95">
      <attribute name="obj_pos">
        <point val="19.9936,15.6714"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8624,15.6664;19.9986,16.2464"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="19.9936,15.6714"/>
        <point val="12.8674,16.2414"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O96">
      <attribute name="obj_pos">
        <point val="19.9936,16.7964"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8624,16.7914;19.9986,17.3714"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="19.9936,16.7964"/>
        <point val="12.8674,17.3664"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O97">
      <attribute name="obj_pos">
        <point val="19.9936,17.9464"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8624,17.9414;19.9986,18.5214"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="19.9936,17.9464"/>
        <point val="12.8674,18.5164"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O98">
      <attribute name="obj_pos">
        <point val="19.9936,19.0714"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8624,19.0664;19.9986,19.6464"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="19.9936,19.0714"/>
        <point val="12.8674,19.6414"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O99">
      <attribute name="obj_pos">
        <point val="20.0003,20.1881"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8691,20.1831;20.0053,20.7631"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="20.0003,20.1881"/>
        <point val="12.8741,20.7581"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O100">
      <attribute name="obj_pos">
        <point val="20.0062,21.3229"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8691,21.3179;20.0112,21.8591"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="20.0062,21.3229"/>
        <point val="12.8741,21.8541"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O101">
      <attribute name="obj_pos">
        <point val="20.0003,22.3801"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8691,22.3751;20.0053,22.9551"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="20.0003,22.3801"/>
        <point val="12.8741,22.9501"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O102">
      <attribute name="obj_pos">
        <point val="14.2987,19.6678"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2937,19.6628;14.305,20.2428"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.2987,19.6678"/>
        <point val="14.3,20.2378"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O103">
      <attribute name="obj_pos">
        <point val="15.8162,19.6654"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.8112,19.6604;15.8225,20.2404"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.8162,19.6654"/>
        <point val="15.8175,20.2354"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O104">
      <attribute name="obj_pos">
        <point val="17.9912,19.6654"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9862,19.6604;17.9975,20.2404"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.9912,19.6654"/>
        <point val="17.9925,20.2354"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O105">
      <attribute name="obj_pos">
        <point val="14.3162,20.7654"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.3112,20.7604;14.3225,21.3404"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.3162,20.7654"/>
        <point val="14.3175,21.3354"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O106">
      <attribute name="obj_pos">
        <point val="15.8162,20.7904"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.8012,20.7854;15.8212,21.3529"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.8162,20.7904"/>
        <point val="15.8062,21.3479"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O107">
      <attribute name="obj_pos">
        <point val="17.9912,20.7904"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9762,20.7854;17.9962,21.3279"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.9912,20.7904"/>
        <point val="17.9812,21.3229"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O108">
      <attribute name="obj_pos">
        <point val="14.3162,21.8654"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.3112,21.8604;14.3225,22.4404"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.3162,21.8654"/>
        <point val="14.3175,22.4354"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O109">
      <attribute name="obj_pos">
        <point val="15.8162,21.8654"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.8112,21.8604;15.8225,22.4404"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.8162,21.8654"/>
        <point val="15.8175,22.4354"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O110">
      <attribute name="obj_pos">
        <point val="17.9912,21.8654"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9862,21.8604;17.9975,22.4404"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.9912,21.8654"/>
        <point val="17.9925,22.4354"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O111">
      <attribute name="obj_pos">
        <point val="0.992663,23.525"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.987663,23.52;19.9977,27.43"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="0.992663,23.525"/>
      </attribute>
      <attribute name="elem_width">
        <real val="19"/>
      </attribute>
      <attribute name="elem_height">
        <real val="3.9"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O112">
      <attribute name="obj_pos">
        <point val="5.875,27.7975"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.86,27.7825;20.0044,28.6601"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="5.875,27.7975"/>
      </attribute>
      <attribute name="elem_width">
        <real val="14.1144"/>
      </attribute>
      <attribute name="elem_height">
        <real val="0.847604"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.03"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O113">
      <attribute name="obj_pos">
        <point val="16.3342,28.2415"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.3292,28.2163;19.9944,28.2465"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="16.3342,28.2415"/>
        <point val="19.9894,28.2213"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O118" connection="0"/>
        <connection handle="1" to="O112" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O114">
      <attribute name="obj_pos">
        <point val="8.53075,27.8225"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.51531,27.8175;8.53575,28.6605"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="8.53075,27.8225"/>
        <point val="8.52031,28.6555"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O115">
      <attribute name="obj_pos">
        <point val="10.7058,27.7975"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.7008,27.7925;10.7176,28.6655"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.7058,27.7975"/>
        <point val="10.7126,28.6605"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O116">
      <attribute name="obj_pos">
        <point val="11.7058,27.8225"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.7008,27.8175;11.7176,28.6655"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="11.7058,27.8225"/>
        <point val="11.7126,28.6605"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O117">
      <attribute name="obj_pos">
        <point val="14.2808,27.7975"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2758,27.7925;14.2926,28.6655"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.2808,27.7975"/>
        <point val="14.2876,28.6605"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O118">
      <attribute name="obj_pos">
        <point val="16.3308,27.8225"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.3258,27.8175;16.3426,28.6655"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="16.3308,27.8225"/>
        <point val="16.3376,28.6605"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O119">
      <attribute name="obj_pos">
        <point val="17.3558,27.7975"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.3508,27.7925;17.3649,28.6472"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.3558,27.7975"/>
        <point val="17.3599,28.6422"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O120">
      <attribute name="obj_pos">
        <point val="10.7092,28.229"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.7042,28.224;14.2892,28.234"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.7092,28.229"/>
        <point val="14.2842,28.229"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O115" connection="0"/>
        <connection handle="1" to="O117" connection="0"/>
      </connections>
    </object>
  </layer>
  <layer name="&#202;&#184;&#187;&#250;" visible="true">
    <object type="Standard - Text" version="0" id="O121">
      <attribute name="obj_pos">
        <point val="10.0391,4.64904"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.0391,4.42272;11.3178,4.72272"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#169; &#200;&#214; &#185;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.0391,4.64904"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O122">
      <attribute name="obj_pos">
        <point val="6.52269,4.6344"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.52269,4.37036;9.15273,4.72036"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221; &#184;&#177; &#188;&#212; &#200;&#214; &#185;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="6.52269,4.6344"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.215635"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O123">
      <attribute name="obj_pos">
        <point val="12.1684,4.62404"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.1684,4.36;15.9367,4.71"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#229; &#206;&#197; &#181;&#161; &#180;&#216; &#165;&#179; &#161;&#188; &#165;&#201;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.1684,4.62404"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.215635"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O124">
      <attribute name="obj_pos">
        <point val="3.1222,6.70223"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.1222,6.47591;4.09786,6.77591"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;  &#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.1222,6.70223"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O125">
      <attribute name="obj_pos">
        <point val="3.15906,7.57161"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,7.34529;4.13472,7.64529"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;  &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,7.57161"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O126">
      <attribute name="obj_pos">
        <point val="3.15906,8.09166"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,7.86534;4.06806,8.16534"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;&#177;&#161;&#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,8.09166"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O127">
      <attribute name="obj_pos">
        <point val="4.51591,6.91439"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.51591,6.68807;5.30674,6.98807"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#239; &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="4.51591,6.91439"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O128">
      <attribute name="obj_pos">
        <point val="5.64745,6.92295"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.64745,6.73435;6.90995,6.98435"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#191;&#199;&#206;&#197;&#188;&#194;&#198;&#252;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="5.64745,6.92295"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.154025"/>
          </attribute>
          <attribute name="multi">
            <real val="0.12625"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O129">
      <attribute name="obj_pos">
        <point val="8.19229,6.92475"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19229,6.69843;10.0921,6.99843"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#192;       &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="8.19229,6.92475"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O130">
      <attribute name="obj_pos">
        <point val="11.3052,6.93512"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.3052,6.7088;12.8202,7.0088"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#236;&#201;&#244;&#201;&#233;&#195;&#180;&#182;&#226;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="11.3052,6.93512"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O131">
      <attribute name="obj_pos">
        <point val="6.87945,6.33826"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.87945,6.11194;10.6124,6.41194"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#206;&#197;   &#205;&#220;   &#164;&#206;   &#181;&#235;   &#201;&#213;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.87945,6.33826"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O132">
      <attribute name="obj_pos">
        <point val="13.2311,6.92475"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.2311,6.69843;14.0219,6.99843"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#239; &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="13.2311,6.92475"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O133">
      <attribute name="obj_pos">
        <point val="14.6601,6.93512"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.6601,6.7088;15.4509,7.0088"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#178;&#243; &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.6601,6.93512"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O134">
      <attribute name="obj_pos">
        <point val="16.18,6.92475"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.18,6.69843;17.7101,6.99843"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#182;&#226;     &#179;&#219;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="16.18,6.92475"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O135">
      <attribute name="obj_pos">
        <point val="18.2712,6.93512"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.2712,6.7088;19.7862,7.0088"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#201;&#184;&#189;&#224;&#201;&#233;&#195;&#180;&#179;&#219;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="18.2712,6.93512"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O136">
      <attribute name="obj_pos">
        <point val="14.8223,6.31934"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8223,6.09302;18.6583,6.39302"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#191;&#169; &#187;&#246; &#206;&#197; &#205;&#220;&#161;&#166;&#192;&#184; &#179;&#232; &#206;&#197; &#205;&#220;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.8223,6.31934"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O137">
      <attribute name="obj_pos">
        <point val="3.15906,8.6681"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,8.44178;4.13472,8.74178"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;  &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,8.6681"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O138">
      <attribute name="obj_pos">
        <point val="3.15906,9.8181"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,9.59178;4.13472,9.89178"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;  &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,9.8181"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O139">
      <attribute name="obj_pos">
        <point val="3.15906,10.9431"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,10.7168;4.13472,11.0168"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;  &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,10.9431"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O140">
      <attribute name="obj_pos">
        <point val="3.15906,12.0681"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,11.8418;4.13472,12.1418"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;  &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,12.0681"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O141">
      <attribute name="obj_pos">
        <point val="3.15906,13.2431"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,13.0168;4.13472,13.3168"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;  &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,13.2431"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O142">
      <attribute name="obj_pos">
        <point val="3.15906,14.3431"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,14.1168;4.13472,14.4168"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;  &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,14.3431"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O143">
      <attribute name="obj_pos">
        <point val="3.15906,15.4931"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,15.2668;4.13472,15.5668"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;  &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,15.4931"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O144">
      <attribute name="obj_pos">
        <point val="3.15906,16.6431"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,16.4168;4.13472,16.7168"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;  &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,16.6431"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O145">
      <attribute name="obj_pos">
        <point val="3.15906,17.7681"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,17.5418;4.13472,17.8418"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;  &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,17.7681"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O146">
      <attribute name="obj_pos">
        <point val="3.15906,18.8931"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,18.6668;4.13472,18.9668"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;  &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,18.8931"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O147">
      <attribute name="obj_pos">
        <point val="3.15906,9.2681"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,9.04178;4.06806,9.34178"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;&#177;&#161;&#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,9.2681"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O148">
      <attribute name="obj_pos">
        <point val="3.15906,10.3931"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,10.1668;4.06806,10.4668"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;&#177;&#161;&#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,10.3931"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O149">
      <attribute name="obj_pos">
        <point val="3.15906,11.5181"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,11.2918;4.06806,11.5918"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;&#177;&#161;&#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,11.5181"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O150">
      <attribute name="obj_pos">
        <point val="3.15906,12.6681"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,12.4418;4.06806,12.7418"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;&#177;&#161;&#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,12.6681"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O151">
      <attribute name="obj_pos">
        <point val="3.15906,13.7931"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,13.5668;4.06806,13.8668"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;&#177;&#161;&#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,13.7931"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O152">
      <attribute name="obj_pos">
        <point val="3.15906,14.9431"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,14.7168;4.06806,15.0168"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;&#177;&#161;&#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,14.9431"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O153">
      <attribute name="obj_pos">
        <point val="3.15906,16.0681"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,15.8418;4.06806,16.1418"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;&#177;&#161;&#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,16.0681"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O154">
      <attribute name="obj_pos">
        <point val="3.15906,17.2431"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,17.0168;4.06806,17.3168"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;&#177;&#161;&#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,17.2431"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O155">
      <attribute name="obj_pos">
        <point val="3.15906,18.3431"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,18.1168;4.06806,18.4168"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;&#177;&#161;&#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,18.3431"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O156">
      <attribute name="obj_pos">
        <point val="3.15906,19.4681"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,19.2418;4.06806,19.5418"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;&#177;&#161;&#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,19.4681"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O157">
      <attribute name="obj_pos">
        <point val="3.15906,20.0775"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,19.8512;4.13472,20.1512"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;  &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,20.0775"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O158">
      <attribute name="obj_pos">
        <point val="3.15906,21.1735"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,20.9472;4.13472,21.2472"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;  &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,21.1735"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O159">
      <attribute name="obj_pos">
        <point val="3.15906,22.2697"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,22.0434;4.13472,22.3434"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;  &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,22.2697"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O160">
      <attribute name="obj_pos">
        <point val="3.15906,20.6078"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,20.3815;4.06806,20.6815"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;&#177;&#161;&#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,20.6078"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O161">
      <attribute name="obj_pos">
        <point val="3.15906,21.704"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,21.4777;4.06806,21.7777"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;&#177;&#161;&#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,21.704"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O162">
      <attribute name="obj_pos">
        <point val="3.15906,22.8001"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15906,22.5738;4.06806,22.8738"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;&#177;&#161;&#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15906,22.8001"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O163">
      <attribute name="obj_pos">
        <point val="1.09013,5.8341"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.09013,5.60778;3.88379,5.90778"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#248;&#200;&#241;&#201;&#233;&#195;&#180;&#176;&#229;&#206;&#197;(&#186;&#198;&#183;&#199;)#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.09013,5.8341"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O164">
      <attribute name="obj_pos">
        <point val="9.98304,5.47543"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.98304,4.94736;11.397,5.64736"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#176;&#163;&#183;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.7"/>
          </attribute>
          <attribute name="pos">
            <point val="9.98304,5.47543"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.43127"/>
          </attribute>
          <attribute name="multi">
            <real val="0.3535"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O165">
      <attribute name="obj_pos">
        <point val="1.24766,23.992"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.24766,23.7657;2.96264,24.0657"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#200;&#247;      &#185;&#205;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.24766,23.992"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O166">
      <attribute name="obj_pos">
        <point val="10.8958,28.117"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.8958,27.8907;11.6866,28.1907"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#239; &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.8958,28.117"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O167">
      <attribute name="obj_pos">
        <point val="10.8958,28.517"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.8958,28.2907;11.6866,28.5907"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#182;&#226; &#179;&#219;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.8958,28.517"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O168">
      <attribute name="obj_pos">
        <point val="16.5227,28.542"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5227,28.3157;17.3135,28.6157"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#182;&#226; &#179;&#219;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="16.5227,28.542"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O169">
      <attribute name="obj_pos">
        <point val="16.5227,28.117"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5227,27.8907;17.3135,28.1907"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#239; &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="16.5227,28.117"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O170">
      <attribute name="obj_pos">
        <point val="8.79766,28.192"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.79766,27.9657;10.6975,28.5657"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#236;       &#200;&#204;
&#200;&#239; &#202;&#221; &#184;&#177; &#188;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="8.79766,28.192"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O171">
      <attribute name="obj_pos">
        <point val="6.17266,28.317"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.17266,28.0907;8.36032,28.3907"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#162;&#168;  &#185;&#226;&#179;&#219;&#176;&#229;&#206;&#197;&#200;&#241;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.17266,28.317"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O172">
      <attribute name="obj_pos">
        <point val="14.5977,28.317"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.5977,28.0907;16.246,28.3907"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#194;&#224;  &#191;&#166;  &#188;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.5977,28.317"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O173">
      <attribute name="obj_pos">
        <point val="1.15689,28.492"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.15689,28.2657;5.70189,28.5657"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#195;&#237;&#161;&#203;&#162;&#168;&#176;&#245;&#164;&#206;&#205;&#243;&#164;&#207;&#181;&#173;&#198;&#254;&#164;&#183;&#164;&#202;&#164;&#164;&#164;&#179;&#164;&#200;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.15689,28.492"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
  </layer>
  <layer name="&#186;&#185;&#164;&#183;&#185;&#254;&#164;&#223;" visible="true">
    <object type="Embed - Text" version="0" id="O174">
      <attribute name="obj_pos">
        <point val="5.6192,5.48108"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.6192,4.95301;9.8612,5.65301"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#177;&#163;&#178;&#163;&#179;&#163;&#180;&#163;&#181;&#163;&#182;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.7"/>
          </attribute>
          <attribute name="pos">
            <point val="5.6192,5.48108"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.43127"/>
          </attribute>
          <attribute name="multi">
            <real val="0.3535"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O175">
      <attribute name="obj_pos">
        <point val="11.5542,5.47835"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.5542,4.95028;16.5032,5.65028"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HOSPCD#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#177;&#163;&#178;&#163;&#179;&#163;&#180;&#163;&#181;&#163;&#182;&#163;&#183;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.7"/>
          </attribute>
          <attribute name="pos">
            <point val="11.5542,5.47835"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.43127"/>
          </attribute>
          <attribute name="multi">
            <real val="0.3535"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O176">
      <attribute name="obj_pos">
        <point val="1.24861,7.99236"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.24861,7.76604;2.76361,8.06604"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[0].KOHNAME#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.24861,7.99236"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O177">
      <attribute name="obj_pos">
        <point val="1.24861,8.94707"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.24861,8.72075;2.76361,9.02075"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[1].KOHNAME#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.24861,8.94707"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O178">
      <attribute name="obj_pos">
        <point val="1.24861,10.0786"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.24861,9.85228;2.76361,10.1523"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[2].KOHNAME#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.24861,10.0786"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O179">
      <attribute name="obj_pos">
        <point val="1.24861,11.2259"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.24861,10.9996;2.76361,11.2996"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[3].KOHNAME#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.24861,11.2259"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O180">
      <attribute name="obj_pos">
        <point val="1.24861,12.3729"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.24861,12.1466;2.76361,12.4466"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[4].KOHNAME#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.24861,12.3729"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O181">
      <attribute name="obj_pos">
        <point val="1.24861,13.5396"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.24861,13.3133;2.76361,13.6133"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[5].KOHNAME#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.24861,13.5396"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O182">
      <attribute name="obj_pos">
        <point val="1.24861,14.671"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.24861,14.4447;2.76361,14.7447"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[6].KOHNAME#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.24861,14.671"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O183">
      <attribute name="obj_pos">
        <point val="1.24861,15.8024"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.24861,15.5761;2.76361,15.8761"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[7].KOHNAME#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.24861,15.8024"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O184">
      <attribute name="obj_pos">
        <point val="1.24861,16.9337"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.24861,16.7074;2.76361,17.0074"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[8].KOHNAME#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.24861,16.9337"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O185">
      <attribute name="obj_pos">
        <point val="1.24861,18.0651"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.24861,17.8388;2.76361,18.1388"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[9].KOHNAME#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.24861,18.0651"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O186">
      <attribute name="obj_pos">
        <point val="1.24861,19.1965"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.24861,18.9702;2.94844,19.2702"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[10].KOHNAME#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;v&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.24861,19.1965"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O187">
      <attribute name="obj_pos">
        <point val="1.24861,20.3278"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.24861,20.1015;2.76361,20.4015"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[11].KOHNAME#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.24861,20.3278"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O188">
      <attribute name="obj_pos">
        <point val="1.24861,21.4239"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.24861,21.1976;2.76361,21.4976"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[12].KOHNAME#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.24861,21.4239"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O189">
      <attribute name="obj_pos">
        <point val="1.24861,22.5552"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.24861,22.3289;2.76361,22.6289"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[13].KOHNAME#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.24861,22.5552"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O190">
      <attribute name="obj_pos">
        <point val="10.3893,3.62468"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3893,3.17205;10.9953,3.77205"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAI1#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#186;&#223;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3893,3.62468"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.36966"/>
          </attribute>
          <attribute name="multi">
            <real val="0.303"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O191">
      <attribute name="obj_pos">
        <point val="10.3362,3.73076"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3362,3.12725;11.1442,3.92725"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAI2#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#162;&#254;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.8"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3362,3.73076"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.49288"/>
          </attribute>
          <attribute name="multi">
            <real val="0.404"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O192">
      <attribute name="obj_pos">
        <point val="5.3,7.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,7.37368;5.3,7.67368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[0].NYUGAI-TBL[0].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,7.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O193">
      <attribute name="obj_pos">
        <point val="5.3,8.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,7.82368;5.3,8.12368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[0].NYUGAI-TBL[1].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,8.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O194">
      <attribute name="obj_pos">
        <point val="5.3,8.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,8.47368;5.3,8.77368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[1].NYUGAI-TBL[0].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,8.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O195">
      <attribute name="obj_pos">
        <point val="5.3,9.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,9.02368;5.3,9.32368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[1].NYUGAI-TBL[1].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,9.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O196">
      <attribute name="obj_pos">
        <point val="5.3,9.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,9.57368;5.3,9.87368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[2].NYUGAI-TBL[0].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,9.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O197">
      <attribute name="obj_pos">
        <point val="5.3,10.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,10.1237;5.3,10.4237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[2].NYUGAI-TBL[1].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,10.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O198">
      <attribute name="obj_pos">
        <point val="5.3,10.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,10.7237;5.3,11.0237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[3].NYUGAI-TBL[0].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,10.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O199">
      <attribute name="obj_pos">
        <point val="5.3,11.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,11.2737;5.3,11.5737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[3].NYUGAI-TBL[1].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,11.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O200">
      <attribute name="obj_pos">
        <point val="5.3,12.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,11.8737;5.3,12.1737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[4].NYUGAI-TBL[0].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,12.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O201">
      <attribute name="obj_pos">
        <point val="5.3,12.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,12.4237;5.3,12.7237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[4].NYUGAI-TBL[1].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,12.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O202">
      <attribute name="obj_pos">
        <point val="5.275,13.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.35085,13.0237;5.275,13.3237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[5].NYUGAI-TBL[0].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.275,13.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O203">
      <attribute name="obj_pos">
        <point val="5.3,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,13.5737;5.3,13.8737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[5].NYUGAI-TBL[1].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O204">
      <attribute name="obj_pos">
        <point val="5.3,14.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,14.1237;5.3,14.4237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[6].NYUGAI-TBL[0].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,14.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O205">
      <attribute name="obj_pos">
        <point val="5.3,14.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,14.7237;5.3,15.0237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[6].NYUGAI-TBL[1].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,14.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O206">
      <attribute name="obj_pos">
        <point val="5.3,15.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,15.2737;5.3,15.5737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[7].NYUGAI-TBL[0].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,15.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O207">
      <attribute name="obj_pos">
        <point val="5.3,16.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,15.8237;5.3,16.1237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[7].NYUGAI-TBL[1].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,16.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O208">
      <attribute name="obj_pos">
        <point val="5.3,16.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,16.4237;5.3,16.7237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[8].NYUGAI-TBL[0].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,16.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O209">
      <attribute name="obj_pos">
        <point val="5.3,17.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,16.9737;5.3,17.2737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[8].NYUGAI-TBL[1].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,17.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O210">
      <attribute name="obj_pos">
        <point val="5.3,17.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,17.5237;5.3,17.8237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[9].NYUGAI-TBL[0].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,17.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O211">
      <attribute name="obj_pos">
        <point val="5.3,18.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,18.1237;5.3,18.4237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[9].NYUGAI-TBL[1].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,18.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O212">
      <attribute name="obj_pos">
        <point val="5.3,18.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,18.6737;5.3,18.9737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[10].NYUGAI-TBL[0].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,18.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O213">
      <attribute name="obj_pos">
        <point val="5.3,19.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,19.2737;5.3,19.5737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[10].NYUGAI-TBL[1].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,19.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O214">
      <attribute name="obj_pos">
        <point val="5.3,20.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,19.8237;5.3,20.1237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[11].NYUGAI-TBL[0].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,20.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O215">
      <attribute name="obj_pos">
        <point val="5.3,20.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,20.3737;5.3,20.6737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[11].NYUGAI-TBL[1].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,20.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O216">
      <attribute name="obj_pos">
        <point val="5.3,21.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,20.9737;5.3,21.2737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[12].NYUGAI-TBL[0].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,21.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O217">
      <attribute name="obj_pos">
        <point val="5.3,21.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,21.4737;5.3,21.7737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[12].NYUGAI-TBL[1].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,21.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O218">
      <attribute name="obj_pos">
        <point val="5.3,22.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,22.0237;5.3,22.3237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[13].NYUGAI-TBL[0].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,22.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O219">
      <attribute name="obj_pos">
        <point val="5.3,22.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.37585,22.5737;5.3,22.8737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[13].NYUGAI-TBL[1].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3,22.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O220">
      <attribute name="obj_pos">
        <point val="10.65,7.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,7.37368;10.65,7.67368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[0].NYUGAI-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,7.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O221">
      <attribute name="obj_pos">
        <point val="10.65,8.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,7.82368;10.65,8.12368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[0].NYUGAI-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,8.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O222">
      <attribute name="obj_pos">
        <point val="10.65,8.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,8.47368;10.65,8.77368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[1].NYUGAI-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,8.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O223">
      <attribute name="obj_pos">
        <point val="10.65,9.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,9.02368;10.65,9.32368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[1].NYUGAI-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,9.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O224">
      <attribute name="obj_pos">
        <point val="10.65,9.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,9.57368;10.65,9.87368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[2].NYUGAI-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,9.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O225">
      <attribute name="obj_pos">
        <point val="10.65,10.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,10.1237;10.65,10.4237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[2].NYUGAI-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,10.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O226">
      <attribute name="obj_pos">
        <point val="10.65,10.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,10.7237;10.65,11.0237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[3].NYUGAI-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,10.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O227">
      <attribute name="obj_pos">
        <point val="10.65,11.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,11.2737;10.65,11.5737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[3].NYUGAI-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,11.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O228">
      <attribute name="obj_pos">
        <point val="10.65,12.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,11.8737;10.65,12.1737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[4].NYUGAI-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,12.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O229">
      <attribute name="obj_pos">
        <point val="10.65,12.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,12.4237;10.65,12.7237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[4].NYUGAI-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,12.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O230">
      <attribute name="obj_pos">
        <point val="10.65,13.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,13.0237;10.65,13.3237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[5].NYUGAI-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,13.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O231">
      <attribute name="obj_pos">
        <point val="10.65,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,13.5737;10.65,13.8737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[5].NYUGAI-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O232">
      <attribute name="obj_pos">
        <point val="10.65,14.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,14.1237;10.65,14.4237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[6].NYUGAI-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,14.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O233">
      <attribute name="obj_pos">
        <point val="10.65,14.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,14.7237;10.65,15.0237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[6].NYUGAI-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,14.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O234">
      <attribute name="obj_pos">
        <point val="10.65,15.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,15.2737;10.65,15.5737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[7].NYUGAI-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,15.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O235">
      <attribute name="obj_pos">
        <point val="10.65,16.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,15.8237;10.65,16.1237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[7].NYUGAI-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,16.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O236">
      <attribute name="obj_pos">
        <point val="10.65,16.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,16.4237;10.65,16.7237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[8].NYUGAI-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,16.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O237">
      <attribute name="obj_pos">
        <point val="10.65,17.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,16.9737;10.65,17.2737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[8].NYUGAI-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,17.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O238">
      <attribute name="obj_pos">
        <point val="10.65,17.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,17.5237;10.65,17.8237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[9].NYUGAI-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,17.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O239">
      <attribute name="obj_pos">
        <point val="10.65,18.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,18.1237;10.65,18.4237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[9].NYUGAI-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,18.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O240">
      <attribute name="obj_pos">
        <point val="10.65,18.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,18.6737;10.65,18.9737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[10].NYUGAI-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,18.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O241">
      <attribute name="obj_pos">
        <point val="10.65,19.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,19.2737;10.65,19.5737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[10].NYUGAI-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,19.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O242">
      <attribute name="obj_pos">
        <point val="10.65,20.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,19.8237;10.65,20.1237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[11].NYUGAI-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,20.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O243">
      <attribute name="obj_pos">
        <point val="10.65,20.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,20.3737;10.65,20.6737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[11].NYUGAI-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,20.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O244">
      <attribute name="obj_pos">
        <point val="10.65,21.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,20.9737;10.65,21.2737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[12].NYUGAI-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,21.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O245">
      <attribute name="obj_pos">
        <point val="10.65,21.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,21.4737;10.65,21.7737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[12].NYUGAI-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,21.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O246">
      <attribute name="obj_pos">
        <point val="10.65,22.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,22.0237;10.65,22.3237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[13].NYUGAI-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,22.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O247">
      <attribute name="obj_pos">
        <point val="10.65,22.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8017,22.5737;10.65,22.8737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[13].NYUGAI-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,22.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O248">
      <attribute name="obj_pos">
        <point val="12.85,7.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,7.37368;12.85,7.67368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[0].NYUGAI-TBL[0].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,7.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O249">
      <attribute name="obj_pos">
        <point val="12.85,8.025"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,7.79868;12.85,8.09868"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[0].NYUGAI-TBL[1].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,8.025"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O250">
      <attribute name="obj_pos">
        <point val="12.85,8.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,8.47368;12.85,8.77368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[1].NYUGAI-TBL[0].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,8.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O251">
      <attribute name="obj_pos">
        <point val="12.85,9.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,9.02368;12.85,9.32368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[1].NYUGAI-TBL[1].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,9.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O252">
      <attribute name="obj_pos">
        <point val="12.85,9.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,9.57368;12.85,9.87368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[2].NYUGAI-TBL[0].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,9.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O253">
      <attribute name="obj_pos">
        <point val="12.85,10.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,10.1237;12.85,10.4237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[2].NYUGAI-TBL[1].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,10.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O254">
      <attribute name="obj_pos">
        <point val="12.85,10.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,10.7237;12.85,11.0237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[3].NYUGAI-TBL[0].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,10.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O255">
      <attribute name="obj_pos">
        <point val="12.85,11.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,11.2737;12.85,11.5737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[3].NYUGAI-TBL[1].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,11.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O256">
      <attribute name="obj_pos">
        <point val="12.85,12.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,11.8737;12.85,12.1737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[4].NYUGAI-TBL[0].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,12.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O257">
      <attribute name="obj_pos">
        <point val="12.85,12.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,12.4237;12.85,12.7237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[4].NYUGAI-TBL[1].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,12.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O258">
      <attribute name="obj_pos">
        <point val="12.85,13.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,13.0237;12.85,13.3237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[5].NYUGAI-TBL[0].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,13.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O259">
      <attribute name="obj_pos">
        <point val="12.85,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,13.5737;12.85,13.8737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[5].NYUGAI-TBL[1].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O260">
      <attribute name="obj_pos">
        <point val="12.85,14.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,14.1237;12.85,14.4237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[6].NYUGAI-TBL[0].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,14.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O261">
      <attribute name="obj_pos">
        <point val="12.85,14.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,14.7237;12.85,15.0237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[6].NYUGAI-TBL[1].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,14.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O262">
      <attribute name="obj_pos">
        <point val="12.85,15.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,15.2737;12.85,15.5737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[7].NYUGAI-TBL[0].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,15.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O263">
      <attribute name="obj_pos">
        <point val="12.85,16.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,15.8237;12.85,16.1237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[7].NYUGAI-TBL[1].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,16.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O264">
      <attribute name="obj_pos">
        <point val="12.85,16.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,16.4237;12.85,16.7237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[8].NYUGAI-TBL[0].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,16.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O265">
      <attribute name="obj_pos">
        <point val="12.85,17.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,16.9737;12.85,17.2737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[8].NYUGAI-TBL[1].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,17.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O266">
      <attribute name="obj_pos">
        <point val="12.85,17.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,17.5237;12.85,17.8237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[9].NYUGAI-TBL[0].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,17.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O267">
      <attribute name="obj_pos">
        <point val="12.85,18.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,18.1237;12.85,18.4237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[9].NYUGAI-TBL[1].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,18.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O268">
      <attribute name="obj_pos">
        <point val="12.85,18.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,18.6737;12.85,18.9737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[10].NYUGAI-TBL[0].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,18.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O269">
      <attribute name="obj_pos">
        <point val="12.85,19.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,19.2737;12.85,19.5737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[10].NYUGAI-TBL[1].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,19.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O270">
      <attribute name="obj_pos">
        <point val="12.85,20.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,19.8237;12.85,20.1237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[11].NYUGAI-TBL[0].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,20.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O271">
      <attribute name="obj_pos">
        <point val="12.85,20.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,20.3737;12.85,20.6737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[11].NYUGAI-TBL[1].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,20.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O272">
      <attribute name="obj_pos">
        <point val="12.85,21.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,20.9737;12.85,21.2737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[12].NYUGAI-TBL[0].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,21.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O273">
      <attribute name="obj_pos">
        <point val="12.85,21.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,21.4737;12.85,21.7737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[12].NYUGAI-TBL[1].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,21.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O274">
      <attribute name="obj_pos">
        <point val="12.85,22.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,22.0237;12.85,22.3237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[13].NYUGAI-TBL[0].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,22.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O275">
      <attribute name="obj_pos">
        <point val="12.85,22.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.1865,22.5737;12.85,22.8737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[13].NYUGAI-TBL[1].ITBFTN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.85,22.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O276">
      <attribute name="obj_pos">
        <point val="14.05,7.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1258,7.37368;14.05,7.67368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[0].S-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,7.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O277">
      <attribute name="obj_pos">
        <point val="14.05,8.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1258,8.47368;14.05,8.77368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[1].S-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,8.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O278">
      <attribute name="obj_pos">
        <point val="14.05,9.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1258,9.57368;14.05,9.87368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[2].S-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,9.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O279">
      <attribute name="obj_pos">
        <point val="14.05,10.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1258,10.7237;14.05,11.0237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[3].S-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,10.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O280">
      <attribute name="obj_pos">
        <point val="14.05,12.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1258,11.8737;14.05,12.1737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[4].S-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,12.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O281">
      <attribute name="obj_pos">
        <point val="14.05,13.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1258,13.0237;14.05,13.3237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[5].S-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,13.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O282">
      <attribute name="obj_pos">
        <point val="14.05,14.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1258,14.1237;14.05,14.4237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[6].S-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,14.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O283">
      <attribute name="obj_pos">
        <point val="14.05,15.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1258,15.2737;14.05,15.5737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[7].S-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,15.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O284">
      <attribute name="obj_pos">
        <point val="14.05,16.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1258,16.4237;14.05,16.7237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[8].S-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,16.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O285">
      <attribute name="obj_pos">
        <point val="14.05,17.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1258,17.5237;14.05,17.8237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[9].S-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,17.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O286">
      <attribute name="obj_pos">
        <point val="14.05,18.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1258,18.6737;14.05,18.9737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[10].S-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,18.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O287">
      <attribute name="obj_pos">
        <point val="14.05,20.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1258,19.8237;14.05,20.1237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[11].S-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,20.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O288">
      <attribute name="obj_pos">
        <point val="14.05,21.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1258,20.9737;14.05,21.2737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[12].S-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,21.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O289">
      <attribute name="obj_pos">
        <point val="14.05,22.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1258,22.0237;14.05,22.3237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[13].S-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,22.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O290">
      <attribute name="obj_pos">
        <point val="15.5,7.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.5758,7.37368;15.5,7.67368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[0].S-NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.5,7.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O291">
      <attribute name="obj_pos">
        <point val="15.5,8.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.5758,8.47368;15.5,8.77368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[1].S-NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.5,8.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O292">
      <attribute name="obj_pos">
        <point val="15.5,9.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.5758,9.57368;15.5,9.87368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[2].S-NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.5,9.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O293">
      <attribute name="obj_pos">
        <point val="15.5,10.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.5758,10.7237;15.5,11.0237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[3].S-NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.5,10.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O294">
      <attribute name="obj_pos">
        <point val="15.5,12.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.5758,11.8737;15.5,12.1737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[4].S-NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.5,12.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O295">
      <attribute name="obj_pos">
        <point val="15.5,13.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.5758,13.0237;15.5,13.3237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[5].S-NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.5,13.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O296">
      <attribute name="obj_pos">
        <point val="15.5,14.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.5758,14.1237;15.5,14.4237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[6].S-NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.5,14.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O297">
      <attribute name="obj_pos">
        <point val="15.5,15.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.5758,15.2737;15.5,15.5737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[7].S-NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.5,15.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O298">
      <attribute name="obj_pos">
        <point val="15.5,16.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.5758,16.4237;15.5,16.7237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[8].S-NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.5,16.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O299">
      <attribute name="obj_pos">
        <point val="15.5,17.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.5758,17.5237;15.5,17.8237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[9].S-NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.5,17.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O300">
      <attribute name="obj_pos">
        <point val="15.5,18.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.5758,18.6737;15.5,18.9737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[10].S-NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.5,18.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O301">
      <attribute name="obj_pos">
        <point val="15.5,20.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.5758,19.8237;15.5,20.1237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[11].S-NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.5,20.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O302">
      <attribute name="obj_pos">
        <point val="15.5,21.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.5758,20.9737;15.5,21.2737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[12].S-NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.5,21.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O303">
      <attribute name="obj_pos">
        <point val="15.5,22.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.5758,22.0237;15.5,22.3237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[13].S-NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.5,22.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O304">
      <attribute name="obj_pos">
        <point val="17.65,7.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.9865,7.37368;17.65,7.67368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[0].S-KINGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.65,7.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O305">
      <attribute name="obj_pos">
        <point val="17.65,8.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.9865,8.47368;17.65,8.77368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[1].S-KINGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.65,8.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O306">
      <attribute name="obj_pos">
        <point val="17.65,9.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.9865,9.57368;17.65,9.87368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[2].S-KINGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.65,9.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O307">
      <attribute name="obj_pos">
        <point val="17.65,10.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.9865,10.7237;17.65,11.0237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[3].S-KINGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.65,10.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O308">
      <attribute name="obj_pos">
        <point val="17.65,12.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.9865,11.8737;17.65,12.1737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[4].S-KINGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.65,12.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O309">
      <attribute name="obj_pos">
        <point val="17.65,13.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.9865,13.0237;17.65,13.3237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[5].S-KINGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.65,13.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O310">
      <attribute name="obj_pos">
        <point val="17.65,14.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.9865,14.1237;17.65,14.4237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[6].S-KINGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.65,14.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O311">
      <attribute name="obj_pos">
        <point val="17.65,15.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.9865,15.2737;17.65,15.5737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[7].S-KINGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.65,15.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O312">
      <attribute name="obj_pos">
        <point val="17.65,16.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.9865,16.4237;17.65,16.7237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[8].S-KINGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.65,16.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O313">
      <attribute name="obj_pos">
        <point val="17.65,17.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.9865,17.5237;17.65,17.8237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[9].S-KINGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.65,17.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O314">
      <attribute name="obj_pos">
        <point val="17.65,18.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.9865,18.6737;17.65,18.9737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[10].S-KINGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.65,18.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O315">
      <attribute name="obj_pos">
        <point val="17.65,20.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.9865,19.8237;17.65,20.1237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[11].S-KINGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.65,20.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O316">
      <attribute name="obj_pos">
        <point val="17.65,21.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.9865,20.9737;17.65,21.2737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[12].S-KINGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.65,21.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O317">
      <attribute name="obj_pos">
        <point val="17.65,22.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.9865,22.0237;17.65,22.3237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[13].S-KINGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.65,22.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O318">
      <attribute name="obj_pos">
        <point val="19.65,7.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9865,7.37368;19.65,7.67368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[0].S-FTNGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="19.65,7.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O319">
      <attribute name="obj_pos">
        <point val="19.65,8.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9865,8.47368;19.65,8.77368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[1].S-FTNGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="19.65,8.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O320">
      <attribute name="obj_pos">
        <point val="19.65,9.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9865,9.57368;19.65,9.87368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[2].S-FTNGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="19.65,9.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O321">
      <attribute name="obj_pos">
        <point val="19.65,10.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9865,10.7237;19.65,11.0237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[3].S-FTNGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="19.65,10.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O322">
      <attribute name="obj_pos">
        <point val="19.65,12.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9865,11.8737;19.65,12.1737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[4].S-FTNGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="19.65,12.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O323">
      <attribute name="obj_pos">
        <point val="19.65,13.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9865,13.0237;19.65,13.3237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[5].S-FTNGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="19.65,13.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O324">
      <attribute name="obj_pos">
        <point val="19.65,14.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9865,14.1237;19.65,14.4237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[6].S-FTNGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="19.65,14.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O325">
      <attribute name="obj_pos">
        <point val="19.65,15.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9865,15.2737;19.65,15.5737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[7].S-FTNGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="19.65,15.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O326">
      <attribute name="obj_pos">
        <point val="19.65,16.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9865,16.4237;19.65,16.7237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[8].S-FTNGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="19.65,16.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O327">
      <attribute name="obj_pos">
        <point val="19.65,17.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9865,17.5237;19.65,17.8237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[9].S-FTNGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="19.65,17.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O328">
      <attribute name="obj_pos">
        <point val="19.65,18.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9865,18.6737;19.65,18.9737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[10].S-FTNGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="19.65,18.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O329">
      <attribute name="obj_pos">
        <point val="19.65,20.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9865,19.8237;19.65,20.1237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[11].S-FTNGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="19.65,20.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O330">
      <attribute name="obj_pos">
        <point val="19.65,21.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9865,20.9737;19.65,21.2737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[12].S-FTNGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="19.65,21.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O331">
      <attribute name="obj_pos">
        <point val="19.65,22.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9865,22.0237;19.65,22.3237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[13].S-FTNGAKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="19.65,22.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O332">
      <attribute name="obj_pos">
        <point val="6.775,7.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,7.37368;6.775,7.67368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[0].NYUGAI-TBL[0].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,7.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O333">
      <attribute name="obj_pos">
        <point val="6.775,8.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,7.82368;6.775,8.12368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[0].NYUGAI-TBL[1].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,8.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O334">
      <attribute name="obj_pos">
        <point val="6.775,8.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,8.47368;6.775,8.77368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[1].NYUGAI-TBL[0].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,8.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O335">
      <attribute name="obj_pos">
        <point val="6.775,9.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,9.02368;6.775,9.32368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[1].NYUGAI-TBL[1].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,9.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O336">
      <attribute name="obj_pos">
        <point val="6.775,9.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,9.57368;6.775,9.87368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[2].NYUGAI-TBL[0].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,9.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O337">
      <attribute name="obj_pos">
        <point val="6.775,10.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,10.1237;6.775,10.4237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[2].NYUGAI-TBL[1].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,10.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O338">
      <attribute name="obj_pos">
        <point val="6.775,10.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,10.7237;6.775,11.0237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[3].NYUGAI-TBL[0].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,10.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O339">
      <attribute name="obj_pos">
        <point val="6.775,11.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,11.2737;6.775,11.5737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[3].NYUGAI-TBL[1].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,11.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O340">
      <attribute name="obj_pos">
        <point val="6.775,12.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,11.8737;6.775,12.1737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[4].NYUGAI-TBL[0].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,12.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O341">
      <attribute name="obj_pos">
        <point val="6.775,12.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,12.4237;6.775,12.7237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[4].NYUGAI-TBL[1].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,12.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O342">
      <attribute name="obj_pos">
        <point val="6.775,13.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,13.0237;6.775,13.3237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[5].NYUGAI-TBL[0].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,13.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O343">
      <attribute name="obj_pos">
        <point val="6.775,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,13.5737;6.775,13.8737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[5].NYUGAI-TBL[1].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O344">
      <attribute name="obj_pos">
        <point val="6.775,14.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,14.1237;6.775,14.4237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[6].NYUGAI-TBL[0].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,14.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O345">
      <attribute name="obj_pos">
        <point val="6.775,14.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,14.7237;6.775,15.0237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[6].NYUGAI-TBL[1].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,14.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O346">
      <attribute name="obj_pos">
        <point val="6.775,15.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,15.2737;6.775,15.5737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[7].NYUGAI-TBL[0].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,15.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O347">
      <attribute name="obj_pos">
        <point val="6.775,16.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,15.8237;6.775,16.1237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[7].NYUGAI-TBL[1].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,16.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O348">
      <attribute name="obj_pos">
        <point val="6.775,16.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,16.4237;6.775,16.7237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[8].NYUGAI-TBL[0].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,16.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O349">
      <attribute name="obj_pos">
        <point val="6.775,17.2125"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,16.9862;6.775,17.2862"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[8].NYUGAI-TBL[1].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,17.2125"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O350">
      <attribute name="obj_pos">
        <point val="6.775,17.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,17.5237;6.775,17.8237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[9].NYUGAI-TBL[0].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,17.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O351">
      <attribute name="obj_pos">
        <point val="6.775,18.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,18.1237;6.775,18.4237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[9].NYUGAI-TBL[1].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,18.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O352">
      <attribute name="obj_pos">
        <point val="6.775,18.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,18.6737;6.775,18.9737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[10].NYUGAI-TBL[0].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,18.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O353">
      <attribute name="obj_pos">
        <point val="6.775,19.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,19.2737;6.775,19.5737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[10].NYUGAI-TBL[1].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,19.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O354">
      <attribute name="obj_pos">
        <point val="6.775,20.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,19.8237;6.775,20.1237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[11].NYUGAI-TBL[0].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,20.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O355">
      <attribute name="obj_pos">
        <point val="6.775,20.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,20.3737;6.775,20.6737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[11].NYUGAI-TBL[1].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,20.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O356">
      <attribute name="obj_pos">
        <point val="6.775,21.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,20.9737;6.775,21.2737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[12].NYUGAI-TBL[0].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,21.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O357">
      <attribute name="obj_pos">
        <point val="6.775,21.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,21.4737;6.775,21.7737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[12].NYUGAI-TBL[1].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,21.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O358">
      <attribute name="obj_pos">
        <point val="6.75,22.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.82585,22.0237;6.75,22.3237"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[13].NYUGAI-TBL[0].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.75,22.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O359">
      <attribute name="obj_pos">
        <point val="6.775,22.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.85085,22.5737;6.775,22.8737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOH-TBL[13].NYUGAI-TBL[1].NISSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="1"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.775,22.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O360">
      <attribute name="obj_pos">
        <point val="19,1.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.2607,1.27368;19,1.57368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#NO#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1234#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="19,1.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.18483"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
  </layer>
</diagram>
