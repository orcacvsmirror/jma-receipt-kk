<?xml version="1.0"?>
<diagram xmlns:dia="http://www.lysator.liu.se/~alla/dia/">
  <dictionarydata>
    <element name="SRYY" occurs="1">
      <appinfo>
        <embed object="string" length="4"/>
      </appinfo>
    </element>
    <element name="SRYM" occurs="1">
      <appinfo>
        <embed object="string" length="4"/>
      </appinfo>
    </element>
    <element name="POST" occurs="1">
      <appinfo>
        <embed object="string" length="8"/>
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
        <embed object="string" length="80"/>
      </appinfo>
    </element>
    <element name="HOSPCD" occurs="7">
      <appinfo>
        <embed object="string" length="1"/>
      </appinfo>
    </element>
    <element name="TEL" occurs="1">
      <appinfo>
        <embed object="string" length="15"/>
      </appinfo>
    </element>
    <element name="SEIKYU" occurs="15">
      <element name="KENSU" occurs="1">
        <appinfo>
          <embed object="string" length="5"/>
        </appinfo>
      </element>
      <element name="TENSU" occurs="1">
        <appinfo>
          <embed object="string" length="9"/>
        </appinfo>
      </element>
    </element>
    <element name="KENNAI" occurs="1">
      <appinfo>
        <embed object="string" length="3"/>
      </appinfo>
    </element>
    <element name="KENGAI" occurs="1">
      <appinfo>
        <embed object="string" length="3"/>
      </appinfo>
    </element>
    <element name="KOGAKU" occurs="4">
      <appinfo>
        <embed object="string" length="3"/>
      </appinfo>
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
    <object type="Standard - Box" version="0" id="O0">
      <attribute name="obj_pos">
        <point val="2,5.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,5.395;19.005,7.905"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="2,5.4"/>
      </attribute>
      <attribute name="elem_width">
        <real val="17"/>
      </attribute>
      <attribute name="elem_height">
        <real val="2.5"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O1">
      <attribute name="obj_pos">
        <point val="11.5,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.495,4.595;19.005,5.405"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="11.5,4.6"/>
      </attribute>
      <attribute name="elem_width">
        <real val="7.5"/>
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
    <object type="Standard - Line" version="0" id="O2">
      <attribute name="obj_pos">
        <point val="11.5,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.485,4.585;19.015,4.615"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="11.5,4.6"/>
        <point val="19,4.6"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
      <connections>
        <connection handle="0" to="O1" connection="0"/>
        <connection handle="1" to="O1" connection="2"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O3">
      <attribute name="obj_pos">
        <point val="2,7.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.985,7.885;19.015,7.915"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,7.9"/>
        <point val="19,7.9"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
      <connections>
        <connection handle="0" to="O0" connection="5"/>
        <connection handle="1" to="O0" connection="7"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O4">
      <attribute name="obj_pos">
        <point val="2,5.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.985,5.385;11.515,5.415"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,5.4"/>
        <point val="11.5,5.4"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
      <connections>
        <connection handle="0" to="O0" connection="0"/>
        <connection handle="1" to="O1" connection="5"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O5">
      <attribute name="obj_pos">
        <point val="2,5.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.985,5.385;2.015,7.915"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,5.4"/>
        <point val="2,7.9"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
      <connections>
        <connection handle="0" to="O0" connection="0"/>
        <connection handle="1" to="O0" connection="5"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O6">
      <attribute name="obj_pos">
        <point val="11.5,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.485,4.585;11.515,5.415"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="11.5,4.6"/>
        <point val="11.5,5.4"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
      <connections>
        <connection handle="0" to="O1" connection="0"/>
        <connection handle="1" to="O1" connection="5"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O7">
      <attribute name="obj_pos">
        <point val="19,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.985,4.585;19.015,7.915"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="19,4.6"/>
        <point val="19,7.9"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
      <connections>
        <connection handle="0" to="O1" connection="2"/>
        <connection handle="1" to="O0" connection="7"/>
      </connections>
    </object>
    <object type="Standard - Box" version="0" id="O8">
      <attribute name="obj_pos">
        <point val="2,8.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,8.095;14.005,21.705"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="2,8.1"/>
      </attribute>
      <attribute name="elem_width">
        <real val="12"/>
      </attribute>
      <attribute name="elem_height">
        <real val="13.6"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O9">
      <attribute name="obj_pos">
        <point val="2,21.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,21.695;6.93,24.205"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="2,21.7"/>
      </attribute>
      <attribute name="elem_width">
        <real val="4.925"/>
      </attribute>
      <attribute name="elem_height">
        <real val="2.5"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O10">
      <attribute name="obj_pos">
        <point val="2,8.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.985,8.085;2.015,24.215"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,8.1"/>
        <point val="2,24.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
      <connections>
        <connection handle="0" to="O8" connection="0"/>
        <connection handle="1" to="O9" connection="5"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O11">
      <attribute name="obj_pos">
        <point val="6.925,24.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.985,24.185;6.94,24.215"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.925,24.2"/>
        <point val="2,24.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
      <connections>
        <connection handle="0" to="O9" connection="7"/>
        <connection handle="1" to="O9" connection="5"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O12">
      <attribute name="obj_pos">
        <point val="14,21.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.91,21.685;14.015,21.715"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14,21.7"/>
        <point val="6.925,21.7"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
      <connections>
        <connection handle="0" to="O8" connection="7"/>
        <connection handle="1" to="O9" connection="2"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O13">
      <attribute name="obj_pos">
        <point val="14,8.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.985,8.085;14.015,8.115"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14,8.1"/>
        <point val="2,8.1"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
      <connections>
        <connection handle="0" to="O8" connection="2"/>
        <connection handle="1" to="O8" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Box" version="0" id="O14">
      <attribute name="obj_pos">
        <point val="14.3,8.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.295,8.095;19.005,12.555"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="14.3,8.1"/>
      </attribute>
      <attribute name="elem_width">
        <real val="4.7"/>
      </attribute>
      <attribute name="elem_height">
        <real val="4.45"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O15">
      <attribute name="obj_pos">
        <point val="14.3,12.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.285,12.785;19.015,17.315"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="14.3,12.8"/>
      </attribute>
      <attribute name="elem_width">
        <real val="4.7"/>
      </attribute>
      <attribute name="elem_height">
        <real val="4.5"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.03"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O16">
      <attribute name="obj_pos">
        <point val="14.3,17.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.295,17.495;19.005,24.205"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="14.3,17.5"/>
      </attribute>
      <attribute name="elem_width">
        <real val="4.7"/>
      </attribute>
      <attribute name="elem_height">
        <real val="6.7"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O17">
      <attribute name="obj_pos">
        <point val="7.175,21.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.17,21.895;14.005,24.205"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="7.175,21.9"/>
      </attribute>
      <attribute name="elem_width">
        <real val="6.825"/>
      </attribute>
      <attribute name="elem_height">
        <real val="2.3"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O18">
      <attribute name="obj_pos">
        <point val="2,24.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,24.695;19.005,27.705"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="2,24.7"/>
      </attribute>
      <attribute name="elem_width">
        <real val="17"/>
      </attribute>
      <attribute name="elem_height">
        <real val="3"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O19">
      <attribute name="obj_pos">
        <point val="15,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.985,4.585;15.015,5.415"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15,4.6"/>
        <point val="15,5.4"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O20">
      <attribute name="obj_pos">
        <point val="15.5714,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.5664,4.595;15.5764,5.405"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.5714,4.6"/>
        <point val="15.5714,5.4"/>
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
        <point val="16.1429,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.1379,4.595;16.1479,5.405"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="16.1429,4.6"/>
        <point val="16.1429,5.4"/>
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
        <point val="16.7143,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.6993,4.585;16.7293,5.415"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="16.7143,4.6"/>
        <point val="16.7143,5.4"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O23">
      <attribute name="obj_pos">
        <point val="17.2857,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.2807,4.595;17.2907,5.405"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.2857,4.6"/>
        <point val="17.2857,5.4"/>
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
        <point val="17.8571,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8521,4.595;17.8621,5.405"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.8571,4.6"/>
        <point val="17.8571,5.4"/>
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
        <point val="18.4286,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.4136,4.585;18.4436,5.415"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="18.4286,4.6"/>
        <point val="18.4286,5.4"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O26">
      <attribute name="obj_pos">
        <point val="19,10.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.295,10.045;19.005,10.055"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="19,10.05"/>
        <point val="14.3,10.05"/>
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
        <point val="15.7,12.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.695,8.095;15.705,12.555"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.7,12.55"/>
        <point val="15.7,8.1"/>
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
        <point val="17.1,12.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.095,10.045;17.105,12.555"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.1,12.55"/>
        <point val="17.1,10.05"/>
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
        <point val="6.1,21.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.095,8.095;6.105,21.705"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.1,21.7"/>
        <point val="6.1,8.1"/>
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
        <point val="3.9,19.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.895,8.945;3.905,19.155"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.9,19.15"/>
        <point val="3.9,8.95"/>
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
        <point val="3.9,8.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.895,8.945;3.905,14.055"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.9,8.95"/>
        <point val="3.9,14.05"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="1" to="O30" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O32">
      <attribute name="obj_pos">
        <point val="2,21.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,8.095;2.005,21.705"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,21.7"/>
        <point val="2,8.1"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O8" connection="5"/>
        <connection handle="1" to="O8" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O33">
      <attribute name="obj_pos">
        <point val="2,8.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,8.095;2.005,14.905"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,8.1"/>
        <point val="2,14.9"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O8" connection="0"/>
        <connection handle="1" to="O32" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O34">
      <attribute name="obj_pos">
        <point val="2,8.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,8.095;2.005,11.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,8.1"/>
        <point val="2,11.5"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O8" connection="0"/>
        <connection handle="1" to="O33" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O35">
      <attribute name="obj_pos">
        <point val="14,8.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.985,8.085;14.015,21.715"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14,8.1"/>
        <point val="14,21.7"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
      <connections>
        <connection handle="0" to="O8" connection="2"/>
        <connection handle="1" to="O8" connection="7"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O36">
      <attribute name="obj_pos">
        <point val="6.1,8.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.095,8.095;14.005,8.105"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.1,8.1"/>
        <point val="14,8.1"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="1" to="O8" connection="2"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O37">
      <attribute name="obj_pos">
        <point val="2,8.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,8.945;14.005,8.955"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,8.95"/>
        <point val="14,8.95"/>
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
        <point val="3.9,9.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.895,9.795;14.005,9.805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.9,9.8"/>
        <point val="14,9.8"/>
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
        <point val="3.9,10.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.895,10.645;14.005,10.655"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.9,10.65"/>
        <point val="14,10.65"/>
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
        <point val="3,11.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.995,11.495;14.005,11.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3,11.5"/>
        <point val="14,11.5"/>
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
        <point val="3.9,12.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.895,12.345;14.005,12.355"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.9,12.35"/>
        <point val="14,12.35"/>
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
        <point val="3.9,13.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.895,13.195;14.005,13.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.9,13.2"/>
        <point val="14,13.2"/>
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
        <point val="2,14.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,14.045;14.005,14.055"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,14.05"/>
        <point val="14,14.05"/>
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
        <point val="6.1,14.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.095,14.895;14.005,14.905"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.1,14.9"/>
        <point val="14,14.9"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O29" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O45">
      <attribute name="obj_pos">
        <point val="3.9,14.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.895,14.895;14.005,14.905"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.9,14.9"/>
        <point val="14,14.9"/>
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
        <point val="3.9,15.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.895,15.745;14.005,15.755"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.9,15.75"/>
        <point val="14,15.75"/>
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
        <point val="3,16.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.995,16.595;14.005,16.605"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3,16.6"/>
        <point val="14,16.6"/>
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
        <point val="3.9,17.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.895,17.445;14.005,17.455"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.9,17.45"/>
        <point val="14,17.45"/>
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
        <point val="3.9,18.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.895,18.295;14.005,18.305"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.9,18.3"/>
        <point val="14,18.3"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O50">
      <attribute name="obj_pos">
        <point val="2,19.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,19.145;14.005,19.155"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,19.15"/>
        <point val="14,19.15"/>
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
        <point val="3,20"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.995,19.995;14.005,20.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3,20"/>
        <point val="14,20"/>
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
        <point val="2,20.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,20.845;14.005,20.855"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,20.85"/>
        <point val="14,20.85"/>
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
        <point val="6.1,21.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.095,21.695;14.005,21.705"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.1,21.7"/>
        <point val="14,21.7"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="1" to="O8" connection="7"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O54">
      <attribute name="obj_pos">
        <point val="3,8.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.995,8.945;3.005,20.855"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3,8.95"/>
        <point val="3,20.85"/>
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
        <point val="6.1,8.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.095,8.545;14.005,8.555"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.1,8.55"/>
        <point val="14,8.55"/>
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
        <point val="2.85,21.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.845,21.695;2.855,24.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.85,21.7"/>
        <point val="2.85,24.2"/>
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
        <point val="4.1,21.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.095,21.695;4.105,24.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4.1,21.7"/>
        <point val="4.1,24.2"/>
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
        <point val="6.925,22.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.845,22.945;6.93,22.955"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.925,22.95"/>
        <point val="2.85,22.95"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O9" connection="4"/>
        <connection handle="1" to="O56" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O59">
      <attribute name="obj_pos">
        <point val="14.3,12.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.295,12.795;19.005,12.805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.3,12.8"/>
        <point val="19,12.8"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O15" connection="0"/>
        <connection handle="1" to="O15" connection="2"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O60">
      <attribute name="obj_pos">
        <point val="14.3,13.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.295,13.695;19.005,13.705"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.3,13.7"/>
        <point val="19,13.7"/>
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
        <point val="14.3,14.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.295,14.595;19.005,14.605"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.3,14.6"/>
        <point val="19,14.6"/>
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
        <point val="14.3,15.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.295,15.495;19.005,15.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.3,15.5"/>
        <point val="19,15.5"/>
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
        <point val="14.3,16.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.295,16.395;19.005,16.405"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.3,16.4"/>
        <point val="19,16.4"/>
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
        <point val="14.3,17.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.295,17.295;19.005,17.305"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.3,17.3"/>
        <point val="19,17.3"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O15" connection="5"/>
        <connection handle="1" to="O15" connection="7"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O65">
      <attribute name="obj_pos">
        <point val="17.1,17.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.095,13.695;17.105,17.305"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.1,17.3"/>
        <point val="17.1,13.7"/>
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
        <point val="14.3,20.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.295,20.845;19.005,20.855"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.3,20.85"/>
        <point val="19,20.85"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O16" connection="3"/>
        <connection handle="1" to="O16" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O67">
      <attribute name="obj_pos">
        <point val="14.9,24.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.895,17.495;14.905,24.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.9,24.2"/>
        <point val="14.9,17.5"/>
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
        <point val="7.7,24.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.695,21.895;7.705,24.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="7.7,24.2"/>
        <point val="7.7,21.9"/>
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
        <point val="8.55,24.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.545,21.895;8.555,24.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="8.55,24.2"/>
        <point val="8.55,21.9"/>
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
        <point val="10.4,24.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.395,21.895;10.405,24.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.4,24.2"/>
        <point val="10.4,21.9"/>
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
        <point val="11.325,24.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.32,21.895;11.33,24.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="11.325,24.2"/>
        <point val="11.325,21.9"/>
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
        <point val="12.225,24.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.22,21.895;12.23,24.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.225,24.2"/>
        <point val="12.225,21.9"/>
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
        <point val="13.125,24.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.12,21.895;13.13,24.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.125,24.2"/>
        <point val="13.125,21.9"/>
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
        <point val="14,24.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.995,21.895;14.005,24.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14,24.2"/>
        <point val="14,21.9"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O17" connection="7"/>
        <connection handle="1" to="O17" connection="2"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O75">
      <attribute name="obj_pos">
        <point val="7.7,22.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.695,22.695;14.005,22.705"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="7.7,22.7"/>
        <point val="14,22.7"/>
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
        <point val="2.7,24.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.695,24.695;2.705,27.705"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.7,24.7"/>
        <point val="2.7,27.7"/>
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
        <point val="8.3,21.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.295,8.545;8.305,21.705"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="8.3,21.7"/>
        <point val="8.3,8.55"/>
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
        <point val="12.0625,21.7049"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.0575,8.54991;12.0675,21.7099"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.0625,21.7049"/>
        <point val="12.0625,8.55491"/>
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
        <point val="5.6625,21.7027"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.6575,21.6977;5.6675,24.2077"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.6625,21.7027"/>
        <point val="5.6625,24.2027"/>
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
        <point val="9.4875,24.2277"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.4825,21.9227;9.4925,24.2327"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="9.4875,24.2277"/>
        <point val="9.4875,21.9277"/>
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
        <point val="11.4875,24.7026"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.4825,24.6976;11.4925,27.7076"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="11.4875,24.7026"/>
        <point val="11.4875,27.7026"/>
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
        <point val="12.0375,24.7276"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.0325,24.7226;12.0425,27.7326"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.0375,24.7276"/>
        <point val="12.0375,27.7276"/>
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
        <point val="12.0375,25.5276"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.0325,25.5201;19.03,25.5326"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.0375,25.5276"/>
        <point val="19.025,25.5251"/>
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
        <point val="14.6625,24.7026"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.6575,24.6976;14.6675,27.7076"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.6625,24.7026"/>
        <point val="14.6625,27.7026"/>
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
        <point val="14.6625,26.2026"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.6575,26.195;19.005,26.2076"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.6625,26.2026"/>
        <point val="19,26.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O84" connection="0"/>
        <connection handle="1" to="O18" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O86">
      <attribute name="obj_pos">
        <point val="15.7062,25.5263"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.695,25.5213;15.7112,27.6801"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.7062,25.5263"/>
        <point val="15.7,27.6751"/>
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
        <point val="16.7625,25.5276"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.7575,25.5226;16.78,27.7101"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="16.7625,25.5276"/>
        <point val="16.775,27.7051"/>
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
        <point val="17.9375,25.5276"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9325,25.5226;17.955,27.7101"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.9375,25.5276"/>
        <point val="17.95,27.7051"/>
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
        <point val="6.925,21.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.91,21.685;6.94,24.215"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.925,21.7"/>
        <point val="6.925,24.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
      <connections>
        <connection handle="0" to="O9" connection="2"/>
        <connection handle="1" to="O9" connection="7"/>
      </connections>
    </object>
  </layer>
  <layer name="&#202;&#184;&#187;&#250;" visible="true">
    <object type="Standard - Box" version="0" id="O90">
      <attribute name="obj_pos">
        <point val="15.8,2.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.78,2.88;18.82,3.92"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="15.8,2.9"/>
      </attribute>
      <attribute name="elem_width">
        <real val="3"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O91">
      <attribute name="obj_pos">
        <point val="9,3.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9,3.19737;15.06,3.79737"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#172;&#191;&#199;&#206;&#197;&#202;&#243;&#189;&#183;&#192;&#193;&#181;&#225;&#193;&#237;&#179;&#231;&#201;&#189;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="9,3.65"/>
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
    <object type="Standard - Text" version="0" id="O92">
      <attribute name="obj_pos">
        <point val="17.3,3.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.1395,3.14737;18.4605,3.74737"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#229;   &#178;&#202;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="17.3,3.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O93">
      <attribute name="obj_pos">
        <point val="2.7,3.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7,3.19737;3.912,3.79737"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#191;&#192;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="2.7,3.65"/>
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
    <object type="Standard - Text" version="0" id="O94">
      <attribute name="obj_pos">
        <point val="5.9,3.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.9,3.19737;6.506,3.79737"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#199;&#175;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="5.9,3.65"/>
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
    <object type="Standard - Text" version="0" id="O95">
      <attribute name="obj_pos">
        <point val="8.2,3.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.2,3.19737;8.806,3.79737"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2,3.65"/>
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
    <object type="Standard - Text" version="0" id="O96">
      <attribute name="obj_pos">
        <point val="2.1,5.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.1,5.52368;4.221,6.42368"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#176;&#229;&#206;&#197;&#181;&#161;&#180;&#216;&#164;&#206;
&#189;&#234;&#186;&#223;&#195;&#207;&#181;&#218;&#164;&#211;&#204;&#190;&#190;&#206;
&#179;&#171;&#192;&#223;&#188;&#212;&#187;&#225;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.1,5.75"/>
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
    <object type="Standard - Text" version="0" id="O97">
      <attribute name="obj_pos">
        <point val="4.2,5.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.2,5.52368;7.88145,5.82368"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#161;&#202;&#162;&#169;               &#161;&#203;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="4.2,5.75"/>
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
    <object type="Standard - Text" version="0" id="O98">
      <attribute name="obj_pos">
        <point val="10.5,5.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5,5.47368;11.712,5.77368"/>
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
            <point val="10.5,5.7"/>
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
    <object type="Standard - Text" version="0" id="O99">
      <attribute name="obj_pos">
        <point val="11.8,5.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.8,4.84825;14.628,5.24825"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#229;&#206;&#197;&#181;&#161;&#180;&#216;&#165;&#179;&#161;&#188;&#165;&#201;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="11.8,5.15"/>
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
    <object type="Standard - Text" version="0" id="O100">
      <attribute name="obj_pos">
        <point val="3.9,8.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.63346,8.34825;5.16654,8.74825"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#182;&#232;       &#202;&#172;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="3.9,8.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O101">
      <attribute name="obj_pos">
        <point val="4,9.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4,9.19825;5.79376,9.59825"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#236;    &#200;&#204;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4,9.5"/>
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
    <object type="Standard - Text" version="0" id="O102">
      <attribute name="obj_pos">
        <point val="4,11.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4,10.8982;4.404,11.2982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#187;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4,11.2"/>
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
    <object type="Standard - Text" version="0" id="O103">
      <attribute name="obj_pos">
        <point val="4,10.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4,10.0482;6.02,10.4482"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#176;&#180;&#252;&#185;&#226;&#206;&#240;&#188;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4,10.35"/>
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
    <object type="Standard - Text" version="0" id="O104">
      <attribute name="obj_pos">
        <point val="4.53333,11.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.53333,10.8982;4.93733,11.2982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#186;&#208;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4.53333,11.2"/>
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
    <object type="Standard - Text" version="0" id="O105">
      <attribute name="obj_pos">
        <point val="5.06667,11.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.06667,10.8982;5.47067,11.2982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#204;&#164;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.06667,11.2"/>
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
    <object type="Standard - Text" version="0" id="O106">
      <attribute name="obj_pos">
        <point val="5.6,11.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.6,10.8982;6.004,11.2982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#203;&#254;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.6,11.2"/>
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
    <object type="Standard - Text" version="0" id="O107">
      <attribute name="obj_pos">
        <point val="4,12.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4,11.7482;5.79376,12.1482"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#236;    &#200;&#204;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4,12.05"/>
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
    <object type="Standard - Text" version="0" id="O108">
      <attribute name="obj_pos">
        <point val="4,13.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4,13.4482;4.404,13.8482"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#187;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4,13.75"/>
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
    <object type="Standard - Text" version="0" id="O109">
      <attribute name="obj_pos">
        <point val="4,12.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4,12.5982;6.02,12.9982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#176;&#180;&#252;&#185;&#226;&#206;&#240;&#188;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4,12.9"/>
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
        <point val="4.53333,13.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.53333,13.4482;4.93733,13.8482"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#186;&#208;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4.53333,13.75"/>
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
    <object type="Standard - Text" version="0" id="O111">
      <attribute name="obj_pos">
        <point val="5.06667,13.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.06667,13.4482;5.47067,13.8482"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#204;&#164;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.06667,13.75"/>
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
    <object type="Standard - Text" version="0" id="O112">
      <attribute name="obj_pos">
        <point val="5.6,13.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.6,13.4482;6.004,13.8482"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#203;&#254;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.6,13.75"/>
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
    <object type="Standard - Text" version="0" id="O113">
      <attribute name="obj_pos">
        <point val="4,14.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4,14.2982;5.79376,14.6982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#236;    &#200;&#204;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4,14.6"/>
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
    <object type="Standard - Text" version="0" id="O114">
      <attribute name="obj_pos">
        <point val="4,16.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4,15.9982;4.404,16.3982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#187;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4,16.3"/>
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
    <object type="Standard - Text" version="0" id="O115">
      <attribute name="obj_pos">
        <point val="4,15.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4,15.1482;6.02,15.5482"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#176;&#180;&#252;&#185;&#226;&#206;&#240;&#188;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4,15.45"/>
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
    <object type="Standard - Text" version="0" id="O116">
      <attribute name="obj_pos">
        <point val="4.53333,16.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.53333,15.9982;4.93733,16.3982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#186;&#208;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4.53333,16.3"/>
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
    <object type="Standard - Text" version="0" id="O117">
      <attribute name="obj_pos">
        <point val="5.06667,16.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.06667,15.9982;5.47067,16.3982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#204;&#164;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.06667,16.3"/>
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
    <object type="Standard - Text" version="0" id="O118">
      <attribute name="obj_pos">
        <point val="5.6,16.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.6,15.9982;6.004,16.3982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#203;&#254;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.6,16.3"/>
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
    <object type="Standard - Text" version="0" id="O119">
      <attribute name="obj_pos">
        <point val="4,17.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4,16.8482;5.79376,17.2482"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#236;    &#200;&#204;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4,17.15"/>
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
    <object type="Standard - Text" version="0" id="O120">
      <attribute name="obj_pos">
        <point val="4,18.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4,18.5482;4.404,18.9482"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#187;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4,18.85"/>
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
    <object type="Standard - Text" version="0" id="O121">
      <attribute name="obj_pos">
        <point val="4,18"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4,17.6982;6.02,18.0982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#176;&#180;&#252;&#185;&#226;&#206;&#240;&#188;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4,18"/>
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
    <object type="Standard - Text" version="0" id="O122">
      <attribute name="obj_pos">
        <point val="4.53333,18.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.53333,18.5482;4.93733,18.9482"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#186;&#208;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4.53333,18.85"/>
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
    <object type="Standard - Text" version="0" id="O123">
      <attribute name="obj_pos">
        <point val="5.06667,18.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.06667,18.5482;5.47067,18.9482"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#204;&#164;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.06667,18.85"/>
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
    <object type="Standard - Text" version="0" id="O124">
      <attribute name="obj_pos">
        <point val="5.6,18.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.6,18.5482;6.004,18.9482"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#203;&#254;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.6,18.85"/>
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
    <object type="Standard - Text" version="0" id="O125">
      <attribute name="obj_pos">
        <point val="3.3,19.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.3,19.3982;3.704,19.7982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="3.3,19.7"/>
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
    <object type="Standard - Text" version="0" id="O126">
      <attribute name="obj_pos">
        <point val="5.4,19.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.4,19.3982;5.804,19.7982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.4,19.7"/>
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
    <object type="Standard - Text" version="0" id="O127">
      <attribute name="obj_pos">
        <point val="3.3,20.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.3,20.2482;3.704,20.6482"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="3.3,20.55"/>
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
    <object type="Standard - Text" version="0" id="O128">
      <attribute name="obj_pos">
        <point val="4.35,20.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.35,20.2482;4.754,20.6482"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4.35,20.55"/>
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
    <object type="Standard - Text" version="0" id="O129">
      <attribute name="obj_pos">
        <point val="5.4,20.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.4,20.2482;5.804,20.6482"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.4,20.55"/>
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
    <object type="Standard - Text" version="0" id="O130">
      <attribute name="obj_pos">
        <point val="3.4,9.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.198,9.19825;3.602,11.1982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;



&#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="3.4,9.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O131">
      <attribute name="obj_pos">
        <point val="3.4,12.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.198,11.7982;3.602,13.7982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;

&#177;&#161;

&#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="3.4,12.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O132">
      <attribute name="obj_pos">
        <point val="3.4,14.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.198,14.2982;3.602,16.2982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;



&#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="3.4,14.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O133">
      <attribute name="obj_pos">
        <point val="3.4,17.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.198,16.8982;3.602,18.8982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;

&#177;&#161;

&#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="3.4,17.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O134">
      <attribute name="obj_pos">
        <point val="2.5,9.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.298,9.29825;2.702,13.6982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#236;

&#200;&#204;

&#200;&#239;

&#202;&#221;

&#184;&#177;

&#188;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.5,9.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O135">
      <attribute name="obj_pos">
        <point val="2.3,15.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.3,14.7482;2.704,18.3482"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#194;&#224;







&#191;&#166;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.3,15.05"/>
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
    <object type="Standard - Text" version="0" id="O136">
      <attribute name="obj_pos">
        <point val="2.5,19.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.298,19.3982;2.702,20.5982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#207;&#183;

&#191;&#205;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.5,19.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O137">
      <attribute name="obj_pos">
        <point val="4.1,21.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.59712,21.0982;5.60288,21.4982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#237; &#185;&#231; &#183;&#215; &#183;&#239; &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4.1,21.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O138">
      <attribute name="obj_pos">
        <point val="2.45,22.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.248,22.1982;2.652,23.7982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;
&#184;&#177;
&#188;&#212;
&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.45,22.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O139">
      <attribute name="obj_pos">
        <point val="3.5,22.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.96975,22.186;4.03025,22.536"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#169;&#198;&#226;&#202;&#172;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.5,22.45"/>
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
    <object type="Standard - Text" version="0" id="O140">
      <attribute name="obj_pos">
        <point val="3.45,23.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.91975,23.436;3.98025,23.786"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#169;&#179;&#176;&#202;&#172;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.45,23.7"/>
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
    <object type="Standard - Text" version="0" id="O141">
      <attribute name="obj_pos">
        <point val="5.325,22.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.325,22.2237;5.628,22.5237"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#203;&#231;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.325,22.45"/>
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
        <point val="5.325,23.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.325,23.4237;5.628,23.7237"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#203;&#231;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.325,23.65"/>
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
        <point val="7.3,22.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.3,22.0237;7.603,24.1237"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#187;&#246;

&#204;&#179;

&#189;&#232;

&#205;&#253;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="7.3,22.25"/>
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
        <point val="8.125,22.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.9735,22.0237;8.2765,22.6237"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#188;&#245;
&#201;&#213;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="8.125,22.25"/>
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
    <object type="Standard - Text" version="0" id="O145">
      <attribute name="obj_pos">
        <point val="9.025,22.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8735,22.0237;9.1765,22.6237"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#228;
&#201;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.025,22.25"/>
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
    <object type="Standard - Text" version="0" id="O146">
      <attribute name="obj_pos">
        <point val="12.65,22.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.4985,22.0237;12.8015,22.6237"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#253;
&#184;&#186;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.65,22.25"/>
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
    <object type="Standard - Text" version="0" id="O147">
      <attribute name="obj_pos">
        <point val="10.875,22.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.7235,22.0237;11.0265,22.6237"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#192;
&#184;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.875,22.25"/>
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
    <object type="Standard - Text" version="0" id="O148">
      <attribute name="obj_pos">
        <point val="11.725,22.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.5735,22.0237;11.8765,22.6237"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#232;
&#196;&#234;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="11.725,22.25"/>
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
    <object type="Standard - Text" version="0" id="O149">
      <attribute name="obj_pos">
        <point val="13.55,22.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.3985,22.0237;13.7015,22.6237"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#179;&#206;
&#199;&#167;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="13.55,22.25"/>
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
    <object type="Standard - Text" version="0" id="O150">
      <attribute name="obj_pos">
        <point val="2.2,25.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.2,25.2237;2.503,27.3237"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#200;&#247;





&#185;&#205;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.2,25.45"/>
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
        <point val="14.6,18.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.4485,18.2237;14.7515,20.3237"/>
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
            <point val="14.6,18.45"/>
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
    <object type="Standard - Text" version="0" id="O152">
      <attribute name="obj_pos">
        <point val="14.6,21.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.4485,21.0237;14.7515,24.0237"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#191;&#179;


&#186;&#186;


&#186;&#209;


&#176;&#245;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.6,21.25"/>
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
    <object type="Standard - Text" version="0" id="O153">
      <attribute name="obj_pos">
        <point val="15,8.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.5455,8.72368;15.4545,9.62368"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#195;&#180;&#197;&#246;&#183;&#184;

&#200;&#214; &#185;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15,8.95"/>
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
    <object type="Standard - Text" version="0" id="O154">
      <attribute name="obj_pos">
        <point val="15,10.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8485,10.2737;15.1515,12.3737"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;

&#184;&#177;

&#188;&#212;

&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15,10.5"/>
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
    <object type="Standard - Text" version="0" id="O155">
      <attribute name="obj_pos">
        <point val="16.4,11.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.9455,11.1737;16.8545,11.4737"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#169;&#198;&#226;&#202;&#172;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="16.4,11.4"/>
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
    <object type="Standard - Text" version="0" id="O156">
      <attribute name="obj_pos">
        <point val="18.6,11.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.6,11.1737;18.903,11.4737"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#203;&#231;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="18.6,11.4"/>
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
        <point val="16.7,13.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.1971,13.0982;18.2029,13.4982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#226; &#179;&#219; &#204;&#192; &#186;&#217; &#189;&#241;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="16.7,13.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O158">
      <attribute name="obj_pos">
        <point val="14.5,14.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.5,13.9982;16.9442,14.3982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#196;&#185; &#185;&#226;    &#179;&#219;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="14.5,14.3"/>
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
    <object type="Standard - Text" version="0" id="O159">
      <attribute name="obj_pos">
        <point val="14.4,14.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.4,14.7237;16.521,15.0237"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#177;&#163;&#176;&#203;&#252;&#197;&#192;&#176;&#202;&#190;&#229;&#161;&#193;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.4,14.95"/>
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
        <point val="15.2,15.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2,15.1237;17.018,15.4237"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#178;&#163;&#176;&#203;&#252;&#197;&#192;&#204;&#164;&#203;&#254;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.2,15.35"/>
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
        <point val="14.4,15.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.4,15.6237;16.521,15.9237"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#178;&#163;&#176;&#203;&#252;&#197;&#192;&#176;&#202;&#190;&#229;&#161;&#193;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.4,15.85"/>
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
        <point val="15.2,16.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2,16.0237;17.018,16.3237"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#180;&#163;&#176;&#203;&#252;&#197;&#192;&#204;&#164;&#203;&#254;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.2,16.25"/>
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
        <point val="14.4,16.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.4,16.7237;16.521,17.0237"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#180;&#163;&#176;&#203;&#252;&#197;&#192;&#176;&#202;&#190;&#229;&#161;&#193;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.4,16.95"/>
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
        <point val="3.4,28"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.9455,27.7737;3.8545,28.0737"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#170;&#180;&#234;&#164;&#164;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.4,28"/>
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
    <object type="Standard - Line" version="0" id="O165">
      <attribute name="obj_pos">
        <point val="2,27.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.99,27.89;2.81,27.91"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,27.9"/>
        <point val="2.8,27.9"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O166">
      <attribute name="obj_pos">
        <point val="4,27.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.99,27.89;4.81,27.91"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4,27.9"/>
        <point val="4.8,27.9"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O167">
      <attribute name="obj_pos">
        <point val="2.2,28.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.2,28.0737;9.472,28.3737"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#239;&#191;&#244;&#205;&#243;&#164;&#203;&#164;&#207;&#184;&#169;&#179;&#176;&#202;&#172;&#164;&#242;&#180;&#222;&#164;&#225;&#164;&#191;&#183;&#239;&#191;&#244;&#164;&#242;&#164;&#180;&#181;&#173;&#198;&#254;&#164;&#183;&#164;&#198;&#178;&#188;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.2,28.3"/>
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
        <point val="2.2,28.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.2,28.4737;5.836,28.7737"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#194;&#192;&#192;&#254;&#198;&#226;&#164;&#206;&#164;&#223;&#164;&#180;&#181;&#173;&#198;&#254;&#178;&#188;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.2,28.7"/>
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
    <object type="Standard - Ellipse" version="0" id="O169">
      <attribute name="obj_pos">
        <point val="2.05,28.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.045,28.145;2.155,28.255"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="2.05,28.15"/>
      </attribute>
      <attribute name="elem_width">
        <real val="0.1"/>
      </attribute>
      <attribute name="elem_height">
        <real val="0.1"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Ellipse" version="0" id="O170">
      <attribute name="obj_pos">
        <point val="2.05,28.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.045,28.545;2.155,28.655"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="2.05,28.55"/>
      </attribute>
      <attribute name="elem_width">
        <real val="0.1"/>
      </attribute>
      <attribute name="elem_height">
        <real val="0.1"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O171">
      <attribute name="obj_pos">
        <point val="19,28.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.93,27.8728;19,28.3728"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#196;&#185;&#186;&#234;&#184;&#169;&#185;&#241;&#204;&#177;&#183;&#242;&#185;&#175;&#202;&#221;&#184;&#177;&#195;&#196;&#194;&#206;&#207;&#162;&#185;&#231;&#178;&#241;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="19,28.25"/>
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
    <object type="Standard - Text" version="0" id="O172">
      <attribute name="obj_pos">
        <point val="7.175,8.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.40992,8.62368;7.94007,8.92368"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#239;     &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="7.175,8.85"/>
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
    <object type="Standard - Text" version="0" id="O173">
      <attribute name="obj_pos">
        <point val="10.175,8.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.04027,8.62368;11.3097,8.92368"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#192;         &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.175,8.85"/>
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
    <object type="Standard - Text" version="0" id="O174">
      <attribute name="obj_pos">
        <point val="9.9,8.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.03352,8.17368;11.7665,8.47368"/>
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
            <point val="9.9,8.4"/>
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
    <object type="Standard - Text" version="0" id="O175">
      <attribute name="obj_pos">
        <point val="18.7,14.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.7,14.6237;19.003,14.9237"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="18.7,14.85"/>
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
    <object type="Standard - Text" version="0" id="O176">
      <attribute name="obj_pos">
        <point val="18.7,15.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.7,15.5237;19.003,15.8237"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="18.7,15.75"/>
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
    <object type="Standard - Text" version="0" id="O177">
      <attribute name="obj_pos">
        <point val="18.7,16.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.7,16.4237;19.003,16.7237"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="18.7,16.65"/>
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
    <object type="Standard - Text" version="0" id="O178">
      <attribute name="obj_pos">
        <point val="14.4,14.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.4,13.8974;15.006,14.4974"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="14.4,14.35"/>
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
    <object type="Standard - Text" version="0" id="O179">
      <attribute name="obj_pos">
        <point val="2,24.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2,24.3237;7.454,24.6237"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#162;&#168;&#202;&#221;&#184;&#177;&#188;&#212;&#191;&#244;&#164;&#207;&#202;&#172;&#186;&#253;&#164;&#206;&#191;&#244;&#164;&#226;&#180;&#222;&#164;&#225;&#164;&#198;&#178;&#188;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2,24.55"/>
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
    <object type="Standard - Text" version="0" id="O180">
      <attribute name="obj_pos">
        <point val="13.04,8.88446"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.5522,8.65814;13.5278,8.95814"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#200;&#247;  &#185;&#205;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="13.04,8.88446"/>
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
    <object type="Standard - Text" version="0" id="O181">
      <attribute name="obj_pos">
        <point val="9.934,22.2322"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.7825,22.0059;10.0855,22.6059"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#187;&#241;
&#179;&#202;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.934,22.2322"/>
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
    <object type="Standard - Text" version="0" id="O182">
      <attribute name="obj_pos">
        <point val="11.759,25.3071"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.5823,25.0431;11.9358,27.4931"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;

&#206;&#207;

&#189;&#232;

&#205;&#253;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="11.759,25.3071"/>
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
    <object type="Standard - Text" version="0" id="O183">
      <attribute name="obj_pos">
        <point val="12.3575,25.2853"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.3575,24.9835;14.3775,25.3835"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#165;&#209;&#165;&#243;&#165;&#193;&#198;&#254;&#206;&#207;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3575,25.2853"/>
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
    <object type="Standard - Text" version="0" id="O184">
      <attribute name="obj_pos">
        <point val="15.3825,25.2853"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.3825,24.9835;18.3883,25.3835"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#207; &#163;&#195; &#163;&#210; &#198;&#254; &#206;&#207;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="15.3825,25.2853"/>
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
    <object type="Standard - Text" version="0" id="O185">
      <attribute name="obj_pos">
        <point val="15.1877,25.9712"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.7332,25.7449;15.6422,26.0449"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#176;&#189;&#232;&#205;&#253;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.1877,25.9712"/>
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
    <object type="Standard - Text" version="0" id="O186">
      <attribute name="obj_pos">
        <point val="16.262,25.9712"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.959,25.7449;16.565,26.0449"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#189;&#164;&#192;&#181;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="16.262,25.9712"/>
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
    <object type="Standard - Text" version="0" id="O187">
      <attribute name="obj_pos">
        <point val="17.387,25.9587"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.8315,25.7927;17.9425,26.0127"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#165;&#218;&#165;&#234;&#165;&#213;&#165;&#161;&#165;&#164;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.22"/>
          </attribute>
          <attribute name="pos">
            <point val="17.387,25.9587"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.135542"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1111"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O188">
      <attribute name="obj_pos">
        <point val="18.837,25.9712"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.837,25.7449;18.837,26.0449"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>##</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="18.837,25.9712"/>
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
    <object type="Standard - Text" version="0" id="O189">
      <attribute name="obj_pos">
        <point val="18.487,25.9712"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.184,25.7449;18.79,26.0449"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#212;&#196;&#214;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="18.487,25.9712"/>
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
  </layer>
  <layer name="&#186;&#185;&#164;&#183;&#185;&#254;&#164;&#223;" visible="true">
    <object type="Embed - Text" version="0" id="O190">
      <attribute name="obj_pos">
        <point val="5.65,3.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.438,3.19737;5.65,3.79737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SRYY#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#185;&#163;&#185;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="5.65,3.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
        <point val="8,3.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.788,3.19737;8,3.79737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SRYM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#185;&#163;&#185;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8,3.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O192">
      <attribute name="obj_pos">
        <point val="4.9,5.7875"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.9,5.44803;7.11796,5.89803"/>
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
            <string>#12345678#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="4.9,5.7875"/>
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
    <object type="Embed - Text" version="0" id="O193">
      <attribute name="obj_pos">
        <point val="4.5,6.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.5,5.88596;18.64,6.58596"/>
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
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;
&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="4.5,6.15"/>
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
    <object type="Embed - Text" version="0" id="O194">
      <attribute name="obj_pos">
        <point val="4.5,6.825"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.5,6.56096;18.64,7.26096"/>
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
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;
&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="4.5,6.825"/>
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
    <object type="Embed - Text" version="0" id="O195">
      <attribute name="obj_pos">
        <point val="4.5,7.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.5,7.23596;18.64,7.58596"/>
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
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="4.5,7.5"/>
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
    <object type="Embed - Text" version="0" id="O196">
      <attribute name="obj_pos">
        <point val="11.8,5.7375"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.8,5.39803;15.9587,5.84803"/>
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
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="11.8,5.7375"/>
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
    <object type="Embed - Text" version="0" id="O197">
      <attribute name="obj_pos">
        <point val="8.175,9.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.3267,9.09737;8.175,9.69737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[0].KENSU#</string>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8.175,9.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O198">
      <attribute name="obj_pos">
        <point val="11.875,9.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.54806,9.09737;11.875,9.69737"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="11.875,9.55"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O199">
      <attribute name="obj_pos">
        <point val="5.275,22.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.16602,22.0474;5.275,22.6474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KENNAI#</string>
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
            <point val="5.275,22.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O200">
      <attribute name="obj_pos">
        <point val="5.275,23.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.16602,23.2474;5.275,23.8474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KENGAI#</string>
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
            <point val="5.275,23.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <group>
      <object type="Embed - Text" version="0" id="O201">
        <attribute name="obj_pos">
          <point val="15.1,5.25"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="15.1,4.75965;15.5005,5.40965"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#HOSPCD[0]#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#8#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.65"/>
            </attribute>
            <attribute name="pos">
              <point val="15.1,5.25"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.400465"/>
            </attribute>
            <attribute name="multi">
              <real val="0.32825"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Embed - Text" version="0" id="O202">
        <attribute name="obj_pos">
          <point val="15.675,5.25"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="15.675,4.75965;16.0755,5.40965"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#HOSPCD[1]#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#8#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.65"/>
            </attribute>
            <attribute name="pos">
              <point val="15.675,5.25"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.400465"/>
            </attribute>
            <attribute name="multi">
              <real val="0.32825"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Embed - Text" version="0" id="O203">
        <attribute name="obj_pos">
          <point val="16.25,5.25"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="16.25,4.75965;16.6505,5.40965"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#HOSPCD[2]#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#8#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.65"/>
            </attribute>
            <attribute name="pos">
              <point val="16.25,5.25"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.400465"/>
            </attribute>
            <attribute name="multi">
              <real val="0.32825"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Embed - Text" version="0" id="O204">
        <attribute name="obj_pos">
          <point val="16.825,5.25"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="16.825,4.75965;17.2255,5.40965"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#HOSPCD[3]#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#8#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.65"/>
            </attribute>
            <attribute name="pos">
              <point val="16.825,5.25"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.400465"/>
            </attribute>
            <attribute name="multi">
              <real val="0.32825"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Embed - Text" version="0" id="O205">
        <attribute name="obj_pos">
          <point val="17.4,5.25"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="17.4,4.75965;17.8005,5.40965"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#HOSPCD[4]#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#8#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.65"/>
            </attribute>
            <attribute name="pos">
              <point val="17.4,5.25"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.400465"/>
            </attribute>
            <attribute name="multi">
              <real val="0.32825"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Embed - Text" version="0" id="O206">
        <attribute name="obj_pos">
          <point val="17.975,5.25"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="17.975,4.75965;18.3755,5.40965"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#HOSPCD[5]#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#8#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.65"/>
            </attribute>
            <attribute name="pos">
              <point val="17.975,5.25"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.400465"/>
            </attribute>
            <attribute name="multi">
              <real val="0.32825"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Embed - Text" version="0" id="O207">
        <attribute name="obj_pos">
          <point val="18.55,5.25"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="18.55,4.75965;18.9505,5.40965"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#HOSPCD[6]#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#8#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.65"/>
            </attribute>
            <attribute name="pos">
              <point val="18.55,5.25"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.400465"/>
            </attribute>
            <attribute name="multi">
              <real val="0.32825"/>
            </attribute>
          </composite>
        </attribute>
      </object>
    </group>
    <object type="Embed - Text" version="0" id="O208">
      <attribute name="obj_pos">
        <point val="8.175,10.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.3267,9.94737;8.175,10.5474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[1].KENSU#</string>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8.175,10.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O209">
      <attribute name="obj_pos">
        <point val="11.875,10.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.54806,9.94737;11.875,10.5474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="11.875,10.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O210">
      <attribute name="obj_pos">
        <point val="8.175,11.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.3267,10.7974;8.175,11.3974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[2].KENSU#</string>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8.175,11.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O211">
      <attribute name="obj_pos">
        <point val="11.875,11.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.54806,10.7974;11.875,11.3974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[2].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="11.875,11.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O212">
      <attribute name="obj_pos">
        <point val="8.175,12.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.3267,11.6474;8.175,12.2474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[3].KENSU#</string>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8.175,12.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O213">
      <attribute name="obj_pos">
        <point val="11.875,12.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.54806,11.6474;11.875,12.2474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[3].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="11.875,12.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O214">
      <attribute name="obj_pos">
        <point val="8.175,12.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.3267,12.4974;8.175,13.0974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[4].KENSU#</string>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8.175,12.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O215">
      <attribute name="obj_pos">
        <point val="11.875,12.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.54806,12.4974;11.875,13.0974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[4].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="11.875,12.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O216">
      <attribute name="obj_pos">
        <point val="8.175,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.3267,13.3474;8.175,13.9474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[5].KENSU#</string>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8.175,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O217">
      <attribute name="obj_pos">
        <point val="11.875,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.54806,13.3474;11.875,13.9474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[5].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="11.875,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O218">
      <attribute name="obj_pos">
        <point val="8.175,14.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.3267,14.1974;8.175,14.7974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[6].KENSU#</string>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8.175,14.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O219">
      <attribute name="obj_pos">
        <point val="11.875,14.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.54806,14.1974;11.875,14.7974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[6].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="11.875,14.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O220">
      <attribute name="obj_pos">
        <point val="8.175,15.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.3267,15.0474;8.175,15.6474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[7].KENSU#</string>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8.175,15.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O221">
      <attribute name="obj_pos">
        <point val="11.875,15.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.54806,15.0474;11.875,15.6474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[7].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="11.875,15.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O222">
      <attribute name="obj_pos">
        <point val="8.175,16.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.3267,15.8974;8.175,16.4974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[8].KENSU#</string>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8.175,16.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O223">
      <attribute name="obj_pos">
        <point val="11.875,16.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.54806,15.8974;11.875,16.4974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[8].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="11.875,16.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O224">
      <attribute name="obj_pos">
        <point val="8.175,17.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.3267,16.7474;8.175,17.3474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[9].KENSU#</string>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8.175,17.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O225">
      <attribute name="obj_pos">
        <point val="11.875,17.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.54806,16.7474;11.875,17.3474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[9].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="11.875,17.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O226">
      <attribute name="obj_pos">
        <point val="8.175,18.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.3267,17.5974;8.175,18.1974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[10].KENSU#</string>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8.175,18.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O227">
      <attribute name="obj_pos">
        <point val="11.875,18.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.54806,17.5974;11.875,18.1974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[10].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="11.875,18.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O228">
      <attribute name="obj_pos">
        <point val="8.175,18.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.3267,18.4474;8.175,19.0474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[11].KENSU#</string>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8.175,18.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O229">
      <attribute name="obj_pos">
        <point val="11.875,18.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.54806,18.4474;11.875,19.0474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[11].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="11.875,18.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O230">
      <attribute name="obj_pos">
        <point val="8.175,19.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.3267,19.2974;8.175,19.8974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[12].KENSU#</string>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8.175,19.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O231">
      <attribute name="obj_pos">
        <point val="11.875,19.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.54806,19.2974;11.875,19.8974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[12].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="11.875,19.75"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O232">
      <attribute name="obj_pos">
        <point val="8.175,20.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.3267,20.1474;8.175,20.7474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[13].KENSU#</string>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8.175,20.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O233">
      <attribute name="obj_pos">
        <point val="11.875,20.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.54806,20.1474;11.875,20.7474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[13].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="11.875,20.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O234">
      <attribute name="obj_pos">
        <point val="8.175,21.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.3267,20.9974;8.175,21.5974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[14].KENSU#</string>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8.175,21.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O235">
      <attribute name="obj_pos">
        <point val="11.875,21.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.54806,20.9974;11.875,21.5974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[14].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="11.875,21.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O236">
      <attribute name="obj_pos">
        <point val="18.6,14.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.491,13.8974;18.6,14.4974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOGAKU[0]#</string>
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
            <point val="18.6,14.35"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O237">
      <attribute name="obj_pos">
        <point val="18.6,15.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.491,14.7974;18.6,15.3974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOGAKU[1]#</string>
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
            <point val="18.6,15.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O238">
      <attribute name="obj_pos">
        <point val="18.6,16.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.491,15.6974;18.6,16.2974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOGAKU[2]#</string>
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
            <point val="18.6,16.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O239">
      <attribute name="obj_pos">
        <point val="18.6,17.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.491,16.5974;18.6,17.1974"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOGAKU[3]#</string>
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
            <point val="18.6,17.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
  </layer>
</diagram>
