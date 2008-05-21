<?xml version="1.0"?>
<diagram xmlns:dia="http://www.lysator.liu.se/~alla/dia/">
  <dictionarydata>
    <element name="SRYYM" occurs="1">
      <appinfo>
        <embed object="string" length="16"/>
      </appinfo>
    </element>
    <element name="HOSPCD" occurs="1">
      <appinfo>
        <embed object="string" length="7"/>
      </appinfo>
    </element>
    <element name="RECE" occurs="2">
      <appinfo>
        <embed object="string" length="2"/>
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
    <element name="TEL" occurs="1">
      <appinfo>
        <embed object="string" length="15"/>
      </appinfo>
    </element>
    <element name="SEIYMD" occurs="1">
      <appinfo>
        <embed object="string" length="22"/>
      </appinfo>
    </element>
    <element name="SEIKYU" occurs="32">
      <element name="KENSU" occurs="1">
        <appinfo>
          <embed object="string" length="5"/>
        </appinfo>
      </element>
    </element>
    <element name="ESEIKYU" occurs="6">
      <element name="EHKNJANAME" occurs="1">
        <appinfo>
          <embed object="string" length="10"/>
        </appinfo>
      </element>
      <element name="EHKNJANUM" occurs="1">
        <appinfo>
          <embed object="string" length="6"/>
        </appinfo>
      </element>
      <element name="EKENSU" occurs="1">
        <appinfo>
          <embed object="string" length="5"/>
        </appinfo>
      </element>
    </element>
    <element name="GKENSU" occurs="1">
      <appinfo>
        <embed object="string" length="6"/>
      </appinfo>
    </element>
    <element name="GKENSUK" occurs="1">
      <appinfo>
        <embed object="string" length="6"/>
      </appinfo>
    </element>
    <element name="TOKURYO" occurs="1">
      <appinfo>
        <embed object="string" length="3"/>
      </appinfo>
    </element>
    <element name="TOKURYOK" occurs="1">
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
  <layer name="&#199;&#216;&#183;&#202;" visible="true">
    <object type="Standard - Box" version="0" id="O0">
      <attribute name="obj_pos">
        <point val="2,8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.98,7.98;19.02,20.031"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="2,8"/>
      </attribute>
      <attribute name="elem_width">
        <real val="17"/>
      </attribute>
      <attribute name="elem_height">
        <real val="12.011"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O1">
      <attribute name="obj_pos">
        <point val="2,2.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.98,2.88;19.02,7.12"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="2,2.9"/>
      </attribute>
      <attribute name="elem_width">
        <real val="17"/>
      </attribute>
      <attribute name="elem_height">
        <real val="4.2"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O2">
      <attribute name="obj_pos">
        <point val="2,4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.98,3.98;19.02,4.02"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,4"/>
        <point val="19,4"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
      <connections>
        <connection handle="1" to="O22" connection="2"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O3">
      <attribute name="obj_pos">
        <point val="5.2,2.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.18,2.88;5.22,7.12"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.2,2.9"/>
        <point val="5.2,7.1"/>
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
        <point val="15.1,2.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.08,2.88;15.12,7.12"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.1,2.9"/>
        <point val="15.1,7.1"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
      <connections>
        <connection handle="1" to="O22" connection="5"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O5">
      <attribute name="obj_pos">
        <point val="2.23521,24.3564"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.21521,24.3364;18.8394,24.3764"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.23521,24.3564"/>
        <point val="18.8194,24.3564"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="line_style">
        <enum val="1"/>
      </attribute>
      <attribute name="dashlength">
        <real val="0.3"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O6">
      <attribute name="obj_pos">
        <point val="2,25.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.98,25.08;19.02,28.92"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="2,25.1"/>
      </attribute>
      <attribute name="elem_width">
        <real val="17"/>
      </attribute>
      <attribute name="elem_height">
        <real val="3.8"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O7">
      <attribute name="obj_pos">
        <point val="2,25.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.99,25.59;19.01,25.61"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,25.6"/>
        <point val="19,25.6"/>
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
        <point val="2,27"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.99,26.99;19.01,27.01"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,27"/>
        <point val="19,27"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <connections>
        <connection handle="0" to="O6" connection="3"/>
        <connection handle="1" to="O6" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O9">
      <attribute name="obj_pos">
        <point val="3,25.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.99,25.09;3.01,27.01"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3,25.1"/>
        <point val="3,27"/>
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
        <point val="4.8,25.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.79,25.09;4.81,27.01"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4.8,25.1"/>
        <point val="4.8,27"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O11">
      <attribute name="obj_pos">
        <point val="6.6,25.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.59,25.09;6.61,28.91"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.6,25.1"/>
        <point val="6.6,28.9"/>
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
        <point val="8.3,25.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.29,25.09;8.31,28.91"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="8.3,25.1"/>
        <point val="8.3,28.9"/>
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
        <point val="10.1,25.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.09,25.09;10.11,28.91"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.1,25.1"/>
        <point val="10.1,28.9"/>
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
        <point val="11.9,25.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.8888,25.09;11.91,28.91"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="11.9,25.1"/>
        <point val="11.8988,28.9"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <connections>
        <connection handle="1" to="O19" connection="5"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O15">
      <attribute name="obj_pos">
        <point val="13.6,25.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.59,25.09;13.61,27.01"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.6,25.1"/>
        <point val="13.6,27"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O16">
      <attribute name="obj_pos">
        <point val="15.4,25.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.39,25.09;15.41,27.01"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.4,25.1"/>
        <point val="15.4,27"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <connections>
        <connection handle="1" to="O18" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O17">
      <attribute name="obj_pos">
        <point val="17.1,25.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.09,25.09;17.11,27.01"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.1,25.1"/>
        <point val="17.1,27"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O18">
      <attribute name="obj_pos">
        <point val="15.4,27"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.38,26.98;19.02,28.92"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="15.4,27"/>
      </attribute>
      <attribute name="elem_width">
        <real val="3.6"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1.9"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O19">
      <attribute name="obj_pos">
        <point val="11.8988,27"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.8788,26.98;15.42,28.92"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="11.8988,27"/>
      </attribute>
      <attribute name="elem_width">
        <real val="3.5012"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1.9"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O20">
      <attribute name="obj_pos">
        <point val="6.6,27.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.59,27.59;11.91,27.61"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.6,27.6"/>
        <point val="11.9,27.6"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O21">
      <attribute name="obj_pos">
        <point val="6.6,28.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.59,28.29;11.91,28.31"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.6,28.3"/>
        <point val="11.9,28.3"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O22">
      <attribute name="obj_pos">
        <point val="15.1,4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.08,3.98;19.02,7.12"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="15.1,4"/>
      </attribute>
      <attribute name="elem_width">
        <real val="3.9"/>
      </attribute>
      <attribute name="elem_height">
        <real val="3.1"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O23">
      <attribute name="obj_pos">
        <point val="2,8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,7.995;19.005,8.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,8"/>
        <point val="19,8"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O0" connection="0"/>
        <connection handle="1" to="O0" connection="2"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O24">
      <attribute name="obj_pos">
        <point val="2,8.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,8.595;19.005,8.605"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,8.6"/>
        <point val="19,8.6"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O25">
      <attribute name="obj_pos">
        <point val="2,9.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,9.195;19.005,9.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,9.2"/>
        <point val="19,9.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O26">
      <attribute name="obj_pos">
        <point val="5.2,9.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.195,9.795;19.005,9.805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.2,9.8"/>
        <point val="19,9.8"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O27">
      <attribute name="obj_pos">
        <point val="2,10.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,10.395;19.005,10.405"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,10.4"/>
        <point val="19,10.4"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O28">
      <attribute name="obj_pos">
        <point val="2,11"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,10.995;19.005,11.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,11"/>
        <point val="19,11"/>
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
        <point val="2,11.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,11.595;19.005,11.605"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,11.6"/>
        <point val="19,11.6"/>
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
        <point val="2,12.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,12.195;19.005,12.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,12.2"/>
        <point val="19,12.2"/>
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
        <point val="2,12.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,12.795;19.005,12.805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,12.8"/>
        <point val="19,12.8"/>
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
        <point val="2,13.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,13.395;19.005,13.405"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,13.4"/>
        <point val="19,13.4"/>
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
        <point val="2,14"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,13.995;19.005,14.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,14"/>
        <point val="19,14"/>
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
        <point val="2,14.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,14.595;19.005,14.605"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,14.6"/>
        <point val="19,14.6"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O35">
      <attribute name="obj_pos">
        <point val="2,15.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,15.195;19.005,15.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,15.2"/>
        <point val="19,15.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O36">
      <attribute name="obj_pos">
        <point val="2,16.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,16.395;19.005,16.405"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,16.4"/>
        <point val="19,16.4"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O37">
      <attribute name="obj_pos">
        <point val="2,17"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,16.995;19.005,17.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,17"/>
        <point val="19,17"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O38">
      <attribute name="obj_pos">
        <point val="2,17.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,17.595;19.005,17.605"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,17.6"/>
        <point val="19,17.6"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O39">
      <attribute name="obj_pos">
        <point val="2,15.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,15.795;19.005,15.805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,15.8"/>
        <point val="19,15.8"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O40">
      <attribute name="obj_pos">
        <point val="2,18.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,18.195;19.005,18.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,18.2"/>
        <point val="19,18.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O41">
      <attribute name="obj_pos">
        <point val="2,18.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,18.795;13.755,18.8166"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,18.8"/>
        <point val="13.75,18.8116"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O42">
      <attribute name="obj_pos">
        <point val="2,19.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,19.395;19.005,19.405"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,19.4"/>
        <point val="19,19.4"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O43">
      <attribute name="obj_pos">
        <point val="2,20"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,19.995;19.005,20.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,20"/>
        <point val="19,20"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O44">
      <attribute name="obj_pos">
        <point val="13.75,8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.75,8;13.8,20.011"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="13.75,8"/>
      </attribute>
      <attribute name="elem_width">
        <real val="0.05"/>
      </attribute>
      <attribute name="elem_height">
        <real val="12.011"/>
      </attribute>
      <attribute name="border_width">
        <real val="1.49012e-08"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="true"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O45">
      <attribute name="obj_pos">
        <point val="5.2,8.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.195,8.595;5.205,20.041"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.2,8.6"/>
        <point val="5.2,20.036"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O46">
      <attribute name="obj_pos">
        <point val="10.4,8.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.395,8.595;10.405,20.041"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.4,8.6"/>
        <point val="10.4,20.036"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O47">
      <attribute name="obj_pos">
        <point val="15.7,8.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.695,8.595;15.705,18.2416"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.7,8.6"/>
        <point val="15.7,18.2366"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O48">
      <attribute name="obj_pos">
        <point val="6.9,8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.895,7.995;6.905,20.016"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.9,8"/>
        <point val="6.9,20.011"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O49">
      <attribute name="obj_pos">
        <point val="12.05,8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.045,7.995;12.055,20.016"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.05,8"/>
        <point val="12.05,20.011"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O50">
      <attribute name="obj_pos">
        <point val="17.35,8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.345,7.995;17.355,20.0167"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.35,8"/>
        <point val="17.35,20.0117"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O51">
      <attribute name="obj_pos">
        <point val="8.55,8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.55,8;8.6,20.011"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="8.55,8"/>
      </attribute>
      <attribute name="elem_width">
        <real val="0.05"/>
      </attribute>
      <attribute name="elem_height">
        <real val="12.011"/>
      </attribute>
      <attribute name="border_width">
        <real val="1.49012e-08"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="true"/>
      </attribute>
    </object>
  </layer>
  <layer name="&#202;&#184;&#187;&#250;" visible="true">
    <object type="Standard - Text" version="0" id="O52">
      <attribute name="obj_pos">
        <point val="7.5,2.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.5,1.97222;8.106,2.57222"/>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="7.5,2.45"/>
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
    <object type="Standard - Text" version="0" id="O53">
      <attribute name="obj_pos">
        <point val="8.6,2.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.6,1.97222;19.3868,2.57222"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#191;&#199;&#206;&#197;&#202;&#243;&#189;&#183;&#193;&#237;&#179;&#231;&#201;&#188;  ( &#184;&#169;&#198;&#226; &#161;&#166; &#176;&#229;&#178;&#202;&#205;&#209; )#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="8.6,2.45"/>
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
    <object type="Standard - Text" version="0" id="O54">
      <attribute name="obj_pos">
        <point val="2.70214,20.6163"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.70214,20.3774;4.82314,20.6774"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#162;&#168;&#181;&#173;&#198;&#254;&#190;&#229;&#164;&#206;&#195;&#237;&#176;&#213;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.70214,20.6163"/>
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
    <object type="Standard - Text" version="0" id="O55">
      <attribute name="obj_pos">
        <point val="2.31464,21.0281"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.31464,20.8211;17.3354,21.0811"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#177;) &#183;&#239;&#191;&#244;&#205;&#243;&#164;&#207;&#183;&#238;&#195;&#217;&#164;&#236;&#192;&#193;&#181;&#225;&#202;&#172;&#164;&#226;&#180;&#222;&#164;&#225;&#164;&#198;&#202;&#221;&#184;&#177;&#188;&#212;&#203;&#232;&#164;&#203;&#185;&#241;&#202;&#221;&#176;&#236;&#200;&#204;&#202;&#172;&#161;&#220;&#194;&#224;&#191;&#166;&#188;&#212;&#202;&#172;&#161;&#220;&#207;&#183;&#191;&#205;&#202;&#221;&#183;&#242;&#202;&#172;&#164;&#206;&#187;&#230;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#164;&#206;&#185;&#231;&#183;&#215;&#183;&#239;&#191;&#244;&#164;&#242;&#181;&#173;&#198;&#254;&#164;&#183;&#164;&#198;&#178;&#188;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="2.31464,21.0281"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.15756"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1313"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O56">
      <attribute name="obj_pos">
        <point val="2.35,21.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.35,21.593;15.2699,21.853"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#178;) &#184;&#169;&#198;&#226;&#187;&#230;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#185;&#231;&#183;&#215;&#183;&#239;&#191;&#244;&#205;&#243;&#164;&#207;&#161;&#162;&#202;&#221;&#184;&#177;&#188;&#212;&#203;&#232;&#164;&#206;&#183;&#239;&#191;&#244;&#164;&#242;&#189;&#184;&#183;&#215;&#164;&#183;&#161;&#162;&#184;&#169;&#198;&#226;&#164;&#206;&#187;&#230;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#164;&#206;&#193;&#237;&#183;&#239;&#191;&#244;&#164;&#242;&#181;&#173;&#198;&#254;&#164;&#183;&#164;&#198;&#178;&#188;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="2.35,21.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.15756"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1313"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O57">
      <attribute name="obj_pos">
        <point val="2.44738,3.34715"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.44738,3.02863;4.87138,3.42863"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#176;&#229;&#206;&#197;&#181;&#161;&#180;&#216;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.44738,3.34715"/>
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
    <object type="Standard - Text" version="0" id="O58">
      <attribute name="obj_pos">
        <point val="2.6949,3.8422"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.6949,3.52368;4.8765,3.92368"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#165;&#179;  &#161;&#188;  &#165;&#201;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.6949,3.8422"/>
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
    <object type="Standard - Text" version="0" id="O59">
      <attribute name="obj_pos">
        <point val="2.64186,4.6555"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.64186,4.33698;3.04586,4.73698"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#189;&#234;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.64186,4.6555"/>
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
    <object type="Standard - Text" version="0" id="O60">
      <attribute name="obj_pos">
        <point val="3.52588,4.6555"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.52588,4.33698;3.92988,4.73698"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="3.52588,4.6555"/>
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
    <object type="Standard - Text" version="0" id="O61">
      <attribute name="obj_pos">
        <point val="4.4099,4.6555"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.4099,4.33698;4.8139,4.73698"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#195;&#207;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4.4099,4.6555"/>
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
    <object type="Standard - Text" version="0" id="O62">
      <attribute name="obj_pos">
        <point val="2.64186,5.15055"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.64186,4.83203;3.04586,5.23203"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.64186,5.15055"/>
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
    <object type="Standard - Text" version="0" id="O63">
      <attribute name="obj_pos">
        <point val="4.4099,5.15055"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.4099,4.83203;4.8139,5.23203"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#190;&#206;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4.4099,5.15055"/>
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
        <point val="2.64186,5.6456"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.64186,5.32708;3.04586,5.72708"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#179;&#171;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.64186,5.6456"/>
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
        <point val="3.52588,5.6456"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.52588,5.32708;3.92988,5.72708"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#192;&#223;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="3.52588,5.6456"/>
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
    <object type="Standard - Text" version="0" id="O66">
      <attribute name="obj_pos">
        <point val="4.4099,5.6456"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.4099,5.32708;4.8139,5.72708"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#188;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4.4099,5.6456"/>
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
    <object type="Standard - Text" version="0" id="O67">
      <attribute name="obj_pos">
        <point val="2.64186,6.28209"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.64186,5.96357;3.04586,6.36357"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#187;&#225;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.64186,6.28209"/>
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
    <object type="Standard - Text" version="0" id="O68">
      <attribute name="obj_pos">
        <point val="4.4099,6.28209"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.4099,5.96357;4.8139,6.36357"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4.4099,6.28209"/>
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
    <object type="Standard - Text" version="0" id="O69">
      <attribute name="obj_pos">
        <point val="2.64186,6.9009"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.64186,6.58238;3.04586,6.98238"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#197;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.64186,6.9009"/>
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
    <object type="Standard - Text" version="0" id="O70">
      <attribute name="obj_pos">
        <point val="3.22531,6.9009"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.22531,6.58238;3.62931,6.98238"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#207;&#195;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="3.22531,6.9009"/>
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
    <object type="Standard - Text" version="0" id="O71">
      <attribute name="obj_pos">
        <point val="3.82645,6.9009"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.82645,6.58238;4.23045,6.98238"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#200;&#214;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="3.82645,6.9009"/>
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
    <object type="Standard - Text" version="0" id="O72">
      <attribute name="obj_pos">
        <point val="4.4099,6.9009"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.4099,6.58238;4.8139,6.98238"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4.4099,6.9009"/>
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
    <object type="Standard - Text" version="0" id="O73">
      <attribute name="obj_pos">
        <point val="16.154,3.20875"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.154,2.96986;17.972,3.26986"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#181;&#173;&#186;&#220;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="16.154,3.20875"/>
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
    <object type="Standard - Text" version="0" id="O74">
      <attribute name="obj_pos">
        <point val="15.2263,3.53375"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2263,3.29486;16.8019,3.59486"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#177;. &#188;&#234;&#189;&#241;&#164;&#173;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.2263,3.53375"/>
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
    <object type="Standard - Text" version="0" id="O75">
      <attribute name="obj_pos">
        <point val="17.3763,3.5288"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.3763,3.28991;17.9823,3.58991"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#178;&#161;&#165;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.3763,3.5288"/>
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
    <object type="Standard - Text" version="0" id="O76">
      <attribute name="obj_pos">
        <point val="17.9586,3.5288"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.9586,3.28991;18.2616,3.58991"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#197;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.9586,3.5288"/>
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
    <object type="Standard - Text" version="0" id="O77">
      <attribute name="obj_pos">
        <point val="18.5097,3.5288"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.5097,3.28991;18.8127,3.58991"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#187;&#187;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="18.5097,3.5288"/>
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
    <object type="Standard - Text" version="0" id="O78">
      <attribute name="obj_pos">
        <point val="2.2,25.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.2,25.2111;2.806,25.5111"/>
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
            <real val="0.1818"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O79">
      <attribute name="obj_pos">
        <point val="2.35,25.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.35,25.7111;2.653,26.9111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#195;&#180;
&#197;&#246;
&#188;&#212;
&#176;&#245;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.35,25.95"/>
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
    <object type="Standard - Text" version="0" id="O80">
      <attribute name="obj_pos">
        <point val="3.2,25.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.2,25.2111;4.715,25.5111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;&#179;&#206;&#199;&#167;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.2,25.45"/>
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
    <object type="Standard - Text" version="0" id="O81">
      <attribute name="obj_pos">
        <point val="4.95,25.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.95,25.2509;6.465,25.5009"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#187;&#246;&#204;&#179;&#197;&#192;&#184;&#161;&#176;&#236;&#188;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="4.95,25.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.1515"/>
          </attribute>
          <attribute name="multi">
            <real val="0.12625"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O82">
      <attribute name="obj_pos">
        <point val="6.7,25.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.7,25.2509;8.215,25.5009"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#187;&#246;&#204;&#179;&#197;&#192;&#184;&#161;&#198;&#243;&#188;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="6.7,25.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.1515"/>
          </attribute>
          <attribute name="multi">
            <real val="0.12625"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O83">
      <attribute name="obj_pos">
        <point val="8.5,25.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.5,25.2111;10.015,25.5111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#191;&#179;&#186;&#186;&#176;&#209;&#176;&#247;&#178;&#241;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="8.5,25.45"/>
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
    <object type="Standard - Text" version="0" id="O84">
      <attribute name="obj_pos">
        <point val="10.4,25.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.4,25.2111;11.612,25.5111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#215;&#191;&#244;&#192;&#176;&#205;&#253;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.4,25.45"/>
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
    <object type="Standard - Text" version="0" id="O85">
      <attribute name="obj_pos">
        <point val="12.2,25.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.2,25.2111;13.412,25.5111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#232;&#196;&#234;&#198;&#254;&#206;&#207;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.2,25.45"/>
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
    <object type="Standard - Text" version="0" id="O86">
      <attribute name="obj_pos">
        <point val="13.95,25.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.95,25.2111;15.162,25.5111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#253;&#184;&#186;&#198;&#254;&#206;&#207;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="13.95,25.45"/>
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
    <object type="Standard - Text" version="0" id="O87">
      <attribute name="obj_pos">
        <point val="15.7,25.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7,25.2111;16.912,25.5111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#253;&#184;&#186;&#179;&#206;&#199;&#167;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.7,25.45"/>
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
    <object type="Standard - Text" version="0" id="O88">
      <attribute name="obj_pos">
        <point val="17.35,25.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.35,25.2111;18.865,25.5111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#165;&#168;&#165;&#233;&#161;&#188;&#196;&#251;&#192;&#181;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.35,25.45"/>
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
    <object type="Standard - Text" version="0" id="O89">
      <attribute name="obj_pos">
        <point val="6.85,27.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.85,27.2111;8.062,27.5111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#187;&#246;&#182;&#200;&#182;&#232;&#202;&#172;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.85,27.45"/>
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
    <object type="Standard - Text" version="0" id="O90">
      <attribute name="obj_pos">
        <point val="8.6,27.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.6,27.2111;9.812,27.5111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#189;&#232;&#205;&#253;&#182;&#232;&#202;&#172;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="8.6,27.45"/>
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
    <object type="Standard - Text" version="0" id="O91">
      <attribute name="obj_pos">
        <point val="10.25,27.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.25,27.2111;11.765,27.5111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#192;&#191;&#244;&#201;&#189;&#182;&#232;&#202;&#172;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.25,27.45"/>
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
    <object type="Standard - Text" version="0" id="O92">
      <attribute name="obj_pos">
        <point val="7.15,28.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.15,27.8019;7.655,28.3019"/>
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
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="7.15,28.2"/>
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
    <object type="Standard - Text" version="0" id="O93">
      <attribute name="obj_pos">
        <point val="9,28.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9,27.8019;9.505,28.3019"/>
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
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="9,28.2"/>
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
    <object type="Standard - Text" version="0" id="O94">
      <attribute name="obj_pos">
        <point val="10.85,28.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.85,27.8019;11.355,28.3019"/>
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
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="10.85,28.2"/>
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
    <object type="Standard - Text" version="0" id="O95">
      <attribute name="obj_pos">
        <point val="7,28.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7,28.3917;7.909,28.8417"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#241;&#202;&#221;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="7,28.75"/>
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
    <object type="Standard - Text" version="0" id="O96">
      <attribute name="obj_pos">
        <point val="8.75,28.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.75,28.3917;9.659,28.8417"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#169;&#198;&#226;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="8.75,28.75"/>
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
    <object type="Standard - Text" version="0" id="O97">
      <attribute name="obj_pos">
        <point val="10.65,28.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.65,28.3917;11.559,28.8417"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#229;&#178;&#202;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="10.65,28.75"/>
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
    <object type="Standard - Text" version="0" id="O98">
      <attribute name="obj_pos">
        <point val="15.5331,27.3229"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.5331,27.084;16.4421,27.384"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#191;&#199;&#206;&#197;&#178;&#202;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.5331,27.3229"/>
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
    <object type="Standard - Text" version="0" id="O99">
      <attribute name="obj_pos">
        <point val="6.65,7.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.65,7.36111;14.831,7.66111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#178;&#188;&#181;&#173;&#164;&#206;&#202;&#221;&#184;&#177;&#188;&#212;&#164;&#203;&#164;&#196;&#164;&#164;&#164;&#198;&#202;&#204;&#197;&#186;&#191;&#199;&#206;&#197;&#202;&#243;&#189;&#183;&#192;&#193;&#181;&#225;&#189;&#241;&#164;&#206;&#196;&#204;&#164;&#234;&#192;&#193;&#181;&#225;&#164;&#185;&#164;&#235;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.65,7.6"/>
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
    <object type="Standard - Text" version="0" id="O100">
      <attribute name="obj_pos">
        <point val="16.1401,4.40721"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.1401,4.12054;18.1035,4.48054"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#188;&#245;  &#201;&#213;  &#176;&#245;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="16.1401,4.40721"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O101">
      <attribute name="obj_pos">
        <point val="3.9,8.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.9,8.13148;5.112,8.53148"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="3.9,8.45"/>
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
    <object type="Standard - Text" version="0" id="O102">
      <attribute name="obj_pos">
        <point val="7.35,8.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.35,8.13148;8.158,8.53148"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#239;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="7.35,8.45"/>
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
    <object type="Standard - Text" version="0" id="O103">
      <attribute name="obj_pos">
        <point val="9.85,8.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.85,8.13148;11.062,8.53148"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="9.85,8.45"/>
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
    <object type="Standard - Text" version="0" id="O104">
      <attribute name="obj_pos">
        <point val="12.475,8.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.475,8.13148;13.283,8.53148"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#239;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="12.475,8.45"/>
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
    <object type="Standard - Text" version="0" id="O105">
      <attribute name="obj_pos">
        <point val="15.1,8.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.1,8.13148;16.312,8.53148"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="15.1,8.45"/>
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
    <object type="Standard - Text" version="0" id="O106">
      <attribute name="obj_pos">
        <point val="17.8,8.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.8,8.13148;18.608,8.53148"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#239;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="17.8,8.45"/>
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
    <object type="Standard - Text" version="0" id="O107">
      <attribute name="obj_pos">
        <point val="3.6,9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.4688,8.74519;4.7312,9.06519"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#229;&#161;&#161;&#187;&#213;&#161;&#161;&#185;&#241;&#161;&#161;&#202;&#221;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.19392"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O108">
      <attribute name="obj_pos">
        <point val="3.6,9.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.3072,9.34519;4.8928,9.66519"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#180;&#185;&#241;&#187;&#245;&#178;&#202;&#176;&#229;&#187;&#213;&#185;&#241;&#202;&#221;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,9.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.19392"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O109">
      <attribute name="obj_pos">
        <point val="3.6,10.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.69504,9.89519;4.50496,10.2152"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#161;&#202;093013&#161;&#203;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.32"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,10.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.19392"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1616"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O110">
      <attribute name="obj_pos">
        <point val="3.6,10.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.388,10.5611;4.812,10.8611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#180;&#185;&#241;&#197;&#218;&#204;&#218;&#183;&#250;&#195;&#219;&#185;&#241;&#202;&#221;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,10.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O111">
      <attribute name="obj_pos">
        <point val="3.6,11.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.691,11.1611;4.509,11.4611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#195;&#230;&#177;&#251;&#183;&#250;&#192;&#223;&#185;&#241;&#202;&#221;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,11.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O112">
      <attribute name="obj_pos">
        <point val="3.6,12"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.2365,11.7611;4.9635,12.0611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#180;&#185;&#241;&#183;&#250;&#192;&#223;&#185;&#169;&#187;&#246;&#182;&#200;&#185;&#241;&#202;&#221;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,12"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O113">
      <attribute name="obj_pos">
        <point val="3.6,12.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,12.3611;4.4181,12.6611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#194;&#231;  &#196;&#197;  &#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,12.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O114">
      <attribute name="obj_pos">
        <point val="3.6,13.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,12.9611;4.4181,13.2611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#201;&#167;  &#186;&#172;  &#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,13.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O115">
      <attribute name="obj_pos">
        <point val="3.6,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,13.5611;4.4181,13.8611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#196;&#185;  &#201;&#205;  &#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O116">
      <attribute name="obj_pos">
        <point val="3.6,14.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.4789,14.1611;4.7211,14.4611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#182;&#225; &#185;&#190; &#200;&#172; &#200;&#168; &#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,14.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O117">
      <attribute name="obj_pos">
        <point val="3.6,15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7213,14.7611;4.4787,15.0611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#236; &#182;&#225; &#185;&#190; &#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O118">
      <attribute name="obj_pos">
        <point val="3.6,15.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,15.3611;4.4181,15.6611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#240;  &#196;&#197;  &#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,15.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O119">
      <attribute name="obj_pos">
        <point val="3.6,16.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,15.9611;4.4181,16.2611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#188;&#233;  &#187;&#179;  &#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,16.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O120">
      <attribute name="obj_pos">
        <point val="3.6,16.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,16.5611;4.4181,16.8611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#204;&#238;  &#189;&#167;  &#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,16.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O121">
      <attribute name="obj_pos">
        <point val="3.6,17.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,17.1611;4.4181,17.4611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#208;  &#198;&#238;  &#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,17.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O122">
      <attribute name="obj_pos">
        <point val="3.6,18"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,17.7611;4.4181,18.0611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#195;  &#178;&#236;  &#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,18"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O123">
      <attribute name="obj_pos">
        <point val="3.6,19.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,19.5611;4.4181,19.8611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#170;  &#197;&#236;  &#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,19.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O124">
      <attribute name="obj_pos">
        <point val="9.5,9.025"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8637,8.78611;10.1363,9.08611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#194; &#197;&#218; &#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.5,9.025"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O125">
      <attribute name="obj_pos">
        <point val="9.5,9.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8637,9.41111;10.1363,9.71111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#252; &#204;&#238; &#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.5,9.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O126">
      <attribute name="obj_pos">
        <point val="9.5,10.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8637,10.0111;10.1363,10.3111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#206;&#181; &#178;&#166; &#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.5,10.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O127">
      <attribute name="obj_pos">
        <point val="9.5,10.825"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8637,10.5861;10.1363,10.8861"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#166; &#193;&#241; &#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.5,10.825"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O128">
      <attribute name="obj_pos">
        <point val="9.5,11.425"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8637,11.1861;10.1363,11.4861"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#203;&#173; &#182;&#191; &#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.5,11.425"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O129">
      <attribute name="obj_pos">
        <point val="9.5,12.025"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8637,11.7861;10.1363,12.0861"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#195; &#206;&#201; &#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.5,12.025"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O130">
      <attribute name="obj_pos">
        <point val="9.5,12.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8637,12.3611;10.1363,12.6611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#194;&#191; &#178;&#236; &#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.5,12.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O131">
      <attribute name="obj_pos">
        <point val="9.5,13.225"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8637,12.9861;10.1363,13.2861"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#215; &#201;&#177; &#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.5,13.225"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O132">
      <attribute name="obj_pos">
        <point val="9.5,13.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8637,13.6111;10.1363,13.9111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#208; &#203;&#204; &#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.5,13.85"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O133">
      <attribute name="obj_pos">
        <point val="9.5,14.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8637,14.2111;10.1363,14.5111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#226; &#183;&#238; &#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.5,14.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O134">
      <attribute name="obj_pos">
        <point val="9.475,15.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.8387,15.4111;10.1113,15.7111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#205;&#190; &#184;&#226; &#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.475,15.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O135">
      <attribute name="obj_pos">
        <point val="8.875,15.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.7235,14.8111;9.0265,15.1111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#204;&#218;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="8.875,15.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O136">
      <attribute name="obj_pos">
        <point val="9.275,15.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.1235,14.8111;9.4265,15.1111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#199;&#183;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.275,15.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O137">
      <attribute name="obj_pos">
        <point val="9.675,15.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.5235,14.8111;9.8265,15.1111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#203;&#220;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.675,15.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O138">
      <attribute name="obj_pos">
        <point val="10.075,15.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.9235,14.8111;10.2265,15.1111"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.075,15.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O139">
      <attribute name="obj_pos">
        <point val="8.875,16.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.7235,16.0111;9.0265,16.3111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#192;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="8.875,16.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O140">
      <attribute name="obj_pos">
        <point val="9.275,16.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.1235,16.0111;9.4265,16.3111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#192;&#245;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.275,16.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O141">
      <attribute name="obj_pos">
        <point val="9.675,16.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.5235,16.0111;9.8265,16.3111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.675,16.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O142">
      <attribute name="obj_pos">
        <point val="10.075,16.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.9235,16.0111;10.2265,16.3111"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.075,16.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O143">
      <attribute name="obj_pos">
        <point val="15.55,18.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.035,18.6611;17.065,18.9611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#169;&#198;&#226;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#185;&#231;&#183;&#215;&#183;&#239;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.55,18.9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O144">
      <attribute name="obj_pos">
        <point val="6.05,9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,8.71333;6.70448,9.07333"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#253013#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O145">
      <attribute name="obj_pos">
        <point val="6.05,9.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.444,9.36111;6.656,9.66111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#203;&#220;&#191;&#205;&#163;&#184;&#179;&#228;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,9.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O146">
      <attribute name="obj_pos">
        <point val="6.05,10.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.444,9.96111;6.656,10.2611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#178;&#200;&#194;&#178;&#163;&#183;&#179;&#228;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,10.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O147">
      <attribute name="obj_pos">
        <point val="6.05,10.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,10.5133;6.70448,10.8733"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#133033#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,10.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O148">
      <attribute name="obj_pos">
        <point val="6.05,11.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,11.1133;6.70448,11.4733"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#133264#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,11.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O149">
      <attribute name="obj_pos">
        <point val="6.05,12"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,11.7133;6.70448,12.0733"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#133298#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,12"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O150">
      <attribute name="obj_pos">
        <point val="6.05,12.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,12.3133;6.70448,12.6733"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250019#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,12.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O151">
      <attribute name="obj_pos">
        <point val="6.05,13.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,12.9133;6.70448,13.2733"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250027#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,13.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O152">
      <attribute name="obj_pos">
        <point val="6.05,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,13.5133;6.70448,13.8733"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250035#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O153">
      <attribute name="obj_pos">
        <point val="6.05,14.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,14.1133;6.70448,14.4733"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250043#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,14.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O154">
      <attribute name="obj_pos">
        <point val="6.05,15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,14.7133;6.70448,15.0733"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250050#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O155">
      <attribute name="obj_pos">
        <point val="6.05,15.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,15.3133;6.70448,15.6733"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250068#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,15.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O156">
      <attribute name="obj_pos">
        <point val="6.05,16.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,15.9133;6.70448,16.2733"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250076#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,16.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O157">
      <attribute name="obj_pos">
        <point val="6.05,16.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,16.5133;6.70448,16.8733"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250092#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,16.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O158">
      <attribute name="obj_pos">
        <point val="6.05,17.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,17.1133;6.70448,17.4733"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250100#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,17.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O159">
      <attribute name="obj_pos">
        <point val="6.05,18"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,17.7133;6.70448,18.0733"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250118#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,18"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O160">
      <attribute name="obj_pos">
        <point val="6.05,19.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,19.5133;6.70448,19.8733"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250522#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,19.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O161">
      <attribute name="obj_pos">
        <point val="11.25,9.025"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5955,8.73833;11.9045,9.09833"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250621#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="11.25,9.025"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O162">
      <attribute name="obj_pos">
        <point val="11.25,9.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5955,9.36333;11.9045,9.72333"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250647#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="11.25,9.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O163">
      <attribute name="obj_pos">
        <point val="11.25,10.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5955,9.96333;11.9045,10.3233"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250654#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="11.25,10.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O164">
      <attribute name="obj_pos">
        <point val="11.25,10.825"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5955,10.5383;11.9045,10.8983"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250712#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="11.25,10.825"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O165">
      <attribute name="obj_pos">
        <point val="11.25,11.425"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5955,11.1383;11.9045,11.4983"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250738#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="11.25,11.425"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O166">
      <attribute name="obj_pos">
        <point val="11.25,12.075"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5955,11.7883;11.9045,12.1483"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250746#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="11.25,12.075"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O167">
      <attribute name="obj_pos">
        <point val="11.25,12.675"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5955,12.3883;11.9045,12.7483"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250753#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="11.25,12.675"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O168">
      <attribute name="obj_pos">
        <point val="11.25,13.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5955,12.9633;11.9045,13.3233"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250811#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="11.25,13.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O169">
      <attribute name="obj_pos">
        <point val="11.25,13.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5955,13.5633;11.9045,13.9233"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250829#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="11.25,13.85"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O170">
      <attribute name="obj_pos">
        <point val="11.25,14.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5955,14.1633;11.9045,14.5233"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250845#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="11.25,14.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O171">
      <attribute name="obj_pos">
        <point val="11.25,15.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5955,14.7633;11.9045,15.1233"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250852#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="11.25,15.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O172">
      <attribute name="obj_pos">
        <point val="11.25,15.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5955,15.3633;11.9045,15.7233"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250860#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="11.25,15.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O173">
      <attribute name="obj_pos">
        <point val="11.25,16.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5955,15.9633;11.9045,16.3233"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250878#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="11.25,16.25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O174">
      <attribute name="obj_pos">
        <point val="15.55,19.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.1865,19.5611;16.9135,19.8611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#188;&#167; &#181;&#164; &#199;&#222; &#194;&#206; &#203;&#231; &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.55,19.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O175">
      <attribute name="obj_pos">
        <point val="18.95,19.275"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.7076,19.0839;18.95,19.3239"/>
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
            <real val="0.24"/>
          </attribute>
          <attribute name="pos">
            <point val="18.95,19.275"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.14544"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1212"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O176">
      <attribute name="obj_pos">
        <point val="18.95,19.875"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.7076,19.6839;18.95,19.9239"/>
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
            <real val="0.24"/>
          </attribute>
          <attribute name="pos">
            <point val="18.95,19.875"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.14544"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1212"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O177">
      <attribute name="obj_pos">
        <point val="2.61793,21.4069"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.61793,21.1999;11.8089,21.4599"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#161;&#202;&#193;&#237;&#179;&#231;&#201;&#188;&#164;&#203;&#164;&#207;&#184;&#248;&#200;&#241;&#201;&#233;&#195;&#180;&#176;&#229;&#206;&#197;&#161;&#166;&#202;&#161;&#187;&#227;&#176;&#229;&#206;&#197;&#164;&#206;&#183;&#239;&#191;&#244;&#164;&#207;&#186;&#198;&#183;&#199;&#164;&#185;&#164;&#235;&#201;&#172;&#205;&#215;&#164;&#207;&#164;&#162;&#164;&#234;&#164;&#222;&#164;&#187;&#164;&#243;&#161;&#163;&#161;&#203;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="2.61793,21.4069"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.15756"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1313"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O178">
      <attribute name="obj_pos">
        <point val="2.15,1.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.15,1.26111;4.574,1.56111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#205;&#215;&#205;&#205;&#188;&#176;&#194;&#232;&#163;&#178;&#185;&#230;&#161;&#221;&#163;&#177;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.15,1.5"/>
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
    <object type="Standard - Text" version="0" id="O179">
      <attribute name="obj_pos">
        <point val="3.6,18.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,18.3611;4.4181,18.6611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#226;  &#197;&#231;  &#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,18.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O180">
      <attribute name="obj_pos">
        <point val="3.6,19.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,18.9611;4.4181,19.2611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#198;  &#184;&#182;  &#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.6,19.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O181">
      <attribute name="obj_pos">
        <point val="6.05,18.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,18.3133;6.70448,18.6733"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250126#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,18.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O182">
      <attribute name="obj_pos">
        <point val="6.05,19.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,18.9133;6.70448,19.2733"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#250134#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.05,19.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O183">
      <attribute name="obj_pos">
        <point val="15.2329,3.89705"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2329,3.65816;18.3235,3.95816"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#179;. &#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#197;&#197;&#187;&#187;&#189;&#232;&#205;&#253;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.2329,3.89705"/>
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
    <object type="Standard - Text" version="0" id="O184">
      <attribute name="obj_pos">
        <point val="2.355,22.1787"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.355,21.9717;8.97252,22.2317"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#179;) &#163;&#177;&#178;&#243;&#164;&#206;&#192;&#193;&#181;&#225;&#164;&#203;&#164;&#196;&#164;&#173;&#163;&#177;&#203;&#231;&#164;&#206;&#193;&#237;&#179;&#231;&#201;&#188;&#164;&#199;&#192;&#193;&#181;&#225;&#164;&#183;&#164;&#198;&#178;&#188;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="2.355,22.1787"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.15756"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1313"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O185">
      <attribute name="obj_pos">
        <point val="2.355,22.5537"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.355,22.3467;18.6887,22.6067"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#180;) &#183;&#238;&#195;&#217;&#164;&#236;&#192;&#193;&#181;&#225;&#202;&#172;&#197;&#249;&#164;&#203;&#164;&#171;&#164;&#171;&#164;&#235;&#181;&#236;&#196;&#174;&#194;&#188;&#197;&#249;&#164;&#206;&#192;&#193;&#181;&#225;&#164;&#172;&#164;&#162;&#164;&#235;&#190;&#236;&#185;&#231;&#164;&#207;&#161;&#162;&#205;&#190;&#199;&#242;&#205;&#243;&#164;&#203;&#192;&#193;&#181;&#225;&#164;&#206;&#164;&#162;&#164;&#235;&#181;&#236;&#202;&#221;&#184;&#177;&#188;&#212;&#200;&#214;&#185;&#230;&#197;&#249;&#164;&#242;&#181;&#173;&#198;&#254;&#164;&#206;&#164;&#166;&#164;&#168;&#161;&#162;&#187;&#230;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#183;&#239;&#191;&#244;&#164;&#242;&#181;&#173;&#198;&#254;&#164;&#183;&#161;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="2.355,22.5537"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.15756"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1313"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O186">
      <attribute name="obj_pos">
        <point val="2.905,22.9787"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.905,22.7717;5.0058,23.0317"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#192;&#193;&#181;&#225;&#164;&#183;&#164;&#198;&#178;&#188;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="2.905,22.9787"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.15756"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1313"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O187">
      <attribute name="obj_pos">
        <point val="2.38,23.4037"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.38,23.1967;16.3503,23.4567"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#181;) &#198;&#195;&#202;&#204;&#206;&#197;&#205;&#220;&#200;&#241;&#164;&#207;&#161;&#162;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#164;&#206;&#190;&#229;&#201;&#244;&#205;&#190;&#199;&#242;&#164;&#203;&#161;&#214;&#198;&#195;&#202;&#204;&#206;&#197;&#205;&#220;&#200;&#241;&#161;&#215;&#164;&#200;&#188;&#235;&#181;&#173;&#164;&#183;&#161;&#162;&#190;&#229;&#181;&#173;&#185;&#231;&#183;&#215;&#164;&#203;&#164;&#207;&#180;&#222;&#164;&#222;&#164;&#186;&#193;&#237;&#179;&#231;&#201;&#188;&#164;&#206;&#178;&#188;&#164;&#203;&#196;&#214;&#164;&#184;&#164;&#198;&#178;&#188;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="2.38,23.4037"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.15756"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1313"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O188">
      <attribute name="obj_pos">
        <point val="2.38,23.8287"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.38,23.6217;10.0479,23.8817"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#182;) &#199;&#203;&#192;&#254;&#164;&#232;&#164;&#234;&#178;&#188;&#195;&#202;&#164;&#207;&#203;&#220;&#178;&#241;&#187;&#200;&#205;&#209;&#202;&#172;&#164;&#203;&#164;&#196;&#164;&#173;&#181;&#173;&#186;&#220;&#164;&#206;&#201;&#172;&#205;&#215;&#164;&#207;&#164;&#162;&#164;&#234;&#164;&#222;&#164;&#187;&#164;&#243;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="2.38,23.8287"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.15756"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1313"/>
          </attribute>
        </composite>
      </attribute>
    </object>
  </layer>
  <layer name="&#186;&#185;&#164;&#183;&#185;&#254;&#164;&#223;" visible="true">
    <object type="Embed - Text" version="0" id="O189">
      <attribute name="obj_pos">
        <point val="2.7,2.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7,1.97222;7.548,2.57222"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SRYYM#</string>
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
            <real val="0.6"/>
          </attribute>
          <attribute name="pos">
            <point val="2.7,2.45"/>
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
    <object type="Embed - Text" version="0" id="O190">
      <attribute name="obj_pos">
        <point val="7.32963,3.75076"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.32963,3.11372;10.7232,3.91372"/>
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
            <string>#1234567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.8"/>
          </attribute>
          <attribute name="pos">
            <point val="7.32963,3.75076"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
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
    <object type="Embed - Text" version="0" id="O191">
      <attribute name="obj_pos">
        <point val="5.8,4.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.8,4.20537;15.1425,4.94537"/>
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
            <real val="0.37"/>
          </attribute>
          <attribute name="pos">
            <point val="5.8,4.5"/>
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
    <object type="Embed - Text" version="0" id="O192">
      <attribute name="obj_pos">
        <point val="5.8,5.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.8,5.00537;13.274,5.74537"/>
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
            <real val="0.37"/>
          </attribute>
          <attribute name="pos">
            <point val="5.8,5.3"/>
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
    <object type="Embed - Text" version="0" id="O193">
      <attribute name="obj_pos">
        <point val="5.8,6.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.8,5.78148;13.88,6.58148"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KAISETU#</string>
      </attribute>
      <attribute name="embed_text_column">
        <int val="40"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.8,6.1"/>
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
    <object type="Embed - Text" version="0" id="O194">
      <attribute name="obj_pos">
        <point val="5.842,6.84786"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.842,6.52934;9.478,6.92934"/>
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
            <point val="5.842,6.84786"/>
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
    <object type="Embed - Text" version="0" id="O195">
      <attribute name="obj_pos">
        <point val="3.35,7.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.35,7.36111;6.683,7.66111"/>
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
            <string>#&#202;&#191;&#192;&#174;&#163;&#185;&#163;&#185;&#199;&#175;&#163;&#185;&#163;&#185;&#183;&#238;&#163;&#185;&#163;&#185;&#198;&#252;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="3.35,7.6"/>
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
    <object type="Embed - Text" version="0" id="O196">
      <attribute name="obj_pos">
        <point val="8.4,9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,8.68148;8.4,9.08148"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4,9"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O197">
      <attribute name="obj_pos">
        <point val="8.4,9.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,9.28148;8.4,9.68148"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4,9.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O198">
      <attribute name="obj_pos">
        <point val="8.4,10.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,9.88148;8.4,10.2815"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4,10.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O199">
      <attribute name="obj_pos">
        <point val="8.4,10.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,10.4815;8.4,10.8815"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4,10.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O200">
      <attribute name="obj_pos">
        <point val="8.4,11.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,11.0815;8.4,11.4815"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4,11.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O201">
      <attribute name="obj_pos">
        <point val="8.4,12"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,11.6815;8.4,12.0815"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4,12"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O202">
      <attribute name="obj_pos">
        <point val="8.4,12.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,12.2815;8.4,12.6815"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4,12.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O203">
      <attribute name="obj_pos">
        <point val="8.4,13.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,12.8815;8.4,13.2815"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4,13.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O204">
      <attribute name="obj_pos">
        <point val="8.4,13.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,13.4815;8.4,13.8815"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4,13.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O205">
      <attribute name="obj_pos">
        <point val="8.4,14.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,14.0815;8.4,14.4815"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4,14.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O206">
      <attribute name="obj_pos">
        <point val="8.4,15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,14.6815;8.4,15.0815"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4,15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O207">
      <attribute name="obj_pos">
        <point val="8.4,15.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,15.2815;8.4,15.6815"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4,15.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O208">
      <attribute name="obj_pos">
        <point val="8.4,16.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,15.8815;8.4,16.2815"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4,16.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O209">
      <attribute name="obj_pos">
        <point val="8.4,16.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,16.4815;8.4,16.8815"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4,16.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O210">
      <attribute name="obj_pos">
        <point val="8.4,17.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,17.0815;8.4,17.4815"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4,17.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O211">
      <attribute name="obj_pos">
        <point val="8.4,18"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,17.6815;8.4,18.0815"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[15].KENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4,18"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O212">
      <attribute name="obj_pos">
        <point val="8.4,18.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,18.3315;8.4,18.7315"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[16].KENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4,18.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O213">
      <attribute name="obj_pos">
        <point val="18.9,18.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.4456,18.6315;18.9,19.0315"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#GKENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="18.9,18.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O214">
      <attribute name="obj_pos">
        <point val="17.3229,3.575"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.3229,3.25648;17.7269,3.65648"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RECE[0]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#161;&#251;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="17.3229,3.575"/>
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
    <object type="Embed - Text" version="0" id="O215">
      <attribute name="obj_pos">
        <point val="15.1729,3.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.1729,3.63148;15.5769,4.03148"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RECE[1]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#161;&#251;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="15.1729,3.95"/>
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
    <object type="Embed - Text" version="0" id="O216">
      <attribute name="obj_pos">
        <point val="8.4122,19.2692"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.2002,18.9507;8.4122,19.3507"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[17].KENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4122,19.2692"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O217">
      <attribute name="obj_pos">
        <point val="8.4122,19.8257"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.2002,19.5072;8.4122,19.9072"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[18].KENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.4122,19.8257"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O218">
      <attribute name="obj_pos">
        <point val="13.6122,9.02573"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.4002,8.70721;13.6122,9.10721"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[19].KENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.6122,9.02573"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O219">
      <attribute name="obj_pos">
        <point val="13.6122,9.65073"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.4002,9.33221;13.6122,9.73221"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[20].KENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.6122,9.65073"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O220">
      <attribute name="obj_pos">
        <point val="13.6122,10.2506"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.4002,9.93208;13.6122,10.3321"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[21].KENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.6122,10.2506"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O221">
      <attribute name="obj_pos">
        <point val="13.6122,10.8256"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.4002,10.5071;13.6122,10.9071"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[22].KENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.6122,10.8256"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O222">
      <attribute name="obj_pos">
        <point val="13.6122,11.4506"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.4002,11.1321;13.6122,11.5321"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[23].KENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.6122,11.4506"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O223">
      <attribute name="obj_pos">
        <point val="13.6122,12.0256"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.4002,11.7071;13.6122,12.1071"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[24].KENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.6122,12.0256"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O224">
      <attribute name="obj_pos">
        <point val="13.6122,12.6506"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.4002,12.3321;13.6122,12.7321"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[25].KENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.6122,12.6506"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O225">
      <attribute name="obj_pos">
        <point val="13.6122,13.2256"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.4002,12.9071;13.6122,13.3071"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[26].KENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.6122,13.2256"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O226">
      <attribute name="obj_pos">
        <point val="13.6122,13.8506"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.4002,13.5321;13.6122,13.9321"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[27].KENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.6122,13.8506"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O227">
      <attribute name="obj_pos">
        <point val="13.6122,14.4256"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.4002,14.1071;13.6122,14.5071"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[28].KENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.6122,14.4256"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O228">
      <attribute name="obj_pos">
        <point val="13.6122,15.0256"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.4002,14.7071;13.6122,15.1071"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[29].KENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.6122,15.0256"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O229">
      <attribute name="obj_pos">
        <point val="13.6122,15.6472"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.4002,15.3287;13.6122,15.7287"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[30].KENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.6122,15.6472"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O230">
      <attribute name="obj_pos">
        <point val="13.6122,16.2472"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.4002,15.9287;13.6122,16.3287"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYU[31].KENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.6122,16.2472"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O231">
      <attribute name="obj_pos">
        <point val="8.775,16.8345"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.775,16.5956;10.29,16.8956"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[0].EHKNJANAME#</string>
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
            <point val="8.775,16.8345"/>
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
    <object type="Embed - Text" version="0" id="O232">
      <attribute name="obj_pos">
        <point val="10.575,16.8595"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.575,16.5728;11.884,16.9328"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[0].EHKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#000000#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="10.575,16.8595"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O233">
      <attribute name="obj_pos">
        <point val="13.575,16.8595"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.363,16.541;13.575,16.941"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[0].EKENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.575,16.8595"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O234">
      <attribute name="obj_pos">
        <point val="8.78,17.4688"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.78,17.2299;10.295,17.5299"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[1].EHKNJANAME#</string>
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
            <point val="8.78,17.4688"/>
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
    <object type="Embed - Text" version="0" id="O235">
      <attribute name="obj_pos">
        <point val="10.58,17.4938"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.58,17.2071;11.889,17.5671"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[1].EHKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#000000#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="10.58,17.4938"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O236">
      <attribute name="obj_pos">
        <point val="13.58,17.4938"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.368,17.1753;13.58,17.5753"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[1].EKENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.58,17.4938"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O237">
      <attribute name="obj_pos">
        <point val="8.78,18.0938"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.78,17.8549;10.295,18.1549"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[2].EHKNJANAME#</string>
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
            <point val="8.78,18.0938"/>
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
    <object type="Embed - Text" version="0" id="O238">
      <attribute name="obj_pos">
        <point val="10.58,18.1188"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.58,17.8321;11.889,18.1921"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[2].EHKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#000000#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="10.58,18.1188"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O239">
      <attribute name="obj_pos">
        <point val="13.58,18.1188"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.368,17.8003;13.58,18.2003"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[2].EKENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.58,18.1188"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O240">
      <attribute name="obj_pos">
        <point val="8.805,18.6688"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.805,18.4299;10.32,18.7299"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[3].EHKNJANAME#</string>
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
            <point val="8.805,18.6688"/>
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
    <object type="Embed - Text" version="0" id="O241">
      <attribute name="obj_pos">
        <point val="10.605,18.6938"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.605,18.4071;11.914,18.7671"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[3].EHKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#000000#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="10.605,18.6938"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O242">
      <attribute name="obj_pos">
        <point val="13.605,18.6938"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.393,18.3753;13.605,18.7753"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[3].EKENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.605,18.6938"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O243">
      <attribute name="obj_pos">
        <point val="8.805,19.2688"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.805,19.0299;10.32,19.3299"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[4].EHKNJANAME#</string>
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
            <point val="8.805,19.2688"/>
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
    <object type="Embed - Text" version="0" id="O244">
      <attribute name="obj_pos">
        <point val="10.605,19.2938"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.605,19.0071;11.914,19.3671"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[4].EHKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#000000#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="10.605,19.2938"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O245">
      <attribute name="obj_pos">
        <point val="13.605,19.2938"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.393,18.9753;13.605,19.3753"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[4].EKENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.605,19.2938"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
    <object type="Embed - Text" version="0" id="O246">
      <attribute name="obj_pos">
        <point val="8.805,19.8438"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.805,19.6049;10.32,19.9049"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[5].EHKNJANAME#</string>
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
            <point val="8.805,19.8438"/>
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
    <object type="Embed - Text" version="0" id="O247">
      <attribute name="obj_pos">
        <point val="10.605,19.8688"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.605,19.5821;11.914,19.9421"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[5].EHKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#000000#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="10.605,19.8688"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.21816"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O248">
      <attribute name="obj_pos">
        <point val="13.605,19.8688"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.393,19.5503;13.605,19.9503"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ESEIKYU[5].EKENSU#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.605,19.8688"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
  </layer>
</diagram>
