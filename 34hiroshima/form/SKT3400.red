<?xml version="1.0"?>
<diagram xmlns:dia="http://www.lysator.liu.se/~alla/dia/">
  <dictionarydata>
    <element name="SEIYM" occurs="1">
      <appinfo>
        <embed object="string" length="16"/>
      </appinfo>
    </element>
    <element name="POST1" occurs="3">
      <appinfo>
        <embed object="string" length="1"/>
      </appinfo>
    </element>
    <element name="POST2" occurs="4">
      <appinfo>
        <embed object="string" length="1"/>
      </appinfo>
    </element>
    <element name="ADRS" occurs="1">
      <appinfo>
        <embed object="string" length="100"/>
      </appinfo>
    </element>
    <element name="HOSPNAME" occurs="1">
      <appinfo>
        <embed object="string" length="100"/>
      </appinfo>
    </element>
    <element name="HOSPCD" occurs="1">
      <appinfo>
        <embed object="string" length="20"/>
      </appinfo>
    </element>
    <element name="SRYKANAME" occurs="3">
      <appinfo>
        <embed object="string" length="30"/>
      </appinfo>
    </element>
    <element name="TOKUBETU" occurs="1">
      <appinfo>
        <embed object="string" length="10"/>
      </appinfo>
    </element>
    <element name="DATA-TBL" occurs="48">
      <element name="HKNJANUM" occurs="1">
        <appinfo>
          <embed object="string" length="6"/>
        </appinfo>
      </element>
      <element name="NYUIN" occurs="1">
        <element name="N-KENSU" occurs="1">
          <appinfo>
            <embed object="string" length="6"/>
          </appinfo>
        </element>
        <element name="N-TENSU" occurs="1">
          <appinfo>
            <embed object="string" length="11"/>
          </appinfo>
        </element>
      </element>
      <element name="GAIRAI" occurs="1">
        <element name="G-KENSU" occurs="1">
          <appinfo>
            <embed object="string" length="6"/>
          </appinfo>
        </element>
        <element name="G-TENSU" occurs="1">
          <appinfo>
            <embed object="string" length="11"/>
          </appinfo>
        </element>
      </element>
    </element>
    <element name="TOTAL" occurs="1">
      <element name="TL-NYUIN" occurs="1">
        <element name="TL-N-KENSU" occurs="1">
          <appinfo>
            <embed object="string" length="6"/>
          </appinfo>
        </element>
        <element name="TL-N-TENSU" occurs="1">
          <appinfo>
            <embed object="string" length="11"/>
          </appinfo>
        </element>
      </element>
      <element name="TL-GAIRAI" occurs="1">
        <element name="TL-G-KENSU" occurs="1">
          <appinfo>
            <embed object="string" length="6"/>
          </appinfo>
        </element>
        <element name="TL-G-TENSU" occurs="1">
          <appinfo>
            <embed object="string" length="11"/>
          </appinfo>
        </element>
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
  <layer name="&#192;&#254;" visible="true">
    <object type="Standard - Line" version="0" id="O0">
      <attribute name="obj_pos">
        <point val="3.35,4.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.34,4.14;3.36,27.21"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.35,4.15"/>
        <point val="3.35,27.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O1">
      <attribute name="obj_pos">
        <point val="10.15,1.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.13,1.53;20.02,1.57"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.15,1.55"/>
        <point val="20,1.55"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O2">
      <attribute name="obj_pos">
        <point val="1.7,5.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.69,5.24;3.36,5.26"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.7,5.25"/>
        <point val="3.35,5.25"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <connections>
        <connection handle="0" to="O33" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O3">
      <attribute name="obj_pos">
        <point val="1,6.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.98,6.33;20.02,6.37"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,6.35"/>
        <point val="20,6.35"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O4">
      <attribute name="obj_pos">
        <point val="12.85,7.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.84,7.09;20.01,7.11"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.85,7.1"/>
        <point val="20,7.1"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O5">
      <attribute name="obj_pos">
        <point val="3.35,7.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.34,7.14;10.51,7.16"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.35,7.15"/>
        <point val="10.5,7.15"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O6">
      <attribute name="obj_pos">
        <point val="1,8.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,8.64;20.01,8.66"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,8.65"/>
        <point val="20,8.65"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O7">
      <attribute name="obj_pos">
        <point val="1,9.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,9.44;20.01,9.46"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,9.45"/>
        <point val="20,9.45"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O8">
      <attribute name="obj_pos">
        <point val="1,10.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,10.19;20.01,10.21"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,10.2"/>
        <point val="20,10.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O9">
      <attribute name="obj_pos">
        <point val="1,11"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,10.99;20.01,11.01"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,11"/>
        <point val="20,11"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O10">
      <attribute name="obj_pos">
        <point val="1,11.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.98,11.73;20.02,11.77"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,11.75"/>
        <point val="20,11.75"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O11">
      <attribute name="obj_pos">
        <point val="1,12.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,12.49;20.01,12.51"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,12.5"/>
        <point val="20,12.5"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O12">
      <attribute name="obj_pos">
        <point val="1,13.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,13.29;20.01,13.31"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,13.3"/>
        <point val="20,13.3"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O13">
      <attribute name="obj_pos">
        <point val="1,14.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,14.04;20.01,14.06"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,14.05"/>
        <point val="20,14.05"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O14">
      <attribute name="obj_pos">
        <point val="1,14.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,14.84;20.01,14.86"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,14.85"/>
        <point val="20,14.85"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O15">
      <attribute name="obj_pos">
        <point val="1,15.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.98,15.58;20.02,15.62"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,15.6"/>
        <point val="20,15.6"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O16">
      <attribute name="obj_pos">
        <point val="1,16.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,16.39;20.01,16.41"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,16.4"/>
        <point val="20,16.4"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O17">
      <attribute name="obj_pos">
        <point val="1,17.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,17.14;20.01,17.16"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,17.15"/>
        <point val="20,17.15"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O18">
      <attribute name="obj_pos">
        <point val="1,17.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,17.94;20.01,17.96"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,17.95"/>
        <point val="20,17.95"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O19">
      <attribute name="obj_pos">
        <point val="1,18.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,18.69;20.01,18.71"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,18.7"/>
        <point val="20,18.7"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O20">
      <attribute name="obj_pos">
        <point val="1,19.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.98,19.43;20.02,19.47"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,19.45"/>
        <point val="20,19.45"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O21">
      <attribute name="obj_pos">
        <point val="1,20.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,20.24;20.01,20.26"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,20.25"/>
        <point val="20,20.25"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O22">
      <attribute name="obj_pos">
        <point val="1,21"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,20.99;20.01,21.01"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,21"/>
        <point val="20,21"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O23">
      <attribute name="obj_pos">
        <point val="1,21.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,21.79;20.01,21.81"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,21.8"/>
        <point val="20,21.8"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O24">
      <attribute name="obj_pos">
        <point val="1,22.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,22.54;20.01,22.56"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,22.55"/>
        <point val="20,22.55"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O25">
      <attribute name="obj_pos">
        <point val="1,23.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.98,23.28;20.02,23.32"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,23.3"/>
        <point val="20,23.3"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O26">
      <attribute name="obj_pos">
        <point val="1,24.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,24.09;20.01,24.11"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,24.1"/>
        <point val="20,24.1"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O27">
      <attribute name="obj_pos">
        <point val="1,26.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,26.39;10.51,26.41"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,26.4"/>
        <point val="10.5,26.4"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O28">
      <attribute name="obj_pos">
        <point val="1.80502,2.25538"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.79502,2.24479;7.65496,2.26538"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.80502,2.25538"/>
        <point val="7.64496,2.25479"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O29">
      <attribute name="obj_pos">
        <point val="1,4.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.98,4.13;20.02,4.17"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,4.15"/>
        <point val="20,4.15"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O30">
      <attribute name="obj_pos">
        <point val="11.5,4.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.49,4.14;11.51,6.36"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="11.5,4.15"/>
        <point val="11.5,6.35"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O31">
      <attribute name="obj_pos">
        <point val="13.5838,4.1469"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.5738,4.1369;13.5938,6.34473"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.5838,4.1469"/>
        <point val="13.5838,6.33473"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O32">
      <attribute name="obj_pos">
        <point val="11.5,5.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.49,5.24;20.01,5.26"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="11.5,5.25"/>
        <point val="20,5.25"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <connections>
        <connection handle="0" to="O30" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O33">
      <attribute name="obj_pos">
        <point val="1.7,4.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.69,4.14;1.71,6.36"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.7,4.15"/>
        <point val="1.7,6.35"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O34">
      <attribute name="obj_pos">
        <point val="4.58438,7.14083"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.5654,7.13083;4.59438,27.2136"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4.58438,7.14083"/>
        <point val="4.5754,27.2036"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O35">
      <attribute name="obj_pos">
        <point val="6.95,6.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.94,6.34;6.96,27.21"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.95,6.35"/>
        <point val="6.95,27.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O36">
      <attribute name="obj_pos">
        <point val="8.21732,7.12058"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.20365,7.11058;8.22732,27.2183"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="8.21732,7.12058"/>
        <point val="8.21365,27.2083"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O37">
      <attribute name="obj_pos">
        <point val="10.55,6.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.54,6.34;10.56,25.66"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.55,6.35"/>
        <point val="10.55,25.65"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O38">
      <attribute name="obj_pos">
        <point val="12.85,6.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.84,6.34;12.86,27.21"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.85,6.35"/>
        <point val="12.85,27.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O39">
      <attribute name="obj_pos">
        <point val="14.1,7.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.09,7.09;14.11,27.21"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.1,7.1"/>
        <point val="14.1,27.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O40">
      <attribute name="obj_pos">
        <point val="16.45,6.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.44,6.34;16.46,27.21"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="16.45,6.35"/>
        <point val="16.45,27.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O41">
      <attribute name="obj_pos">
        <point val="20,1.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="19.98,1.53;20.02,27.22"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="20,1.55"/>
        <point val="20,27.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
      <connections>
        <connection handle="1" to="O56" connection="7"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O42">
      <attribute name="obj_pos">
        <point val="17.7,7.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.69,7.09;17.7219,27.2092"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.7,7.1"/>
        <point val="17.7119,27.1992"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O43">
      <attribute name="obj_pos">
        <point val="1,4.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.98,4.13;1.02,27.22"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,4.15"/>
        <point val="1,27.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O44">
      <attribute name="obj_pos">
        <point val="14.1661,1.53766"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.1561,1.52766;14.1777,4.1494"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.1661,1.53766"/>
        <point val="14.1677,4.1394"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O45">
      <attribute name="obj_pos">
        <point val="17.4278,1.54132"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.4178,1.53132;17.4384,4.15565"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.4278,1.54132"/>
        <point val="17.4284,4.14565"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O46">
      <attribute name="obj_pos">
        <point val="16.7402,1.534"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.7302,1.524;16.7509,4.1494"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="16.7402,1.534"/>
        <point val="16.7409,4.1394"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O47">
      <attribute name="obj_pos">
        <point val="10.85,1.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.84,1.54;10.86,4.16"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.85,1.55"/>
        <point val="10.85,4.15"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O48">
      <attribute name="obj_pos">
        <point val="13.4623,1.53574"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.4523,1.52574;13.4739,4.14959"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.4623,1.53574"/>
        <point val="13.4639,4.13959"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O49">
      <attribute name="obj_pos">
        <point val="10.15,1.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.13,1.53;10.17,4.17"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.15,1.55"/>
        <point val="10.15,4.15"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O50">
      <attribute name="obj_pos">
        <point val="10.5,6.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.49,6.34;10.51,25.66"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.5,6.35"/>
        <point val="10.5,25.65"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <connections>
        <connection handle="0" to="O3" connection="0"/>
        <connection handle="1" to="O56" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O51">
      <attribute name="obj_pos">
        <point val="1,24.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,24.84;20.01,24.86"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,24.85"/>
        <point val="20,24.85"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O52">
      <attribute name="obj_pos">
        <point val="1,7.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.98,7.88;20.02,7.92"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,7.9"/>
        <point val="20,7.9"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O53">
      <attribute name="obj_pos">
        <point val="1,25.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,25.64;20.01,25.66"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,25.65"/>
        <point val="20,25.65"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <connections>
        <connection handle="1" to="O56" connection="2"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O54">
      <attribute name="obj_pos">
        <point val="1,27.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.98,27.18;20.02,27.22"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,27.2"/>
        <point val="20,27.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
      <connections>
        <connection handle="1" to="O56" connection="7"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O55">
      <attribute name="obj_pos">
        <point val="1.80556,2.31943"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.79556,2.30701;7.66062,2.32943"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.80556,2.31943"/>
        <point val="7.65062,2.31701"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O56">
      <attribute name="obj_pos">
        <point val="10.5,25.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.48,25.63;20.02,27.22"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="10.5,25.65"/>
      </attribute>
      <attribute name="elem_width">
        <real val="9.5"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1.55"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
  </layer>
  <layer name="&#202;&#184;&#187;&#250;" visible="true">
    <object type="Standard - Text" version="0" id="O57">
      <attribute name="obj_pos">
        <point val="2.32654,2.06148"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.32654,1.75973;6.63318,2.15973"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#191;&#199; &#206;&#197; &#202;&#243; &#189;&#183; &#193;&#237; &#179;&#231; &#201;&#189;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.32654,2.06148"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.24644"/>
          </attribute>
          <attribute name="multi">
            <real val="0.202"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O58">
      <attribute name="obj_pos">
        <point val="3.2208,27.7005"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.2208,27.4742;8.55663,27.7742"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#177;&#161;&#165; &#162;&#168;&#176;&#245;&#205;&#243;&#164;&#207;&#161;&#162;&#181;&#173;&#198;&#254;&#164;&#183;&#164;&#202;&#164;&#164;&#164;&#199;&#178;&#188;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.2208,27.7005"/>
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
    <object type="Standard - Text" version="0" id="O59">
      <attribute name="obj_pos">
        <point val="3.2208,28.0346"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.2208,27.8083;9.16263,28.1083"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#178;&#161;&#165; &#184;&#169;&#198;&#226;&#202;&#172;&#164;&#200;&#184;&#169;&#179;&#176;&#202;&#172;&#164;&#203;&#202;&#172;&#164;&#177;&#164;&#198;&#186;&#238;&#192;&#174;&#164;&#206;&#164;&#179;&#164;&#200;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.2208,28.0346"/>
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
    <object type="Standard - Text" version="0" id="O60">
      <attribute name="obj_pos">
        <point val="3.2208,28.3807"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.2208,28.1544;9.46563,28.4544"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#179;&#161;&#165; &#202;&#221;&#184;&#177;&#188;&#212;&#165;&#179;&#161;&#188;&#165;&#201;&#205;&#243;&#164;&#207;&#200;&#214;&#185;&#230;&#164;&#199;&#181;&#173;&#198;&#254;&#164;&#185;&#164;&#235;&#164;&#179;&#164;&#200;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.2208,28.3807"/>
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
    <object type="Standard - Text" version="0" id="O61">
      <attribute name="obj_pos">
        <point val="13.8146,2.21056"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.6631,1.98424;13.9661,3.48424"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#188;&#245;

&#201;&#213;

&#176;&#245;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="13.8146,2.21056"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O62">
      <attribute name="obj_pos">
        <point val="11.7598,26.5099"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.975,26.2459;12.5446,26.5959"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#231;    &#183;&#215;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="11.7598,26.5099"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <group>
      <object type="Standard - Text" version="0" id="O63">
        <attribute name="obj_pos">
          <point val="17.0993,2.64494"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="16.9478,2.41862;17.2508,2.71862"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#186;&#186;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.3"/>
            </attribute>
            <attribute name="pos">
              <point val="17.0993,2.64494"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="1"/>
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
      <object type="Standard - Text" version="0" id="O64">
        <attribute name="obj_pos">
          <point val="17.0993,2.15737"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="16.9478,1.93105;17.2508,2.23105"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#191;&#179;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.3"/>
            </attribute>
            <attribute name="pos">
              <point val="17.0993,2.15737"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="1"/>
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
      <object type="Standard - Text" version="0" id="O65">
        <attribute name="obj_pos">
          <point val="17.0993,3.10751"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="16.9478,2.88119;17.2508,3.18119"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#186;&#209;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.3"/>
            </attribute>
            <attribute name="pos">
              <point val="17.0993,3.10751"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="1"/>
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
      <object type="Standard - Text" version="0" id="O66">
        <attribute name="obj_pos">
          <point val="17.0993,3.57004"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="16.9478,3.34372;17.2508,3.64372"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#176;&#245;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.3"/>
            </attribute>
            <attribute name="pos">
              <point val="17.0993,3.57004"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="1"/>
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
    </group>
    <object type="Standard - Text" version="0" id="O67">
      <attribute name="obj_pos">
        <point val="1.37888,4.62456"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.22738,4.39824;1.53038,6.19824"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;
&#184;&#177;
&#176;&#229;
&#206;&#197;
&#181;&#161;
&#180;&#216;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.37888,4.62456"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O68">
      <attribute name="obj_pos">
        <point val="8.59112,6.80992"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.76696,6.5836;9.41528,6.8836"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;  &#177;&#161;  &#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="8.59112,6.80992"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O69">
      <attribute name="obj_pos">
        <point val="2.55565,4.8445"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.10115,4.61818;3.01015,4.91818"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#189;&#234;&#186;&#223;&#195;&#207;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.55565,4.8445"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O70">
      <attribute name="obj_pos">
        <point val="2.50261,5.87195"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.01478,5.64563;2.99044,5.94563"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#204;&#190;  &#190;&#206;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.50261,5.87195"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O71">
      <attribute name="obj_pos">
        <point val="2.22373,7.19741"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.31473,6.97109;3.13273,7.27109"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;&#165;&#179;&#161;&#188;&#165;&#201;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.22373,7.19741"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O72">
      <attribute name="obj_pos">
        <point val="5.10029,6.80992"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.2428,6.5836;5.95778,6.8836"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;      &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.10029,6.80992"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O73">
      <attribute name="obj_pos">
        <point val="5.71648,7.63986"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.13624,7.41354;6.29673,7.71354"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#192;   &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.71648,7.63986"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O74">
      <attribute name="obj_pos">
        <point val="3.97635,7.63986"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.58094,7.41354;4.37176,7.71354"/>
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
            <point val="3.97635,7.63986"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O75">
      <attribute name="obj_pos">
        <point val="9.41455,7.63687"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.83431,7.41055;9.99479,7.71055"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#192;   &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.41455,7.63687"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O76">
      <attribute name="obj_pos">
        <point val="7.5569,7.63986"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.16148,7.41354;7.95231,7.71354"/>
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
            <point val="7.5569,7.63986"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O77">
      <attribute name="obj_pos">
        <point val="15.2183,7.63986"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.6381,7.41354;15.7985,7.71354"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#192;   &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.2183,7.63986"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O78">
      <attribute name="obj_pos">
        <point val="13.4565,7.63986"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.0611,7.41354;13.8519,7.71354"/>
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
            <point val="13.4565,7.63986"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O79">
      <attribute name="obj_pos">
        <point val="18.7758,7.63986"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.1956,7.41354;19.356,7.71354"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#192;   &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="18.7758,7.63986"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O80">
      <attribute name="obj_pos">
        <point val="17.0741,7.63986"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.6787,7.41354;17.4695,7.71354"/>
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
            <point val="17.0741,7.63986"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O81">
      <attribute name="obj_pos">
        <point val="18.2286,6.80992"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.4044,6.5836;19.0528,6.8836"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;  &#177;&#161;  &#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="18.2286,6.80992"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O82">
      <attribute name="obj_pos">
        <point val="14.7378,6.80992"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.8803,6.5836;15.5953,6.8836"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;      &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.7378,6.80992"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O83">
      <attribute name="obj_pos">
        <point val="11.667,7.23492"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.758,7.0086;12.576,7.3086"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;&#165;&#179;&#161;&#188;&#165;&#201;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="11.667,7.23492"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <group>
      <object type="Standard - Text" version="0" id="O84">
        <attribute name="obj_pos">
          <point val="12.5781,4.6489"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="11.9721,4.42258;13.1841,4.72258"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#176;&#229;&#206;&#197;&#181;&#161;&#180;&#216;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.3"/>
            </attribute>
            <attribute name="pos">
              <point val="12.5781,4.6489"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="1"/>
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
      <object type="Standard - Text" version="0" id="O85">
        <attribute name="obj_pos">
          <point val="12.0734,4.9624"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="11.9219,4.73608;12.2249,5.03608"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#165;&#179;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.3"/>
            </attribute>
            <attribute name="pos">
              <point val="12.0734,4.9624"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="1"/>
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
      <object type="Standard - Text" version="0" id="O86">
        <attribute name="obj_pos">
          <point val="12.6239,4.9624"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="12.4724,4.73608;12.7754,5.03608"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#161;&#188;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.3"/>
            </attribute>
            <attribute name="pos">
              <point val="12.6239,4.9624"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="1"/>
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
      <object type="Standard - Text" version="0" id="O87">
        <attribute name="obj_pos">
          <point val="13.0739,4.9624"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="12.9224,4.73608;13.2254,5.03608"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#165;&#201;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.3"/>
            </attribute>
            <attribute name="pos">
              <point val="13.0739,4.9624"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="1"/>
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
    </group>
    <object type="Standard - Line" version="0" id="O88">
      <attribute name="obj_pos">
        <point val="1.35501,3.07157"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.34501,3.06157;2.70901,3.08475"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.35501,3.07157"/>
        <point val="2.69901,3.07475"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O89">
      <attribute name="obj_pos">
        <point val="1.35585,3.0819"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.34465,3.0719;1.36585,3.9069"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.35585,3.0819"/>
        <point val="1.35465,3.8969"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O90">
      <attribute name="obj_pos">
        <point val="2.2628,3.0819"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.2515,3.0719;2.2728,3.9069"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.2628,3.0819"/>
        <point val="2.2615,3.8969"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O91">
      <attribute name="obj_pos">
        <point val="2.7003,3.0819"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.689,3.0719;2.7103,3.9069"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.7003,3.0819"/>
        <point val="2.699,3.8969"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O92">
      <attribute name="obj_pos">
        <point val="3.16277,3.08287"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15245,3.07287;3.17277,3.68805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.16277,3.08287"/>
        <point val="3.16245,3.67805"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O93">
      <attribute name="obj_pos">
        <point val="3.53501,3.07075"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.52339,3.06075;3.54501,3.70579"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.53501,3.07075"/>
        <point val="3.53339,3.69579"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
      <connections>
        <connection handle="0" to="O107" connection="0"/>
        <connection handle="1" to="O96" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O94">
      <attribute name="obj_pos">
        <point val="3.92666,3.07721"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.91565,3.06721;3.93666,3.68805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.92666,3.07721"/>
        <point val="3.92565,3.67805"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O95">
      <attribute name="obj_pos">
        <point val="4.28249,3.07503"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.27032,3.06503;4.29249,3.70405"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4.28249,3.07503"/>
        <point val="4.28032,3.69405"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O96">
      <attribute name="obj_pos">
        <point val="2.77577,3.70083"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.76577,3.68075;4.30101,3.71083"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.77577,3.70083"/>
        <point val="4.29101,3.69075"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O97">
      <attribute name="obj_pos">
        <point val="1.8187,3.07624"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.8075,3.06624;1.8287,3.90124"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.8187,3.07624"/>
        <point val="1.8175,3.89124"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O98">
      <attribute name="obj_pos">
        <point val="1.34925,3.88672"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.33925,3.87633;2.71708,3.89672"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.34925,3.88672"/>
        <point val="2.70708,3.88633"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O99">
      <attribute name="obj_pos">
        <point val="1.0923,3.60523"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.9408,3.37891;1.2438,3.67891"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#162;&#169;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.0923,3.60523"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Ellipse" version="0" id="O100">
      <attribute name="obj_pos">
        <point val="0.874259,3.28434"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.859259,3.26934;1.29655,3.68966"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="0.874259,3.28434"/>
      </attribute>
      <attribute name="elem_width">
        <real val="0.407294"/>
      </attribute>
      <attribute name="elem_height">
        <real val="0.390323"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.03"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O101">
      <attribute name="obj_pos">
        <point val="14.3836,1.80622"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2573,1.61762;14.5098,1.86762"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#162;&#168;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="14.3836,1.80622"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O102">
      <attribute name="obj_pos">
        <point val="17.6244,1.80622"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.4982,1.61762;17.7507,1.86762"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#162;&#168;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="17.6244,1.80622"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O103">
      <attribute name="obj_pos">
        <point val="19.7,5.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="19.5485,5.67368;19.8515,5.97368"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#178;&#202;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="19.7,5.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O104">
      <attribute name="obj_pos">
        <point val="11.0624,1.81152"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9361,1.62292;11.1886,1.87292"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#162;&#168;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="11.0624,1.81152"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O105">
      <attribute name="obj_pos">
        <point val="12.5913,5.88107"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.9853,5.65475;13.1973,5.95475"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#201;&#184;&#220;&#214;&#178;&#202;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.5913,5.88107"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O106">
      <attribute name="obj_pos">
        <point val="2.41079,27.6914"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.41079,27.4651;3.08345,27.7651"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#(&#195;&#237;)#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.41079,27.6914"/>
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
    <object type="Standard - Line" version="0" id="O107">
      <attribute name="obj_pos">
        <point val="2.77901,3.07475"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.76901,3.05675;4.30101,3.08475"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.77901,3.07475"/>
        <point val="4.29101,3.06675"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O108">
      <attribute name="obj_pos">
        <point val="2.78878,3.06395"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.77661,3.05395;2.79878,3.69297"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.78878,3.06395"/>
        <point val="2.78661,3.68297"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="line_style">
        <enum val="4"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.2"/>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O109">
      <attribute name="obj_pos">
        <point val="5.1,1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.1,0.698246;5.504,1.09825"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#172;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.1,1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.24644"/>
          </attribute>
          <attribute name="multi">
            <real val="0.202"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O110">
      <attribute name="obj_pos">
        <point val="10.3609,2.1515"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3609,1.92518;10.6639,4.02518"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#189;&#241;

&#206;&#177;

&#200;&#214;

&#185;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3609,2.1515"/>
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
    <object type="Embed - Text" version="0" id="O111">
      <attribute name="obj_pos">
        <point val="5.1,1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49824,0.698246;5.1,1.09825"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIYM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#191;&#192;&#174;99&#199;&#175;99&#183;&#238;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.1,1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.24644"/>
          </attribute>
          <attribute name="multi">
            <real val="0.202"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O112">
      <attribute name="obj_pos">
        <point val="1.4,8.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,8.06053;3.06347,8.51053"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[0].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,8.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O113">
      <attribute name="obj_pos">
        <point val="14.2,4.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2,4.59825;16.6644,4.99825"/>
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
            <string>#9999999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="14.2,4.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.24644"/>
          </attribute>
          <attribute name="multi">
            <real val="0.202"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O114">
      <attribute name="obj_pos">
        <point val="1.75,3.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.36802,3.18228;1.75,3.80228"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#POST1[0]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.62"/>
          </attribute>
          <attribute name="pos">
            <point val="1.75,3.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.381982"/>
          </attribute>
          <attribute name="multi">
            <real val="0.3131"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O115">
      <attribute name="obj_pos">
        <point val="3.45856,4.74088"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.45856,4.51456;11.0336,5.11456"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ADRS#</string>
      </attribute>
      <attribute name="embed_text_column">
        <int val="50"/>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;
&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.45856,4.74088"/>
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
    <object type="Embed - Text" version="0" id="O116">
      <attribute name="obj_pos">
        <point val="3.45856,5.77624"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.45856,5.54992;9.51856,6.14992"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HOSPNAME#</string>
      </attribute>
      <attribute name="embed_text_column">
        <int val="50"/>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;
&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.45856,5.77624"/>
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
    <object type="Embed - Text" version="0" id="O117">
      <attribute name="obj_pos">
        <point val="14.2,5.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2,5.37368;18.745,5.67368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SRYKANAME[0]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.2,5.6"/>
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
    <object type="Embed - Text" version="0" id="O118">
      <attribute name="obj_pos">
        <point val="2.2,3.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.81802,3.18228;2.2,3.80228"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#POST1[1]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.62"/>
          </attribute>
          <attribute name="pos">
            <point val="2.2,3.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.381982"/>
          </attribute>
          <attribute name="multi">
            <real val="0.3131"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O119">
      <attribute name="obj_pos">
        <point val="2.65,3.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.26802,3.18228;2.65,3.80228"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#POST1[2]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.62"/>
          </attribute>
          <attribute name="pos">
            <point val="2.65,3.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.381982"/>
          </attribute>
          <attribute name="multi">
            <real val="0.3131"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O120">
      <attribute name="obj_pos">
        <point val="3.1,3.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.79195,3.17281;3.1,3.67281"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#POST2[0]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="3.1,3.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.30805"/>
          </attribute>
          <attribute name="multi">
            <real val="0.2525"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O121">
      <attribute name="obj_pos">
        <point val="3.48333,3.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.17528,3.17281;3.48333,3.67281"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#POST2[1]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="3.48333,3.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.30805"/>
          </attribute>
          <attribute name="multi">
            <real val="0.2525"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O122">
      <attribute name="obj_pos">
        <point val="3.86667,3.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.55862,3.17281;3.86667,3.67281"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#POST2[2]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="3.86667,3.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.30805"/>
          </attribute>
          <attribute name="multi">
            <real val="0.2525"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O123">
      <attribute name="obj_pos">
        <point val="4.25,3.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.94195,3.17281;4.25,3.67281"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#POST2[3]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="4.25,3.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.30805"/>
          </attribute>
          <attribute name="multi">
            <real val="0.2525"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O124">
      <attribute name="obj_pos">
        <point val="14.2,5.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2,5.67368;18.745,5.97368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SRYKANAME[1]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.2,5.9"/>
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
    <object type="Embed - Text" version="0" id="O125">
      <attribute name="obj_pos">
        <point val="14.2,6.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2,5.97368;18.745,6.27368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SRYKANAME[2]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.2,6.2"/>
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
    <object type="Embed - Text" version="0" id="O126">
      <attribute name="obj_pos">
        <point val="1.4,9.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,8.81053;3.06347,9.26053"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[1].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,9.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O127">
      <attribute name="obj_pos">
        <point val="1.4,9.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,9.61053;3.06347,10.0605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[2].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,9.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O128">
      <attribute name="obj_pos">
        <point val="1.4,10.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,10.4105;3.06347,10.8605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[3].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,10.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O129">
      <attribute name="obj_pos">
        <point val="1.4,11.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,11.1605;3.06347,11.6105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[4].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,11.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O130">
      <attribute name="obj_pos">
        <point val="1.4,12.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,11.9105;3.06347,12.3605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[5].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,12.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O131">
      <attribute name="obj_pos">
        <point val="1.4,13.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,12.7105;3.06347,13.1605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[6].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,13.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O132">
      <attribute name="obj_pos">
        <point val="1.4,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,13.4605;3.06347,13.9105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[7].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O133">
      <attribute name="obj_pos">
        <point val="1.4,14.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,14.2605;3.06347,14.7105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[8].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,14.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O134">
      <attribute name="obj_pos">
        <point val="1.4,15.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,15.0105;3.06347,15.4605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[9].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,15.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O135">
      <attribute name="obj_pos">
        <point val="1.4,16.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,15.7605;3.06347,16.2105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[10].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,16.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O136">
      <attribute name="obj_pos">
        <point val="1.4,16.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,16.5605;3.06347,17.0105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[11].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,16.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O137">
      <attribute name="obj_pos">
        <point val="1.4,17.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,17.3605;3.06347,17.8105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[12].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,17.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O138">
      <attribute name="obj_pos">
        <point val="1.4,18.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,18.1105;3.06347,18.5605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[13].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,18.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O139">
      <attribute name="obj_pos">
        <point val="1.4,19.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,18.8605;3.06347,19.3105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[14].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,19.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O140">
      <attribute name="obj_pos">
        <point val="1.4,20"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,19.6605;3.06347,20.1105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[15].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,20"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O141">
      <attribute name="obj_pos">
        <point val="1.4,20.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,20.4105;3.06347,20.8605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[16].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,20.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O142">
      <attribute name="obj_pos">
        <point val="1.4,21.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,21.2105;3.06347,21.6605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[17].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,21.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O143">
      <attribute name="obj_pos">
        <point val="1.4,22.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,21.9605;3.06347,22.4105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[18].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,22.3"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O144">
      <attribute name="obj_pos">
        <point val="1.4,23.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,22.7105;3.06347,23.1605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[19].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,23.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O145">
      <attribute name="obj_pos">
        <point val="1.4,23.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,23.5105;3.06347,23.9605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[20].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,23.85"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O146">
      <attribute name="obj_pos">
        <point val="1.4,24.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,24.2605;3.06347,24.7105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[21].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,24.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O147">
      <attribute name="obj_pos">
        <point val="1.4,25.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,25.0605;3.06347,25.5105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[22].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,25.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O148">
      <attribute name="obj_pos">
        <point val="1.4,26.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,25.8105;3.06347,26.2605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[23].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,26.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O149">
      <attribute name="obj_pos">
        <point val="1.4,26.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.4,26.6105;3.06347,27.0605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[24].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="1.4,26.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O150">
      <attribute name="obj_pos">
        <point val="10.9,8.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,8.06053;12.5635,8.51053"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[25].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,8.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O151">
      <attribute name="obj_pos">
        <point val="10.9,9.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,8.81053;12.5635,9.26053"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[26].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,9.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O152">
      <attribute name="obj_pos">
        <point val="10.9,9.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,9.61053;12.5635,10.0605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[27].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,9.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O153">
      <attribute name="obj_pos">
        <point val="10.9,10.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,10.4105;12.5635,10.8605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[28].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,10.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O154">
      <attribute name="obj_pos">
        <point val="10.9,11.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,11.1605;12.5635,11.6105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[29].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,11.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O155">
      <attribute name="obj_pos">
        <point val="10.9,12.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,11.9105;12.5635,12.3605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[30].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,12.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O156">
      <attribute name="obj_pos">
        <point val="10.9,13.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,12.7105;12.5635,13.1605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[31].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,13.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O157">
      <attribute name="obj_pos">
        <point val="10.9,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,13.4605;12.5635,13.9105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[32].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O158">
      <attribute name="obj_pos">
        <point val="10.9,14.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,14.2605;12.5635,14.7105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[33].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,14.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O159">
      <attribute name="obj_pos">
        <point val="10.9,15.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,15.0105;12.5635,15.4605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[34].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,15.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O160">
      <attribute name="obj_pos">
        <point val="10.9,16.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,15.7605;12.5635,16.2105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[35].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,16.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O161">
      <attribute name="obj_pos">
        <point val="10.9,16.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,16.5605;12.5635,17.0105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[36].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,16.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O162">
      <attribute name="obj_pos">
        <point val="10.9,17.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,17.3605;12.5635,17.8105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[37].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,17.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O163">
      <attribute name="obj_pos">
        <point val="10.9,18.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,18.1105;12.5635,18.5605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[38].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,18.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O164">
      <attribute name="obj_pos">
        <point val="10.9,19.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,18.8605;12.5635,19.3105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[39].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,19.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O165">
      <attribute name="obj_pos">
        <point val="10.9,20"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,19.6605;12.5635,20.1105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[40].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,20"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O166">
      <attribute name="obj_pos">
        <point val="10.9,20.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,20.4105;12.5635,20.8605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[41].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,20.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O167">
      <attribute name="obj_pos">
        <point val="10.9,21.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,21.2105;12.5635,21.6605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[42].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,21.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O168">
      <attribute name="obj_pos">
        <point val="10.9,22.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,21.9605;12.5635,22.4105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[43].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,22.3"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O169">
      <attribute name="obj_pos">
        <point val="10.9,23.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,22.7105;12.5635,23.1605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[44].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,23.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O170">
      <attribute name="obj_pos">
        <point val="10.9,23.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,23.5105;12.5635,23.9605"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[45].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,23.85"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O171">
      <attribute name="obj_pos">
        <point val="10.9,24.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,24.2605;12.5635,24.7105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[46].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,24.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O172">
      <attribute name="obj_pos">
        <point val="10.9,25.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9,25.0605;12.5635,25.5105"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[47].HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9,25.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.277245"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O173">
      <attribute name="obj_pos">
        <point val="6.9,8.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,8.1586;6.9,8.4786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[0].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,8.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O174">
      <attribute name="obj_pos">
        <point val="4.55,8.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,8.1586;4.55,8.4786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[0].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,8.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O175">
      <attribute name="obj_pos">
        <point val="8.2,8.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,8.1586;8.2,8.4786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[0].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,8.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O176">
      <attribute name="obj_pos">
        <point val="10.5,8.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,8.1586;10.5,8.4786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[0].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,8.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O177">
      <attribute name="obj_pos">
        <point val="16.4,26.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,26.3086;16.4,26.6286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TOTAL.TL-NYUIN.TL-N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,26.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O178">
      <attribute name="obj_pos">
        <point val="14.05,26.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,26.3086;14.05,26.6286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TOTAL.TL-NYUIN.TL-N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,26.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O179">
      <attribute name="obj_pos">
        <point val="17.7,26.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,26.3086;17.7,26.6286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TOTAL.TL-GAIRAI.TL-G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,26.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O180">
      <attribute name="obj_pos">
        <point val="20,26.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,26.3086;20,26.6286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TOTAL.TL-GAIRAI.TL-G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,26.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O181">
      <attribute name="obj_pos">
        <point val="6.9,9.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,8.9086;6.9,9.2286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[1].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,9.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O182">
      <attribute name="obj_pos">
        <point val="4.55,9.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,8.9086;4.55,9.2286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[1].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,9.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O183">
      <attribute name="obj_pos">
        <point val="8.2,9.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,8.9086;8.2,9.2286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[1].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,9.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O184">
      <attribute name="obj_pos">
        <point val="10.5,9.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,8.9086;10.5,9.2286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[1].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,9.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O185">
      <attribute name="obj_pos">
        <point val="6.9,9.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,9.7086;6.9,10.0286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[2].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,9.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O186">
      <attribute name="obj_pos">
        <point val="4.55,9.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,9.7086;4.55,10.0286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[2].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,9.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O187">
      <attribute name="obj_pos">
        <point val="8.2,9.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,9.7086;8.2,10.0286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[2].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,9.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O188">
      <attribute name="obj_pos">
        <point val="10.5,9.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,9.7086;10.5,10.0286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[2].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,9.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O189">
      <attribute name="obj_pos">
        <point val="6.9,10.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,10.5086;6.9,10.8286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[3].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,10.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O190">
      <attribute name="obj_pos">
        <point val="4.55,10.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,10.5086;4.55,10.8286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[3].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,10.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O191">
      <attribute name="obj_pos">
        <point val="8.2,10.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,10.5086;8.2,10.8286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[3].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,10.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O192">
      <attribute name="obj_pos">
        <point val="10.5,10.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,10.5086;10.5,10.8286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[3].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,10.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O193">
      <attribute name="obj_pos">
        <point val="6.9,11.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,11.2586;6.9,11.5786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[4].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,11.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O194">
      <attribute name="obj_pos">
        <point val="4.55,11.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,11.2586;4.55,11.5786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[4].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,11.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O195">
      <attribute name="obj_pos">
        <point val="8.2,11.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,11.2586;8.2,11.5786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[4].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,11.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O196">
      <attribute name="obj_pos">
        <point val="10.5,11.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,11.2586;10.5,11.5786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[4].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,11.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O197">
      <attribute name="obj_pos">
        <point val="6.9,12.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,12.0086;6.9,12.3286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[5].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,12.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O198">
      <attribute name="obj_pos">
        <point val="4.55,12.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,12.0086;4.55,12.3286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[5].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,12.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O199">
      <attribute name="obj_pos">
        <point val="8.2,12.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,12.0086;8.2,12.3286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[5].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,12.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O200">
      <attribute name="obj_pos">
        <point val="10.5,12.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,12.0086;10.5,12.3286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[5].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,12.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O201">
      <attribute name="obj_pos">
        <point val="6.9,13.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,12.8086;6.9,13.1286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[6].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,13.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O202">
      <attribute name="obj_pos">
        <point val="4.55,13.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,12.8086;4.55,13.1286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[6].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,13.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O203">
      <attribute name="obj_pos">
        <point val="8.2,13.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,12.8086;8.2,13.1286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[6].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,13.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O204">
      <attribute name="obj_pos">
        <point val="10.5,13.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,12.8086;10.5,13.1286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[6].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,13.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O205">
      <attribute name="obj_pos">
        <point val="6.9,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,13.5586;6.9,13.8786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[7].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O206">
      <attribute name="obj_pos">
        <point val="4.55,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,13.5586;4.55,13.8786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[7].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O207">
      <attribute name="obj_pos">
        <point val="8.2,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,13.5586;8.2,13.8786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[7].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O208">
      <attribute name="obj_pos">
        <point val="10.5,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,13.5586;10.5,13.8786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[7].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O209">
      <attribute name="obj_pos">
        <point val="6.9,14.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,14.3586;6.9,14.6786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[8].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,14.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O210">
      <attribute name="obj_pos">
        <point val="4.55,14.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,14.3586;4.55,14.6786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[8].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,14.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O211">
      <attribute name="obj_pos">
        <point val="8.2,14.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,14.3586;8.2,14.6786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[8].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,14.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O212">
      <attribute name="obj_pos">
        <point val="10.5,14.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,14.3586;10.5,14.6786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[8].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,14.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O213">
      <attribute name="obj_pos">
        <point val="6.9,15.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,15.1086;6.9,15.4286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[9].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,15.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O214">
      <attribute name="obj_pos">
        <point val="4.55,15.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,15.1086;4.55,15.4286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[9].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,15.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O215">
      <attribute name="obj_pos">
        <point val="8.2,15.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,15.1086;8.2,15.4286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[9].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,15.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O216">
      <attribute name="obj_pos">
        <point val="10.5,15.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,15.1086;10.5,15.4286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[9].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,15.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O217">
      <attribute name="obj_pos">
        <point val="6.9,16.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,15.8586;6.9,16.1786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[10].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,16.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O218">
      <attribute name="obj_pos">
        <point val="4.55,16.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,15.8586;4.55,16.1786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[10].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,16.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O219">
      <attribute name="obj_pos">
        <point val="8.2,16.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,15.8586;8.2,16.1786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[10].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,16.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O220">
      <attribute name="obj_pos">
        <point val="10.5,16.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,15.8586;10.5,16.1786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[10].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,16.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O221">
      <attribute name="obj_pos">
        <point val="6.9,16.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,16.6586;6.9,16.9786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[11].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,16.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O222">
      <attribute name="obj_pos">
        <point val="4.55,16.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,16.6586;4.55,16.9786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[11].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,16.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O223">
      <attribute name="obj_pos">
        <point val="8.2,16.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,16.6586;8.2,16.9786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[11].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,16.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O224">
      <attribute name="obj_pos">
        <point val="10.5,16.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,16.6586;10.5,16.9786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[11].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,16.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O225">
      <attribute name="obj_pos">
        <point val="6.9,17.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,17.4586;6.9,17.7786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[12].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,17.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O226">
      <attribute name="obj_pos">
        <point val="4.55,17.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,17.4586;4.55,17.7786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[12].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,17.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O227">
      <attribute name="obj_pos">
        <point val="8.2,17.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,17.4586;8.2,17.7786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[12].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,17.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O228">
      <attribute name="obj_pos">
        <point val="10.5,17.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,17.4586;10.5,17.7786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[12].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,17.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O229">
      <attribute name="obj_pos">
        <point val="6.9,18.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,18.2086;6.9,18.5286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[13].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,18.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O230">
      <attribute name="obj_pos">
        <point val="4.55,18.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,18.2086;4.55,18.5286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[13].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,18.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O231">
      <attribute name="obj_pos">
        <point val="8.2,18.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,18.2086;8.2,18.5286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[13].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,18.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O232">
      <attribute name="obj_pos">
        <point val="10.5,18.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,18.2086;10.5,18.5286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[13].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,18.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O233">
      <attribute name="obj_pos">
        <point val="6.9,19.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,18.9586;6.9,19.2786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[14].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,19.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O234">
      <attribute name="obj_pos">
        <point val="4.55,19.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,18.9586;4.55,19.2786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[14].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,19.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O235">
      <attribute name="obj_pos">
        <point val="8.2,19.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,18.9586;8.2,19.2786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[14].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,19.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O236">
      <attribute name="obj_pos">
        <point val="10.5,19.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,18.9586;10.5,19.2786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[14].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,19.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O237">
      <attribute name="obj_pos">
        <point val="6.9,20"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,19.7586;6.9,20.0786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[15].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,20"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O238">
      <attribute name="obj_pos">
        <point val="4.55,20"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,19.7586;4.55,20.0786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[15].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,20"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O239">
      <attribute name="obj_pos">
        <point val="8.2,20"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,19.7586;8.2,20.0786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[15].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,20"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O240">
      <attribute name="obj_pos">
        <point val="10.5,20"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,19.7586;10.5,20.0786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[15].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,20"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O241">
      <attribute name="obj_pos">
        <point val="6.9,20.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,20.5086;6.9,20.8286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[16].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,20.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O242">
      <attribute name="obj_pos">
        <point val="4.55,20.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,20.5086;4.55,20.8286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[16].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,20.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O243">
      <attribute name="obj_pos">
        <point val="8.2,20.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,20.5086;8.2,20.8286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[16].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,20.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O244">
      <attribute name="obj_pos">
        <point val="10.5,20.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,20.5086;10.5,20.8286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[16].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,20.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O245">
      <attribute name="obj_pos">
        <point val="6.9,21.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,21.3086;6.9,21.6286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[17].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,21.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O246">
      <attribute name="obj_pos">
        <point val="4.55,21.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,21.3086;4.55,21.6286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[17].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,21.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O247">
      <attribute name="obj_pos">
        <point val="8.2,21.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,21.3086;8.2,21.6286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[17].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,21.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O248">
      <attribute name="obj_pos">
        <point val="10.5,21.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,21.3086;10.5,21.6286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[17].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,21.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O249">
      <attribute name="obj_pos">
        <point val="6.9,22.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,22.0586;6.9,22.3786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[18].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,22.3"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O250">
      <attribute name="obj_pos">
        <point val="4.55,22.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,22.0586;4.55,22.3786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[18].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,22.3"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O251">
      <attribute name="obj_pos">
        <point val="8.2,22.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,22.0586;8.2,22.3786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[18].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,22.3"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O252">
      <attribute name="obj_pos">
        <point val="10.5,22.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,22.0586;10.5,22.3786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[18].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,22.3"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O253">
      <attribute name="obj_pos">
        <point val="6.9,23.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,22.8086;6.9,23.1286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[19].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,23.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O254">
      <attribute name="obj_pos">
        <point val="4.55,23.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,22.8086;4.55,23.1286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[19].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,23.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O255">
      <attribute name="obj_pos">
        <point val="8.2,23.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,22.8086;8.2,23.1286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[19].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,23.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O256">
      <attribute name="obj_pos">
        <point val="10.5,23.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,22.8086;10.5,23.1286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[19].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,23.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O257">
      <attribute name="obj_pos">
        <point val="6.9,23.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,23.6086;6.9,23.9286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[20].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,23.85"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O258">
      <attribute name="obj_pos">
        <point val="4.55,23.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,23.6086;4.55,23.9286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[20].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,23.85"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O259">
      <attribute name="obj_pos">
        <point val="8.2,23.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,23.6086;8.2,23.9286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[20].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,23.85"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O260">
      <attribute name="obj_pos">
        <point val="10.5,23.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,23.6086;10.5,23.9286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[20].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,23.85"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O261">
      <attribute name="obj_pos">
        <point val="6.9,24.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,24.3586;6.9,24.6786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[21].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,24.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O262">
      <attribute name="obj_pos">
        <point val="4.55,24.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,24.3586;4.55,24.6786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[21].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,24.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O263">
      <attribute name="obj_pos">
        <point val="8.2,24.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,24.3586;8.2,24.6786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[21].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,24.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O264">
      <attribute name="obj_pos">
        <point val="10.5,24.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,24.3586;10.5,24.6786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[21].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,24.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O265">
      <attribute name="obj_pos">
        <point val="6.9,25.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,25.1586;6.9,25.4786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[22].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,25.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O266">
      <attribute name="obj_pos">
        <point val="4.55,25.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,25.1586;4.55,25.4786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[22].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,25.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O267">
      <attribute name="obj_pos">
        <point val="8.2,25.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,25.1586;8.2,25.4786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[22].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,25.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O268">
      <attribute name="obj_pos">
        <point val="10.5,25.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,25.1586;10.5,25.4786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[22].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,25.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O269">
      <attribute name="obj_pos">
        <point val="6.9,26.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,25.9086;6.9,26.2286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[23].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,26.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O270">
      <attribute name="obj_pos">
        <point val="4.55,26.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,25.9086;4.55,26.2286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[23].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,26.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O271">
      <attribute name="obj_pos">
        <point val="8.2,26.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,25.9086;8.2,26.2286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[23].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,26.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O272">
      <attribute name="obj_pos">
        <point val="10.5,26.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,25.9086;10.5,26.2286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[23].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,26.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O273">
      <attribute name="obj_pos">
        <point val="6.9,26.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.73133,26.7086;6.9,27.0286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[24].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9,26.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O274">
      <attribute name="obj_pos">
        <point val="4.55,26.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.36709,26.7086;4.55,27.0286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[24].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="4.55,26.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O275">
      <attribute name="obj_pos">
        <point val="8.2,26.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.01709,26.7086;8.2,27.0286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[24].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,26.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O276">
      <attribute name="obj_pos">
        <point val="10.5,26.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.33133,26.7086;10.5,27.0286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[24].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="10.5,26.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O277">
      <attribute name="obj_pos">
        <point val="16.4,8.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,8.1586;16.4,8.4786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[25].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,8.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O278">
      <attribute name="obj_pos">
        <point val="14.05,8.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,8.1586;14.05,8.4786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[25].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,8.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O279">
      <attribute name="obj_pos">
        <point val="17.7,8.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,8.1586;17.7,8.4786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[25].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,8.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O280">
      <attribute name="obj_pos">
        <point val="20,8.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,8.1586;20,8.4786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[25].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,8.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O281">
      <attribute name="obj_pos">
        <point val="16.4,9.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,8.9086;16.4,9.2286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[26].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,9.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O282">
      <attribute name="obj_pos">
        <point val="14.05,9.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,8.9086;14.05,9.2286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[26].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,9.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O283">
      <attribute name="obj_pos">
        <point val="17.7,9.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,8.9086;17.7,9.2286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[26].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,9.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O284">
      <attribute name="obj_pos">
        <point val="20,9.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,8.9086;20,9.2286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[26].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,9.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O285">
      <attribute name="obj_pos">
        <point val="16.4,9.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,9.7086;16.4,10.0286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[27].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,9.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O286">
      <attribute name="obj_pos">
        <point val="14.05,9.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,9.7086;14.05,10.0286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[27].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,9.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O287">
      <attribute name="obj_pos">
        <point val="17.7,9.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,9.7086;17.7,10.0286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[27].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,9.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O288">
      <attribute name="obj_pos">
        <point val="20,9.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,9.7086;20,10.0286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[27].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,9.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O289">
      <attribute name="obj_pos">
        <point val="16.4,10.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,10.5086;16.4,10.8286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[28].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,10.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O290">
      <attribute name="obj_pos">
        <point val="14.05,10.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,10.5086;14.05,10.8286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[28].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,10.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O291">
      <attribute name="obj_pos">
        <point val="17.7,10.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,10.5086;17.7,10.8286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[28].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,10.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O292">
      <attribute name="obj_pos">
        <point val="20,10.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,10.5086;20,10.8286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[28].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,10.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O293">
      <attribute name="obj_pos">
        <point val="16.4,11.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,11.2586;16.4,11.5786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[29].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,11.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O294">
      <attribute name="obj_pos">
        <point val="14.05,11.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,11.2586;14.05,11.5786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[29].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,11.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O295">
      <attribute name="obj_pos">
        <point val="17.7,11.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,11.2586;17.7,11.5786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[29].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,11.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O296">
      <attribute name="obj_pos">
        <point val="20,11.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,11.2586;20,11.5786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[29].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,11.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O297">
      <attribute name="obj_pos">
        <point val="16.4,12.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,12.0086;16.4,12.3286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[30].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,12.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O298">
      <attribute name="obj_pos">
        <point val="14.05,12.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,12.0086;14.05,12.3286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[30].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,12.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O299">
      <attribute name="obj_pos">
        <point val="17.7,12.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,12.0086;17.7,12.3286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[30].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,12.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O300">
      <attribute name="obj_pos">
        <point val="20,12.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,12.0086;20,12.3286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[30].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,12.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O301">
      <attribute name="obj_pos">
        <point val="16.4,13.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,12.8086;16.4,13.1286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[31].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,13.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O302">
      <attribute name="obj_pos">
        <point val="14.05,13.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,12.8086;14.05,13.1286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[31].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,13.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O303">
      <attribute name="obj_pos">
        <point val="17.7,13.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,12.8086;17.7,13.1286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[31].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,13.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O304">
      <attribute name="obj_pos">
        <point val="20,13.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,12.8086;20,13.1286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[31].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,13.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O305">
      <attribute name="obj_pos">
        <point val="16.4,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,13.5586;16.4,13.8786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[32].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O306">
      <attribute name="obj_pos">
        <point val="14.05,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,13.5586;14.05,13.8786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[32].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O307">
      <attribute name="obj_pos">
        <point val="17.7,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,13.5586;17.7,13.8786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[32].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O308">
      <attribute name="obj_pos">
        <point val="20,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,13.5586;20,13.8786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[32].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O309">
      <attribute name="obj_pos">
        <point val="16.4,14.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,14.3586;16.4,14.6786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[33].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,14.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O310">
      <attribute name="obj_pos">
        <point val="14.05,14.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,14.3586;14.05,14.6786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[33].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,14.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O311">
      <attribute name="obj_pos">
        <point val="17.7,14.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,14.3586;17.7,14.6786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[33].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,14.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O312">
      <attribute name="obj_pos">
        <point val="20,14.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,14.3586;20,14.6786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[33].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,14.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O313">
      <attribute name="obj_pos">
        <point val="16.4,15.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,15.1086;16.4,15.4286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[34].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,15.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O314">
      <attribute name="obj_pos">
        <point val="14.05,15.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,15.1086;14.05,15.4286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[34].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,15.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O315">
      <attribute name="obj_pos">
        <point val="17.7,15.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,15.1086;17.7,15.4286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[34].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,15.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O316">
      <attribute name="obj_pos">
        <point val="20,15.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,15.1086;20,15.4286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[34].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,15.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O317">
      <attribute name="obj_pos">
        <point val="16.4,16.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,15.8586;16.4,16.1786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[35].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,16.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O318">
      <attribute name="obj_pos">
        <point val="14.05,16.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,15.8586;14.05,16.1786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[35].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,16.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O319">
      <attribute name="obj_pos">
        <point val="17.7,16.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,15.8586;17.7,16.1786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[35].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,16.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O320">
      <attribute name="obj_pos">
        <point val="20,16.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,15.8586;20,16.1786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[35].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,16.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O321">
      <attribute name="obj_pos">
        <point val="16.4,16.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,16.6586;16.4,16.9786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[36].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,16.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O322">
      <attribute name="obj_pos">
        <point val="14.05,16.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,16.6586;14.05,16.9786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[36].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,16.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O323">
      <attribute name="obj_pos">
        <point val="17.7,16.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,16.6586;17.7,16.9786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[36].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,16.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O324">
      <attribute name="obj_pos">
        <point val="20,16.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,16.6586;20,16.9786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[36].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,16.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O325">
      <attribute name="obj_pos">
        <point val="16.4,17.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,17.4586;16.4,17.7786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[37].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,17.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O326">
      <attribute name="obj_pos">
        <point val="14.05,17.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,17.4586;14.05,17.7786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[37].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,17.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O327">
      <attribute name="obj_pos">
        <point val="17.7,17.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,17.4586;17.7,17.7786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[37].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,17.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O328">
      <attribute name="obj_pos">
        <point val="20,17.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,17.4586;20,17.7786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[37].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,17.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O329">
      <attribute name="obj_pos">
        <point val="16.4,18.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,18.2086;16.4,18.5286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[38].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,18.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O330">
      <attribute name="obj_pos">
        <point val="14.05,18.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,18.2086;14.05,18.5286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[38].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,18.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O331">
      <attribute name="obj_pos">
        <point val="17.7,18.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,18.2086;17.7,18.5286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[38].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,18.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O332">
      <attribute name="obj_pos">
        <point val="20,18.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,18.2086;20,18.5286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[38].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,18.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O333">
      <attribute name="obj_pos">
        <point val="16.4,19.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,18.9586;16.4,19.2786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[39].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,19.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O334">
      <attribute name="obj_pos">
        <point val="14.05,19.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,18.9586;14.05,19.2786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[39].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,19.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O335">
      <attribute name="obj_pos">
        <point val="17.7,19.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,18.9586;17.7,19.2786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[39].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,19.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O336">
      <attribute name="obj_pos">
        <point val="20,19.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,18.9586;20,19.2786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[39].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,19.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O337">
      <attribute name="obj_pos">
        <point val="16.4,20"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,19.7586;16.4,20.0786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[40].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,20"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O338">
      <attribute name="obj_pos">
        <point val="14.05,20"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,19.7586;14.05,20.0786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[40].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,20"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O339">
      <attribute name="obj_pos">
        <point val="17.7,20"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,19.7586;17.7,20.0786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[40].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,20"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O340">
      <attribute name="obj_pos">
        <point val="20,20"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,19.7586;20,20.0786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[40].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,20"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O341">
      <attribute name="obj_pos">
        <point val="16.4,20.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,20.5086;16.4,20.8286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[41].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,20.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O342">
      <attribute name="obj_pos">
        <point val="14.05,20.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,20.5086;14.05,20.8286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[41].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,20.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O343">
      <attribute name="obj_pos">
        <point val="17.7,20.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,20.5086;17.7,20.8286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[41].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,20.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O344">
      <attribute name="obj_pos">
        <point val="20,20.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,20.5086;20,20.8286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[41].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,20.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O345">
      <attribute name="obj_pos">
        <point val="16.4,21.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,21.3086;16.4,21.6286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[42].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,21.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O346">
      <attribute name="obj_pos">
        <point val="14.05,21.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,21.3086;14.05,21.6286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[42].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,21.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O347">
      <attribute name="obj_pos">
        <point val="17.7,21.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,21.3086;17.7,21.6286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[42].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,21.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O348">
      <attribute name="obj_pos">
        <point val="20,21.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,21.3086;20,21.6286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[42].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,21.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O349">
      <attribute name="obj_pos">
        <point val="16.4,22.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,22.0586;16.4,22.3786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[43].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,22.3"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O350">
      <attribute name="obj_pos">
        <point val="14.05,22.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,22.0586;14.05,22.3786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[43].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,22.3"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O351">
      <attribute name="obj_pos">
        <point val="17.7,22.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,22.0586;17.7,22.3786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[43].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,22.3"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O352">
      <attribute name="obj_pos">
        <point val="20,22.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,22.0586;20,22.3786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[43].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,22.3"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O353">
      <attribute name="obj_pos">
        <point val="16.4,23.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,22.8086;16.4,23.1286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[44].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,23.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O354">
      <attribute name="obj_pos">
        <point val="14.05,23.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,22.8086;14.05,23.1286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[44].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,23.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O355">
      <attribute name="obj_pos">
        <point val="17.7,23.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,22.8086;17.7,23.1286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[44].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,23.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O356">
      <attribute name="obj_pos">
        <point val="20,23.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,22.8086;20,23.1286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[44].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,23.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O357">
      <attribute name="obj_pos">
        <point val="16.4,23.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,23.6086;16.4,23.9286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[45].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,23.85"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O358">
      <attribute name="obj_pos">
        <point val="14.05,23.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,23.6086;14.05,23.9286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[45].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,23.85"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O359">
      <attribute name="obj_pos">
        <point val="17.7,23.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,23.6086;17.7,23.9286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[45].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,23.85"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O360">
      <attribute name="obj_pos">
        <point val="20,23.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,23.6086;20,23.9286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[45].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,23.85"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O361">
      <attribute name="obj_pos">
        <point val="16.4,24.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,24.3586;16.4,24.6786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[46].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,24.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O362">
      <attribute name="obj_pos">
        <point val="14.05,24.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,24.3586;14.05,24.6786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[46].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,24.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O363">
      <attribute name="obj_pos">
        <point val="17.7,24.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,24.3586;17.7,24.6786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[46].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,24.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O364">
      <attribute name="obj_pos">
        <point val="20,24.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,24.3586;20,24.6786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[46].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,24.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O365">
      <attribute name="obj_pos">
        <point val="16.4,25.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2313,25.1586;16.4,25.4786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[47].NYUIN.N-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,25.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O366">
      <attribute name="obj_pos">
        <point val="14.05,25.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8671,25.1586;14.05,25.4786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[47].NYUIN.N-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="14.05,25.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O367">
      <attribute name="obj_pos">
        <point val="17.7,25.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5171,25.1586;17.7,25.4786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[47].GAIRAI.G-KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#99,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="17.7,25.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O368">
      <attribute name="obj_pos">
        <point val="20,25.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8313,25.1586;20,25.4786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#DATA-TBL[47].GAIRAI.G-TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="20,25.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.197152"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O369">
      <attribute name="obj_pos">
        <point val="7.15918,3.575"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.15918,3.34868;8.67418,3.64868"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TOKUBETU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#195;&#202;&#204;&#206;&#197;&#205;&#220;&#200;&#241;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="7.15918,3.575"/>
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
</diagram>
