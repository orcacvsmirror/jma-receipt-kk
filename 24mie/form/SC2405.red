<?xml version="1.0"?>
<diagram xmlns:dia="http://www.lysator.liu.se/~alla/dia/">
  <dictionarydata>
    <element name="HOSPCD-G" occurs="7">
      <element name="HOSPCD" occurs="1">
        <appinfo>
          <embed object="string" length="2"/>
        </appinfo>
      </element>
    </element>
    <element name="SEIYMD" occurs="1">
      <appinfo>
        <embed object="string" length="22"/>
      </appinfo>
    </element>
    <element name="CITYNAME" occurs="2">
      <appinfo>
        <embed object="string" length="20"/>
      </appinfo>
    </element>
    <element name="POST" occurs="1">
      <appinfo>
        <embed object="string" length="18"/>
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
    <element name="KAISETU" occurs="1">
      <appinfo>
        <embed object="string" length="40"/>
      </appinfo>
    </element>
    <element name="TEL" occurs="1">
      <appinfo>
        <embed object="string" length="24"/>
      </appinfo>
    </element>
    <element name="CITYCD" occurs="1">
      <appinfo>
        <embed object="string" length="3"/>
      </appinfo>
    </element>
    <element name="SEIYM" occurs="1">
      <appinfo>
        <embed object="string" length="16"/>
      </appinfo>
    </element>
    <element name="KENSU-TBL" occurs="6">
      <element name="KENSU" occurs="1">
        <appinfo>
          <embed object="string" length="5"/>
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
        <point val="6.45,2.45034"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.435,2.43534;18.4657,5.015"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="6.45,2.45034"/>
      </attribute>
      <attribute name="elem_width">
        <real val="12.0007"/>
      </attribute>
      <attribute name="elem_height">
        <real val="2.54966"/>
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
        <point val="2.4,5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.385,4.985;18.465,24.565"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="2.4,5"/>
      </attribute>
      <attribute name="elem_width">
        <real val="16.05"/>
      </attribute>
      <attribute name="elem_height">
        <real val="19.55"/>
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
        <point val="6.45,3.72517"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.435,3.71017;18.4657,3.74017"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.45,3.72517"/>
        <point val="18.4507,3.72517"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
      <connections>
        <connection handle="0" to="O0" connection="3"/>
        <connection handle="1" to="O0" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O3">
      <attribute name="obj_pos">
        <point val="6.45,3.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.445,3.245;18.4557,3.255"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.45,3.25"/>
        <point val="18.4507,3.25"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O4">
      <attribute name="obj_pos">
        <point val="8.85,3.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.845,3.245;8.855,5.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="8.85,3.25"/>
        <point val="8.85,5"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O5">
      <attribute name="obj_pos">
        <point val="12.45,3.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.445,3.245;12.455,5.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.45,3.25"/>
        <point val="12.45,5"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O6">
      <attribute name="obj_pos">
        <point val="17.25,3.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.245,3.245;17.2553,5.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.25,3.25"/>
        <point val="17.2503,5"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O7">
      <attribute name="obj_pos">
        <point val="10.05,3.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.045,3.245;10.055,5.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.05,3.25"/>
        <point val="10.05,5"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O8">
      <attribute name="obj_pos">
        <point val="7.65,3.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.645,3.745;7.655,5.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="7.65,3.75"/>
        <point val="7.65,5"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O9">
      <attribute name="obj_pos">
        <point val="11.25,3.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.245,3.745;11.255,5.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="11.25,3.75"/>
        <point val="11.25,5"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O10">
      <attribute name="obj_pos">
        <point val="13.65,3.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.645,3.745;13.655,5.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.65,3.75"/>
        <point val="13.65,5"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O11">
      <attribute name="obj_pos">
        <point val="14.85,3.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.845,3.745;14.855,5.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.85,3.75"/>
        <point val="14.85,5"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O12">
      <attribute name="obj_pos">
        <point val="16.05,3.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.045,3.745;16.055,5.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="16.05,3.75"/>
        <point val="16.05,5"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O13">
      <attribute name="obj_pos">
        <point val="3.25,26.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.245,26.095;7.605,27.0725"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="3.25,26.1"/>
      </attribute>
      <attribute name="elem_width">
        <real val="4.35"/>
      </attribute>
      <attribute name="elem_height">
        <real val="0.967492"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O14">
      <attribute name="obj_pos">
        <point val="5.425,26.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.42,26.095;5.43,27.0725"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.425,26.1"/>
        <point val="5.425,27.0675"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O13" connection="1"/>
        <connection handle="1" to="O13" connection="6"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O15">
      <attribute name="obj_pos">
        <point val="4.35,26.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.345,26.095;4.36289,27.0725"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4.35,26.1"/>
        <point val="4.35789,27.0675"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O16">
      <attribute name="obj_pos">
        <point val="6.5,26.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.4907,26.095;6.505,27.0725"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.5,26.1"/>
        <point val="6.4957,27.0675"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O17">
      <attribute name="obj_pos">
        <point val="9.775,26.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.77,26.095;9.78,27.0725"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="9.775,26.1"/>
        <point val="9.775,27.0675"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O18" connection="1"/>
        <connection handle="1" to="O18" connection="6"/>
      </connections>
    </object>
    <object type="Standard - Box" version="0" id="O18">
      <attribute name="obj_pos">
        <point val="7.6,26.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.595,26.095;11.955,27.0725"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="7.6,26.1"/>
      </attribute>
      <attribute name="elem_width">
        <real val="4.35"/>
      </attribute>
      <attribute name="elem_height">
        <real val="0.967492"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O19">
      <attribute name="obj_pos">
        <point val="3.25,25.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.245,25.295;11.955,26.105"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="3.25,25.3"/>
      </attribute>
      <attribute name="elem_width">
        <real val="8.7"/>
      </attribute>
      <attribute name="elem_height">
        <real val="0.8"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O20">
      <attribute name="obj_pos">
        <point val="7.6,25.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.595,25.295;7.605,26.105"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="7.6,25.3"/>
        <point val="7.6,26.1"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O19" connection="1"/>
        <connection handle="1" to="O19" connection="6"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O21">
      <attribute name="obj_pos">
        <point val="8.7,26.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.695,26.095;8.70918,27.0725"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="8.7,26.1"/>
        <point val="8.70418,27.0675"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O22">
      <attribute name="obj_pos">
        <point val="10.85,26.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.837,26.095;10.855,27.0725"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.85,26.1"/>
        <point val="10.842,27.0675"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O23">
      <attribute name="obj_pos">
        <point val="4,14.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.985,14.085;15.615,24.165"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="4,14.1"/>
      </attribute>
      <attribute name="elem_width">
        <real val="11.6"/>
      </attribute>
      <attribute name="elem_height">
        <real val="10.05"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.03"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O24">
      <attribute name="obj_pos">
        <point val="4,15.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.985,15.085;15.615,15.115"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4,15.1"/>
        <point val="15.6,15.1"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O25">
      <attribute name="obj_pos">
        <point val="4,16.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.985,16.085;15.615,16.115"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4,16.1"/>
        <point val="15.6,16.1"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O26">
      <attribute name="obj_pos">
        <point val="4,17.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.985,17.135;15.615,17.165"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4,17.15"/>
        <point val="15.6,17.15"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O27">
      <attribute name="obj_pos">
        <point val="4,23.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.985,23.135;15.615,23.165"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4,23.15"/>
        <point val="15.6,23.15"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O28">
      <attribute name="obj_pos">
        <point val="4,18.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.995,18.145;15.605,18.155"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4,18.15"/>
        <point val="15.6,18.15"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O29">
      <attribute name="obj_pos">
        <point val="5.15,19.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.145,19.145;15.605,19.155"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.15,19.15"/>
        <point val="15.6,19.15"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O30">
      <attribute name="obj_pos">
        <point val="5.15,20.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.145,20.145;15.605,20.155"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.15,20.15"/>
        <point val="15.6,20.15"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O31">
      <attribute name="obj_pos">
        <point val="5.15,21.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.145,21.145;15.605,21.155"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.15,21.15"/>
        <point val="15.6,21.15"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O32">
      <attribute name="obj_pos">
        <point val="5.15,22.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.145,22.145;15.605,22.155"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.15,22.15"/>
        <point val="15.6,22.15"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O33">
      <attribute name="obj_pos">
        <point val="5.15,18.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.145,18.145;5.155,23.155"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.15,18.15"/>
        <point val="5.15,23.15"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O34">
      <attribute name="obj_pos">
        <point val="8.84652,14.1016"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.84152,14.0966;8.855,24.155"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="8.84652,14.1016"/>
        <point val="8.85,24.15"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
  </layer>
  <layer name="&#202;&#184;&#187;&#250;" visible="true">
    <object type="Standard - Text" version="0" id="O35">
      <attribute name="obj_pos">
        <point val="5.94541,6.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.94541,5.74259;14.5708,6.44259"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#206;&#206; &#188;&#253; &#190;&#218; &#204;&#192; &#189;&#241; &#193;&#247; &#201;&#213; &#189;&#241;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.7"/>
          </attribute>
          <attribute name="pos">
            <point val="5.94541,6.3"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.4242"/>
          </attribute>
          <attribute name="multi">
            <real val="0.3535"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O36">
      <attribute name="obj_pos">
        <point val="8.41908,8.01466"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.41908,7.61651;9.42908,8.11651"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#196;&#185;&#205;&#205;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="8.41908,8.01466"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.303"/>
          </attribute>
          <attribute name="multi">
            <real val="0.2525"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O37">
      <attribute name="obj_pos">
        <point val="8.99364,9.61767"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.99364,9.37878;10.2662,9.67878"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#189;&#234; &#186;&#223; &#195;&#207;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="8.99364,9.61767"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.1818"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O38">
      <attribute name="obj_pos">
        <point val="8.99364,10.7857"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.99364,10.5468;10.3268,10.8468"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#204;&#190;    &#190;&#206;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="8.99364,10.7857"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.1818"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O39">
      <attribute name="obj_pos">
        <point val="8.99364,11.6594"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.99364,11.4205;10.5086,11.7205"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#179;&#171;&#192;&#223;&#188;&#212;&#187;&#225;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="8.99364,11.6594"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.1818"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O40">
      <attribute name="obj_pos">
        <point val="8.99364,12.309"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.99364,12.0701;10.2056,12.3701"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#197;&#207;&#195;&#200;&#214;&#185;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="8.99364,12.309"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.1818"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O41">
      <attribute name="obj_pos">
        <point val="7.03162,11.1357"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.03162,10.8968;8.54662,11.1968"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#229;&#206;&#197;&#181;&#161;&#180;&#216;&#197;&#249;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="7.03162,11.1357"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.1818"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O42">
      <attribute name="obj_pos">
        <point val="17.4913,11.6922"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.4913,11.4533;17.7943,11.7533"/>
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
            <point val="17.4913,11.6922"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.1818"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O43">
      <attribute name="obj_pos">
        <point val="4.53834,23.8853"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.53834,23.527;8.90154,23.977"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#205;&#185;     &#193;&#247;     &#206;&#193; #</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="4.53834,23.8853"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2727"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O44">
      <attribute name="obj_pos">
        <point val="5.55088,18.8293"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.55088,18.5108;8.54048,18.9108"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#191;&#180; &#191;&#200; &#190;&#227; &#179;&#178; &#188;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.55088,18.8293"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2424"/>
          </attribute>
          <attribute name="multi">
            <real val="0.202"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O45">
      <attribute name="obj_pos">
        <point val="5.55088,19.8147"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.55088,19.4962;8.54048,19.8962"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#236; &#191;&#205; &#191;&#198; &#178;&#200; &#196;&#237;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.55088,19.8147"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2424"/>
          </attribute>
          <attribute name="multi">
            <real val="0.202"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O46">
      <attribute name="obj_pos">
        <point val="5.47008,20.8823"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.47008,20.5638;8.62128,20.9638"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#253;    &#205;&#196;    &#187;&#249;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.47008,20.8823"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2424"/>
          </attribute>
          <attribute name="multi">
            <real val="0.202"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O47">
      <attribute name="obj_pos">
        <point val="5.42968,21.794"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.42968,21.4755;8.66168,21.8755"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#207;&#183;          &#191;&#205;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.42968,21.794"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2424"/>
          </attribute>
          <attribute name="multi">
            <real val="0.202"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O48">
      <attribute name="obj_pos">
        <point val="3.15,13.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15,13.1554;16.9769,13.5254"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#161;&#187;&#227;&#176;&#229;&#206;&#197;&#200;&#241;&#189;&#245;&#192;&#174;&#192;&#169;&#197;&#217;&#164;&#206;&#194;&#208;&#190;&#221;&#164;&#200;&#164;&#202;&#164;&#235;&#188;&#212;&#164;&#206;&#206;&#206;&#188;&#253;&#190;&#218;&#204;&#192;&#189;&#241;&#164;&#242;&#178;&#188;&#181;&#173;&#164;&#206;&#164;&#200;&#164;&#170;&#164;&#234;&#193;&#247;&#201;&#213;&#164;&#164;&#164;&#191;&#164;&#183;&#164;&#222;&#164;&#185;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.37"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15,13.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.22422"/>
          </attribute>
          <attribute name="multi">
            <real val="0.18685"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O49">
      <attribute name="obj_pos">
        <point val="4.4,19.6813"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.4,19.323;4.8545,22.023"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#226;




&#204;&#245;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="4.4,19.6813"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2727"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O50">
      <attribute name="obj_pos">
        <point val="8.77862,3.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.77862,2.65185;16.3536,3.15185"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#229;   &#206;&#197;   &#181;&#161;   &#180;&#216;   &#200;&#214;   &#185;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="8.77862,3.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.303"/>
          </attribute>
          <attribute name="multi">
            <real val="0.2525"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O51">
      <attribute name="obj_pos">
        <point val="6.97633,3.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.97633,3.30537;8.54587,3.67537"/>
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
            <real val="0.37"/>
          </attribute>
          <attribute name="pos">
            <point val="6.97633,3.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.22422"/>
          </attribute>
          <attribute name="multi">
            <real val="0.18685"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O52">
      <attribute name="obj_pos">
        <point val="9.1,3.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.1,3.30537;9.8474,3.67537"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#182;&#232;&#202;&#172;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.37"/>
          </attribute>
          <attribute name="pos">
            <point val="9.1,3.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.22422"/>
          </attribute>
          <attribute name="multi">
            <real val="0.18685"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O53">
      <attribute name="obj_pos">
        <point val="10.35,3.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.35,3.30537;12.2185,3.67537"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#195;&#207;&#182;&#232;&#165;&#179;&#161;&#188;&#165;&#201;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.37"/>
          </attribute>
          <attribute name="pos">
            <point val="10.35,3.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.22422"/>
          </attribute>
          <attribute name="multi">
            <real val="0.18685"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O54">
      <attribute name="obj_pos">
        <point val="13.867,3.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.867,3.30537;15.9597,3.67537"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#207;&#162;      &#200;&#214;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.37"/>
          </attribute>
          <attribute name="pos">
            <point val="13.867,3.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.22422"/>
          </attribute>
          <attribute name="multi">
            <real val="0.18685"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O55">
      <attribute name="obj_pos">
        <point val="17.45,3.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.45,3.30537;18.1974,3.67537"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#195;&#163;&#196;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.37"/>
          </attribute>
          <attribute name="pos">
            <point val="17.45,3.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.22422"/>
          </attribute>
          <attribute name="multi">
            <real val="0.18685"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O56">
      <attribute name="obj_pos">
        <point val="14.8237,17.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8237,17.5417;15.2782,17.9917"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#239;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="14.8237,17.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2727"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O57">
      <attribute name="obj_pos">
        <point val="14.8237,18.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8237,18.5417;15.2782,18.9917"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#239;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="14.8237,18.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2727"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O58">
      <attribute name="obj_pos">
        <point val="14.8237,19.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8237,19.5417;15.2782,19.9917"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#239;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="14.8237,19.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2727"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O59">
      <attribute name="obj_pos">
        <point val="14.8237,20.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8237,20.5417;15.2782,20.9917"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#239;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="14.8237,20.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2727"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O60">
      <attribute name="obj_pos">
        <point val="14.8237,21.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8237,21.5417;15.2782,21.9917"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#239;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="14.8237,21.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2727"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O61">
      <attribute name="obj_pos">
        <point val="14.8237,22.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8237,22.4917;15.2782,22.9417"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#239;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="14.8237,22.85"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2727"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O62">
      <attribute name="obj_pos">
        <point val="14.8237,23.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8237,23.5417;15.2782,23.9917"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#177;&#223;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="14.8237,23.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2727"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <group>
      <object type="Standard - Text" version="0" id="O63">
        <attribute name="obj_pos">
          <point val="3.5,25.15"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="3.5,24.8315;5.924,25.2315"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#187;&#212;&#196;&#174;&#194;&#188;&#181;&#173;&#198;&#254;&#205;&#243;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="3.5,25.15"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2424"/>
            </attribute>
            <attribute name="multi">
              <real val="0.202"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O64">
        <attribute name="obj_pos">
          <point val="4.2,25.85"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="4.2,25.5315;6.624,25.9315"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#188;&#232;&#164;&#234;&#176;&#183;&#164;&#164;&#199;&#175;&#183;&#238;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="4.2,25.85"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2424"/>
            </attribute>
            <attribute name="multi">
              <real val="0.202"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O65">
        <attribute name="obj_pos">
          <point val="8.7,25.85"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="8.7,25.5315;10.72,25.9315"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#165;&#208;&#165;&#195;&#165;&#193;&#200;&#214;&#185;&#230;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="8.7,25.85"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2424"/>
            </attribute>
            <attribute name="multi">
              <real val="0.202"/>
            </attribute>
          </composite>
        </attribute>
      </object>
    </group>
    <object type="Standard - Text" version="0" id="O66">
      <attribute name="obj_pos">
        <point val="2.48763,7.96166"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.48763,7.72277;4.00263,8.02277"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#161;&#202;&#164;&#162;&#164;&#198;&#192;&#232;&#161;&#203;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.48763,7.96166"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.1818"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O67">
      <attribute name="obj_pos">
        <point val="9.85,4.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.042,4.06296;9.85,4.86296"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#177;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.8"/>
          </attribute>
          <attribute name="pos">
            <point val="9.85,4.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.4848"/>
          </attribute>
          <attribute name="multi">
            <real val="0.404"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O68">
      <attribute name="obj_pos">
        <point val="7.45,4.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.642,4.06296;7.45,4.86296"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#178;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.8"/>
          </attribute>
          <attribute name="pos">
            <point val="7.45,4.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.4848"/>
          </attribute>
          <attribute name="multi">
            <real val="0.404"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O69">
      <attribute name="obj_pos">
        <point val="8.65,4.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.842,4.06296;8.65,4.86296"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#180;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.8"/>
          </attribute>
          <attribute name="pos">
            <point val="8.65,4.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.4848"/>
          </attribute>
          <attribute name="multi">
            <real val="0.404"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O70">
      <attribute name="obj_pos">
        <point val="5.47008,22.7994"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.47008,22.4809;8.62128,22.8809"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#189;    &#164;&#206;    &#194;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.47008,22.7994"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2424"/>
          </attribute>
          <attribute name="multi">
            <real val="0.202"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <group>
      <object type="Standard - Text" version="0" id="O71">
        <attribute name="obj_pos">
          <point val="4.42668,14.8116"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="4.42668,14.4533;4.88118,14.9033"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#193;&#247;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="4.42668,14.8116"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O72">
        <attribute name="obj_pos">
          <point val="5.16012,14.8116"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="5.16012,14.4533;5.61462,14.9033"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#201;&#213;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="5.16012,14.8116"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O73">
        <attribute name="obj_pos">
          <point val="5.89356,14.8116"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="5.89356,14.4533;6.34806,14.9033"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#192;&#232;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="5.89356,14.8116"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O74">
        <attribute name="obj_pos">
          <point val="6.62699,14.8116"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="6.62699,14.4533;7.08149,14.9033"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#187;&#212;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="6.62699,14.8116"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O75">
        <attribute name="obj_pos">
          <point val="7.36043,14.8116"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="7.36043,14.4533;7.81493,14.9033"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#196;&#174;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="7.36043,14.8116"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O76">
        <attribute name="obj_pos">
          <point val="8.09387,14.8116"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="8.09387,14.4533;8.54837,14.9033"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#194;&#188;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="8.09387,14.8116"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
    </group>
    <group>
      <object type="Standard - Text" version="0" id="O77">
        <attribute name="obj_pos">
          <point val="4.41896,15.7656"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="4.41896,15.4073;4.87346,15.8573"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#187;&#212;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="4.41896,15.7656"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O78">
        <attribute name="obj_pos">
          <point val="5.1524,15.7656"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="5.1524,15.4073;5.6069,15.8573"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#196;&#174;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="5.1524,15.7656"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O79">
        <attribute name="obj_pos">
          <point val="5.88584,15.7656"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="5.88584,15.4073;6.34034,15.8573"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#194;&#188;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="5.88584,15.7656"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O80">
        <attribute name="obj_pos">
          <point val="6.61928,15.7656"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="6.61928,15.4073;7.07378,15.8573"/>
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
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="6.61928,15.7656"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O81">
        <attribute name="obj_pos">
          <point val="7.35271,15.7656"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="7.35271,15.4073;7.80721,15.8573"/>
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
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="7.35271,15.7656"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O82">
        <attribute name="obj_pos">
          <point val="8.08615,15.7656"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="8.08615,15.4073;8.54065,15.8573"/>
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
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="8.08615,15.7656"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
    </group>
    <group>
      <object type="Standard - Text" version="0" id="O83">
        <attribute name="obj_pos">
          <point val="4.46502,16.8117"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="4.46502,16.4534;4.91952,16.9034"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#193;&#247;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="4.46502,16.8117"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O84">
        <attribute name="obj_pos">
          <point val="8.12921,16.8117"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="8.12921,16.4534;8.58371,16.9034"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#183;&#238;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="8.12921,16.8117"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O85">
        <attribute name="obj_pos">
          <point val="6.29711,16.8117"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="6.29711,16.4534;6.75161,16.9034"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#201;&#213;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="6.29711,16.8117"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
    </group>
    <group>
      <object type="Standard - Text" version="0" id="O86">
        <attribute name="obj_pos">
          <point val="4.42668,17.7798"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="4.42668,17.4215;4.88118,17.8715"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#190;&#218;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="4.42668,17.7798"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O87">
        <attribute name="obj_pos">
          <point val="5.64908,17.7798"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="5.64908,17.4215;6.10358,17.8715"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#204;&#192;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="5.64908,17.7798"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O88">
        <attribute name="obj_pos">
          <point val="6.87147,17.7798"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="6.87147,17.4215;7.32597,17.8715"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#183;&#239;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="6.87147,17.7798"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O89">
        <attribute name="obj_pos">
          <point val="8.09387,17.7798"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="8.09387,17.4215;8.54837,17.8715"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#191;&#244;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.45"/>
            </attribute>
            <attribute name="pos">
              <point val="8.09387,17.7798"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.2727"/>
            </attribute>
            <attribute name="multi">
              <real val="0.22725"/>
            </attribute>
          </composite>
        </attribute>
      </object>
    </group>
  </layer>
  <layer name="&#186;&#185;&#164;&#183;&#185;&#254;&#164;&#223;" visible="true">
    <object type="Embed - Text" version="0" id="O90">
      <attribute name="obj_pos">
        <point val="6.1076,8.01466"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.8351,7.65633;8.3801,8.10633"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#CITYNAME[0]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="6.1076,8.01466"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.2727"/>
          </attribute>
          <attribute name="multi">
            <real val="0.22725"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O91">
      <attribute name="obj_pos">
        <point val="11.05,4.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.242,4.06296;11.05,4.86296"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HOSPCD-G[0].HOSPCD#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#185;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.8"/>
          </attribute>
          <attribute name="pos">
            <point val="11.05,4.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.4848"/>
          </attribute>
          <attribute name="multi">
            <real val="0.404"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O92">
      <attribute name="obj_pos">
        <point val="12.212,14.8147"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.687,14.4166;14.737,14.9166"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#CITYNAME[1]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="12.212,14.8147"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.303"/>
          </attribute>
          <attribute name="multi">
            <real val="0.2525"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O93">
      <attribute name="obj_pos">
        <point val="14.1,18.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.888,18.5019;14.1,19.0019"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KENSU-TBL[0].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="14.1,18.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.303"/>
          </attribute>
          <attribute name="multi">
            <real val="0.2525"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O94">
      <attribute name="obj_pos">
        <point val="14.1,19.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.888,19.5019;14.1,20.0019"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KENSU-TBL[1].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="14.1,19.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.303"/>
          </attribute>
          <attribute name="multi">
            <real val="0.2525"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O95">
      <attribute name="obj_pos">
        <point val="14.1,20.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.888,20.5019;14.1,21.0019"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KENSU-TBL[2].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="14.1,20.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.303"/>
          </attribute>
          <attribute name="multi">
            <real val="0.2525"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O96">
      <attribute name="obj_pos">
        <point val="14.1,21.847"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.888,21.4489;14.1,21.9489"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KENSU-TBL[3].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="14.1,21.847"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.303"/>
          </attribute>
          <attribute name="multi">
            <real val="0.2525"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O97">
      <attribute name="obj_pos">
        <point val="11.55,15.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.55,15.3722;12.6408,15.9722"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#CITYCD#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="11.55,15.85"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.3636"/>
          </attribute>
          <attribute name="multi">
            <real val="0.303"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O98">
      <attribute name="obj_pos">
        <point val="10.3113,16.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3113,16.4519;14.3513,16.9519"/>
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
            <string>#&#202;&#191;&#192;&#174;&#163;&#185;&#163;&#185;&#199;&#175;&#163;&#185;&#163;&#185;&#183;&#238;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3113,16.85"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.303"/>
          </attribute>
          <attribute name="multi">
            <real val="0.2525"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O99">
      <attribute name="obj_pos">
        <point val="12.3,4.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.492,4.06296;12.3,4.86296"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HOSPCD-G[1].HOSPCD#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#185;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.8"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,4.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.4848"/>
          </attribute>
          <attribute name="multi">
            <real val="0.404"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O100">
      <attribute name="obj_pos">
        <point val="13.45,4.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.642,4.06296;13.45,4.86296"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HOSPCD-G[2].HOSPCD#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#185;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.8"/>
          </attribute>
          <attribute name="pos">
            <point val="13.45,4.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.4848"/>
          </attribute>
          <attribute name="multi">
            <real val="0.404"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O101">
      <attribute name="obj_pos">
        <point val="14.65,4.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.842,4.06296;14.65,4.86296"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HOSPCD-G[3].HOSPCD#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#185;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.8"/>
          </attribute>
          <attribute name="pos">
            <point val="14.65,4.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.4848"/>
          </attribute>
          <attribute name="multi">
            <real val="0.404"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O102">
      <attribute name="obj_pos">
        <point val="15.85,4.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.042,4.06296;15.85,4.86296"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HOSPCD-G[4].HOSPCD#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#185;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.8"/>
          </attribute>
          <attribute name="pos">
            <point val="15.85,4.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.4848"/>
          </attribute>
          <attribute name="multi">
            <real val="0.404"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O103">
      <attribute name="obj_pos">
        <point val="17.05,4.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.242,4.06296;17.05,4.86296"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HOSPCD-G[5].HOSPCD#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#185;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.8"/>
          </attribute>
          <attribute name="pos">
            <point val="17.05,4.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.4848"/>
          </attribute>
          <attribute name="multi">
            <real val="0.404"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O104">
      <attribute name="obj_pos">
        <point val="18.25,4.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.442,4.06296;18.25,4.86296"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HOSPCD-G[6].HOSPCD#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#185;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.8"/>
          </attribute>
          <attribute name="pos">
            <point val="18.25,4.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.4848"/>
          </attribute>
          <attribute name="multi">
            <real val="0.404"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O105">
      <attribute name="obj_pos">
        <point val="14.039,7.31497"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.039,6.99645;18.2406,7.39645"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIYMD#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#191;&#192;&#174;   &#199;&#175;   &#183;&#238;   &#198;&#252;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="14.039,7.31497"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2424"/>
          </attribute>
          <attribute name="multi">
            <real val="0.202"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O106">
      <attribute name="obj_pos">
        <point val="10.7036,9.60247"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.7036,9.36358;12.461,9.66358"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#POST#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#162;&#169;999-9999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.7036,9.60247"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.1818"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O107">
      <attribute name="obj_pos">
        <point val="10.7036,9.9735"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.7036,9.73461;18.2786,10.3346"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ADRS#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;
&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.7036,9.9735"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.1818"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O108">
      <attribute name="obj_pos">
        <point val="10.7036,10.8039"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.7036,10.565;18.2786,11.165"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HOSPNAME#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;
&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.7036,10.8039"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.1818"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O109">
      <attribute name="obj_pos">
        <point val="10.7036,11.6873"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.7036,11.4484;16.7636,11.7484"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KAISETU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.7036,11.6873"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.1818"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O110">
      <attribute name="obj_pos">
        <point val="10.7036,12.3057"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.7036,11.9872;14.3396,12.3872"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TEL#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#123456789012345#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.7036,12.3057"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2424"/>
          </attribute>
          <attribute name="multi">
            <real val="0.202"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O111">
      <attribute name="obj_pos">
        <point val="14.0987,22.8084"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8867,22.4103;14.0987,22.9103"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KENSU-TBL[4].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="14.0987,22.8084"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.303"/>
          </attribute>
          <attribute name="multi">
            <real val="0.2525"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O112">
      <attribute name="obj_pos">
        <point val="14.0843,17.8614"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.8723,17.4633;14.0843,17.9633"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KENSU-TBL[5].KENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#9999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="14.0843,17.8614"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.303"/>
          </attribute>
          <attribute name="multi">
            <real val="0.2525"/>
          </attribute>
        </composite>
      </attribute>
    </object>
  </layer>
</diagram>
