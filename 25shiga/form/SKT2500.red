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
        <rectangle val="1.98,7.98;19.0214,18.8302"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="2,8"/>
      </attribute>
      <attribute name="elem_width">
        <real val="17.0014"/>
      </attribute>
      <attribute name="elem_height">
        <real val="10.8102"/>
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
        <connection handle="1" to="O21" connection="2"/>
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
        <connection handle="1" to="O21" connection="5"/>
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
        <point val="5.325,25.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.315,25.09;5.335,28.91"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.325,25.1"/>
        <point val="5.325,28.9"/>
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
        <point val="7.825,25.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.815,25.09;7.835,28.91"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="7.825,25.1"/>
        <point val="7.825,28.9"/>
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
    <object type="Standard - Line" version="0" id="O13">
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
        <connection handle="1" to="O18" connection="5"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O14">
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
    <object type="Standard - Line" version="0" id="O15">
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
        <connection handle="1" to="O17" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O16">
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
    <object type="Standard - Box" version="0" id="O17">
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
    <object type="Standard - Box" version="0" id="O18">
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
    <object type="Standard - Line" version="0" id="O19">
      <attribute name="obj_pos">
        <point val="5.31799,27.6001"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.30799,27.59;11.91,27.6101"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.31799,27.6001"/>
        <point val="11.9,27.6"/>
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
        <point val="5.34299,28.3001"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.33299,28.29;11.91,28.3101"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.34299,28.3001"/>
        <point val="11.9,28.3"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O21">
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
    <object type="Standard - Line" version="0" id="O22">
      <attribute name="obj_pos">
        <point val="2,8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,7.995;19.0064,8.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,8"/>
        <point val="19.0014,8"/>
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
    <object type="Standard - Line" version="0" id="O23">
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
    <object type="Standard - Line" version="0" id="O24">
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
    <object type="Standard - Line" version="0" id="O25">
      <attribute name="obj_pos">
        <point val="1.997,9.81154"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.992,9.795;19.005,9.81654"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.997,9.81154"/>
        <point val="19,9.8"/>
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
    <object type="Standard - Line" version="0" id="O27">
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
    <object type="Standard - Line" version="0" id="O28">
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
    <object type="Standard - Line" version="0" id="O29">
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
    <object type="Standard - Line" version="0" id="O30">
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
    <object type="Standard - Line" version="0" id="O31">
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
    <object type="Standard - Line" version="0" id="O32">
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
    <object type="Standard - Line" version="0" id="O33">
      <attribute name="obj_pos">
        <point val="2,14.5823"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,14.5773;13.8112,14.5926"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,14.5823"/>
        <point val="13.8062,14.5876"/>
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
        <point val="2,15.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,15.195;19.012,15.211"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,15.2"/>
        <point val="19.007,15.206"/>
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
        <point val="2.01767,16.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.01267,16.395;19.012,16.4124"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.01767,16.4"/>
        <point val="19.007,16.4074"/>
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
        <point val="2,17"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,16.995;17.3305,17.0131"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,17"/>
        <point val="17.3255,17.0081"/>
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
        <point val="2,17.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,17.5862;19.0089,17.605"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,17.6"/>
        <point val="19.0039,17.5912"/>
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
        <point val="2,15.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,15.795;13.7646,15.8117"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,15.8"/>
        <point val="13.7596,15.8067"/>
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
        <point val="2,18.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.995,18.1869;13.7775,18.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,18.2"/>
        <point val="13.7725,18.1919"/>
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
        <point val="15.3824,17.5735"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.3774,17.5685;15.3874,18.8225"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.3824,17.5735"/>
        <point val="15.3824,18.8175"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O41">
      <attribute name="obj_pos">
        <point val="13.748,8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.748,8;13.8,18.8102"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="13.748,8"/>
      </attribute>
      <attribute name="elem_width">
        <real val="0.0520039"/>
      </attribute>
      <attribute name="elem_height">
        <real val="10.8102"/>
      </attribute>
      <attribute name="border_width">
        <real val="1.49012e-08"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="true"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O42">
      <attribute name="obj_pos">
        <point val="5.2,8.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.195,8.595;5.21305,18.7976"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.2,8.6"/>
        <point val="5.20805,18.7926"/>
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
        <point val="10.3935,8.60424"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3867,8.59924;10.3985,18.8171"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.3935,8.60424"/>
        <point val="10.3917,18.8121"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O44">
      <attribute name="obj_pos">
        <point val="15.7,8.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.695,8.595;15.7081,14.0273"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.7,8.6"/>
        <point val="15.7031,14.0223"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O45">
      <attribute name="obj_pos">
        <point val="6.9,8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.895,7.995;6.90916,18.8152"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.9,8"/>
        <point val="6.90416,18.8102"/>
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
        <point val="12.05,8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.045,7.995;12.0569,18.8329"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.05,8"/>
        <point val="12.0519,18.8279"/>
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
        <point val="17.35,8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.3385,7.995;17.355,17.6138"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.35,8"/>
        <point val="17.3435,17.6088"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O48">
      <attribute name="obj_pos">
        <point val="8.55,8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.55,8;8.6,18.8102"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="8.55,8"/>
      </attribute>
      <attribute name="elem_width">
        <real val="0.05"/>
      </attribute>
      <attribute name="elem_height">
        <real val="10.8102"/>
      </attribute>
      <attribute name="border_width">
        <real val="1.49012e-08"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="true"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O49">
      <attribute name="obj_pos">
        <point val="15.4001,18.1919"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.3951,18.1869;19.0093,18.1969"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.4001,18.1919"/>
        <point val="19.0043,18.1919"/>
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
        <point val="17.751,17.5993"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.7449,17.5943;17.756,18.8152"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.751,17.5993"/>
        <point val="17.7499,18.8102"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O51">
      <attribute name="obj_pos">
        <point val="14.9686,17.0103"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.9636,17.0053;14.9757,17.6199"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.9686,17.0103"/>
        <point val="14.9707,17.6149"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O52">
      <attribute name="obj_pos">
        <point val="16.17,17.0103"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.165,17.0053;16.1771,17.6199"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="16.17,17.0103"/>
        <point val="16.1721,17.6149"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O53">
      <attribute name="obj_pos">
        <point val="1.98974,10.9955"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.97474,10.9805;8.5839,11.0161"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.98974,10.9955"/>
        <point val="8.5689,11.0011"/>
      </attribute>
      <attribute name="numcp">
        <int val="0"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
    </object>
  </layer>
  <layer name="&#202;&#184;&#187;&#250;" visible="true">
    <object type="Standard - Text" version="0" id="O54">
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
    <object type="Standard - Text" version="0" id="O55">
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
    <object type="Standard - Text" version="0" id="O56">
      <attribute name="obj_pos">
        <point val="2.67714,19.8776"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.67714,19.6387;4.79814,19.9387"/>
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
            <point val="2.67714,19.8776"/>
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
    <object type="Standard - Text" version="0" id="O57">
      <attribute name="obj_pos">
        <point val="2.28964,20.2894"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.28964,20.0824;18.4658,20.3424"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#177;) &#183;&#239;&#191;&#244;&#205;&#243;&#164;&#207;&#183;&#238;&#195;&#217;&#164;&#236;&#192;&#193;&#181;&#225;&#202;&#172;&#164;&#226;&#180;&#222;&#164;&#225;&#164;&#198;&#202;&#221;&#184;&#177;&#188;&#212;&#203;&#232;&#164;&#203;&#185;&#241;&#202;&#221;&#202;&#172;(&#185;&#241;&#202;&#221;&#176;&#236;&#200;&#204;&#202;&#172;&#161;&#220;&#194;&#224;&#191;&#166;&#188;&#212;&#202;&#172;&#161;&#220;&#207;&#183;&#191;&#205;&#202;&#221;&#183;&#242;&#202;&#172;(&#202;&#191;&#192;&#174;&#163;&#178;&#163;&#176;&#199;&#175;&#163;&#179;&#183;&#238;&#191;&#199;&#206;&#197;&#202;&#172;&#164;&#222;&#164;&#199;))&#164;&#206;&#187;&#230;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#164;&#206;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="2.28964,20.2894"/>
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
    <object type="Standard - Text" version="0" id="O58">
      <attribute name="obj_pos">
        <point val="2.325,21.3793"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.325,21.1723;16.5579,21.4323"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#178;) &#184;&#169;&#198;&#226;&#185;&#241;&#202;&#221;&#202;&#172;&#187;&#230;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#185;&#231;&#183;&#215;&#183;&#239;&#191;&#244;&#205;&#243;&#164;&#203;&#164;&#207;&#161;&#162;&#202;&#221;&#184;&#177;&#188;&#212;&#203;&#232;&#164;&#206;&#183;&#239;&#191;&#244;&#164;&#242;&#189;&#184;&#183;&#215;&#164;&#183;&#161;&#162;&#184;&#169;&#198;&#226;&#164;&#206;&#187;&#230;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#164;&#206;&#193;&#237;&#183;&#239;&#191;&#244;&#164;&#242;&#181;&#173;&#186;&#220;&#164;&#183;&#164;&#198;&#164;&#175;&#164;&#192;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="2.325,21.3793"/>
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
    <object type="Standard - Text" version="0" id="O59">
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
    <object type="Standard - Text" version="0" id="O60">
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
    <object type="Standard - Text" version="0" id="O61">
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
    <object type="Standard - Text" version="0" id="O62">
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
    <object type="Standard - Text" version="0" id="O63">
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
    <object type="Standard - Text" version="0" id="O64">
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
    <object type="Standard - Text" version="0" id="O65">
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
    <object type="Standard - Text" version="0" id="O66">
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
    <object type="Standard - Text" version="0" id="O67">
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
    <object type="Standard - Text" version="0" id="O68">
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
    <object type="Standard - Text" version="0" id="O69">
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
    <object type="Standard - Text" version="0" id="O70">
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
    <object type="Standard - Text" version="0" id="O71">
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
    <object type="Standard - Text" version="0" id="O72">
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
    <object type="Standard - Text" version="0" id="O73">
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
    <object type="Standard - Text" version="0" id="O74">
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
    <object type="Standard - Text" version="0" id="O75">
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
    <object type="Standard - Text" version="0" id="O76">
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
    <object type="Standard - Text" version="0" id="O77">
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
    <object type="Standard - Text" version="0" id="O78">
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
    <object type="Standard - Text" version="0" id="O79">
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
    <object type="Standard - Text" version="0" id="O80">
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
    <object type="Standard - Text" version="0" id="O81">
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
    <object type="Standard - Text" version="0" id="O82">
      <attribute name="obj_pos">
        <point val="3.45,25.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.45,25.2111;4.965,25.5111"/>
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
            <point val="3.45,25.45"/>
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
    <object type="Standard - Text" version="0" id="O83">
      <attribute name="obj_pos">
        <point val="5.825,25.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.825,25.2111;7.5824,25.5111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#187;&#246; &#204;&#179; &#197;&#192; &#184;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="5.825,25.45"/>
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
        <point val="8.275,25.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.275,25.2111;9.79,25.5111"/>
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
            <point val="8.275,25.45"/>
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
        <point val="10.45,25.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.45,25.2111;11.662,25.5111"/>
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
            <point val="10.45,25.45"/>
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
    <object type="Standard - Text" version="0" id="O87">
      <attribute name="obj_pos">
        <point val="13.925,25.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.925,25.2111;15.137,25.5111"/>
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
            <point val="13.925,25.45"/>
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
        <point val="15.675,25.475"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.675,25.2361;16.887,25.5361"/>
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
            <point val="15.675,25.475"/>
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
    <object type="Standard - Text" version="0" id="O90">
      <attribute name="obj_pos">
        <point val="6,27.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6,27.2111;7.212,27.5111"/>
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
            <point val="6,27.45"/>
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
        <point val="8.425,27.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.425,27.2111;9.637,27.5111"/>
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
            <point val="8.425,27.45"/>
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
    <object type="Standard - Text" version="0" id="O93">
      <attribute name="obj_pos">
        <point val="6.3,28.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.3,27.8019;6.805,28.3019"/>
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
            <point val="6.3,28.2"/>
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
        <point val="8.775,28.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.775,27.8019;9.28,28.3019"/>
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
            <point val="8.775,28.2"/>
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
    <object type="Standard - Text" version="0" id="O96">
      <attribute name="obj_pos">
        <point val="6.15,28.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.15,28.3917;7.059,28.8417"/>
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
            <point val="6.15,28.75"/>
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
        <point val="8.575,28.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.575,28.3917;9.484,28.8417"/>
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
            <point val="8.575,28.75"/>
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
    <object type="Standard - Text" version="0" id="O99">
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
    <object type="Standard - Text" version="0" id="O100">
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
    <object type="Standard - Text" version="0" id="O101">
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
    <object type="Standard - Text" version="0" id="O102">
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
    <object type="Standard - Text" version="0" id="O103">
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
    <object type="Standard - Text" version="0" id="O104">
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
    <object type="Standard - Text" version="0" id="O105">
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
    <object type="Standard - Text" version="0" id="O106">
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
    <object type="Standard - Text" version="0" id="O107">
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
    <object type="Standard - Text" version="0" id="O108">
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
    <object type="Standard - Text" version="0" id="O109">
      <attribute name="obj_pos">
        <point val="3.6,9.61696"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.388,9.37807;4.812,9.67807"/>
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
            <point val="3.6,9.61696"/>
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
    <object type="Standard - Text" version="0" id="O110">
      <attribute name="obj_pos">
        <point val="3.6,10.217"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.691,9.97811;4.509,10.2781"/>
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
            <point val="3.6,10.217"/>
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
        <point val="3.6,10.817"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.2365,10.5781;4.9635,10.8781"/>
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
            <point val="3.6,10.817"/>
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
        <point val="3.6,11.417"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,11.1781;4.4181,11.4781"/>
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
            <point val="3.6,11.417"/>
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
        <point val="3.6,12.017"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,11.7781;4.4181,12.0781"/>
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
            <point val="3.6,12.017"/>
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
        <point val="3.6,12.617"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,12.3781;4.4181,12.6781"/>
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
            <point val="3.6,12.617"/>
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
        <point val="3.6,13.217"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.4789,12.9781;4.7211,13.2781"/>
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
            <point val="3.6,13.217"/>
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
        <point val="3.6,13.817"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7213,13.5781;4.4787,13.8781"/>
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
            <point val="3.6,13.817"/>
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
        <point val="3.6,14.417"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,14.1781;4.4181,14.4781"/>
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
            <point val="3.6,14.417"/>
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
        <point val="3.6,15.017"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,14.7781;4.4181,15.0781"/>
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
            <point val="3.6,15.017"/>
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
        <point val="3.6,15.617"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,15.3781;4.4181,15.6781"/>
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
            <point val="3.6,15.617"/>
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
        <point val="3.6,16.217"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,15.9781;4.4181,16.2781"/>
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
            <point val="3.6,16.217"/>
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
        <point val="3.6,16.817"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,16.5781;4.4181,16.8781"/>
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
            <point val="3.6,16.817"/>
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
        <point val="3.6,18.617"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,18.3781;4.4181,18.6781"/>
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
            <point val="3.6,18.617"/>
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
        <point val="9.81069,9.025"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.35619,8.78611;10.2652,9.08611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#194;&#197;&#218;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.81069,9.025"/>
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
    <object type="Standard - Text" version="0" id="O125">
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
    <object type="Standard - Text" version="0" id="O126">
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
    <object type="Standard - Text" version="0" id="O127">
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
    <object type="Standard - Text" version="0" id="O128">
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
    <object type="Standard - Text" version="0" id="O129">
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
    <object type="Standard - Text" version="0" id="O130">
      <attribute name="obj_pos">
        <point val="9.81069,13.225"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.35619,12.9861;10.2652,13.2861"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#215;&#201;&#177;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.81069,13.225"/>
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
        <point val="9.81069,13.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.35619,13.6111;10.2652,13.9111"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#208;&#203;&#204;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.81069,13.85"/>
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
        <point val="9.81069,14.4323"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.35619,14.1934;10.2652,14.4934"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#226;&#183;&#238;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.81069,14.4323"/>
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
        <point val="9.81069,15.6147"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.35619,15.3758;10.2652,15.6758"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#205;&#190;&#184;&#226;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="9.81069,15.6147"/>
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
        <point val="9.75839,15.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.25339,14.8509;10.2634,15.1009"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#204;&#218;&#199;&#183;&#203;&#220;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="9.75839,15.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O135">
      <attribute name="obj_pos">
        <point val="9.72306,16.2323"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.21806,16.0332;10.2281,16.2832"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#192;&#190;&#192;&#245;&#176;&#230;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="9.72306,16.2323"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O136">
      <attribute name="obj_pos">
        <point val="15.525,14.5413"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.1615,14.3024;16.8885,14.9024"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#169;&#198;&#226;&#185;&#241;&#202;&#221;&#202;&#172;
&#187;&#230;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#185;&#231;&#183;&#215;&#183;&#239;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.525,14.5413"/>
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
    <object type="Standard - Text" version="0" id="O138">
      <attribute name="obj_pos">
        <point val="6.05,9.61696"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,9.33029;6.70448,9.69029"/>
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
            <point val="6.05,9.61696"/>
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
    <object type="Standard - Text" version="0" id="O139">
      <attribute name="obj_pos">
        <point val="6.05,10.217"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,9.93033;6.70448,10.2903"/>
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
            <point val="6.05,10.217"/>
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
    <object type="Standard - Text" version="0" id="O140">
      <attribute name="obj_pos">
        <point val="6.05,10.817"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,10.5303;6.70448,10.8903"/>
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
            <point val="6.05,10.817"/>
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
    <object type="Standard - Text" version="0" id="O141">
      <attribute name="obj_pos">
        <point val="6.05,11.417"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,11.1303;6.70448,11.4903"/>
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
            <point val="6.05,11.417"/>
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
    <object type="Standard - Text" version="0" id="O142">
      <attribute name="obj_pos">
        <point val="6.05,12.017"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,11.7303;6.70448,12.0903"/>
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
            <point val="6.05,12.017"/>
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
    <object type="Standard - Text" version="0" id="O143">
      <attribute name="obj_pos">
        <point val="6.05,12.617"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,12.3303;6.70448,12.6903"/>
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
            <point val="6.05,12.617"/>
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
    <object type="Standard - Text" version="0" id="O144">
      <attribute name="obj_pos">
        <point val="6.05,13.217"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,12.9303;6.70448,13.2903"/>
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
            <point val="6.05,13.217"/>
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
        <point val="6.05,13.817"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,13.5303;6.70448,13.8903"/>
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
            <point val="6.05,13.817"/>
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
    <object type="Standard - Text" version="0" id="O146">
      <attribute name="obj_pos">
        <point val="6.05,14.417"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,14.1303;6.70448,14.4903"/>
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
            <point val="6.05,14.417"/>
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
    <object type="Standard - Text" version="0" id="O147">
      <attribute name="obj_pos">
        <point val="6.05,15.017"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,14.7303;6.70448,15.0903"/>
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
            <point val="6.05,15.017"/>
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
        <point val="6.05,15.617"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,15.3303;6.70448,15.6903"/>
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
            <point val="6.05,15.617"/>
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
        <point val="6.05,16.217"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,15.9303;6.70448,16.2903"/>
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
            <point val="6.05,16.217"/>
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
        <point val="6.05,16.817"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,16.5303;6.70448,16.8903"/>
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
            <point val="6.05,16.817"/>
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
        <point val="6.05,18.617"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,18.3303;6.70448,18.6903"/>
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
            <point val="6.05,18.617"/>
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
    <object type="Standard - Text" version="0" id="O153">
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
    <object type="Standard - Text" version="0" id="O154">
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
    <object type="Standard - Text" version="0" id="O155">
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
    <object type="Standard - Text" version="0" id="O156">
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
    <object type="Standard - Text" version="0" id="O157">
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
    <object type="Standard - Text" version="0" id="O158">
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
    <object type="Standard - Text" version="0" id="O159">
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
    <object type="Standard - Text" version="0" id="O160">
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
    <object type="Standard - Text" version="0" id="O161">
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
    <object type="Standard - Text" version="0" id="O162">
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
    <object type="Standard - Text" version="0" id="O163">
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
    <object type="Standard - Text" version="0" id="O164">
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
    <object type="Standard - Text" version="0" id="O165">
      <attribute name="obj_pos">
        <point val="15.55,16.856"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.4895,16.6171;16.6105,16.9171"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#199;&#222;&#194;&#206;&#188;&#239;&#206;&#224;&#161;&#166;&#203;&#231;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.55,16.856"/>
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
    <object type="Standard - Text" version="0" id="O166">
      <attribute name="obj_pos">
        <point val="18.925,15.0663"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.6826,14.8752;18.925,15.1152"/>
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
            <point val="18.925,15.0663"/>
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
    <object type="Standard - Text" version="0" id="O167">
      <attribute name="obj_pos">
        <point val="18.925,17.517"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.6826,17.3259;18.925,17.5659"/>
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
            <point val="18.925,17.517"/>
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
    <object type="Standard - Text" version="0" id="O168">
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
    <object type="Standard - Text" version="0" id="O169">
      <attribute name="obj_pos">
        <point val="3.6,17.417"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,17.1781;4.4181,17.4781"/>
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
            <point val="3.6,17.417"/>
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
    <object type="Standard - Text" version="0" id="O170">
      <attribute name="obj_pos">
        <point val="3.6,18.017"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.7819,17.7781;4.4181,18.0781"/>
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
            <point val="3.6,18.017"/>
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
    <object type="Standard - Text" version="0" id="O171">
      <attribute name="obj_pos">
        <point val="6.05,17.417"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,17.1303;6.70448,17.4903"/>
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
            <point val="6.05,17.417"/>
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
        <point val="6.05,18.017"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.39552,17.7303;6.70448,18.0903"/>
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
            <point val="6.05,18.017"/>
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
    <object type="Standard - Text" version="0" id="O174">
      <attribute name="obj_pos">
        <point val="2.355,22.108"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.355,21.901;9.23512,22.161"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#179;) &#163;&#177;&#178;&#243;&#164;&#206;&#192;&#193;&#181;&#225;&#164;&#203;&#164;&#196;&#164;&#173;&#163;&#177;&#203;&#231;&#164;&#206;&#193;&#237;&#179;&#231;&#201;&#188;&#164;&#199;&#192;&#193;&#181;&#225;&#164;&#183;&#164;&#198;&#164;&#175;&#164;&#192;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="2.355,22.108"/>
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
    <object type="Standard - Text" version="0" id="O175">
      <attribute name="obj_pos">
        <point val="2.355,22.9364"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.355,22.7294;18.4261,22.9894"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#181;) &#198;&#195;&#202;&#204;&#206;&#197;&#205;&#220;&#200;&#241;&#164;&#207;&#161;&#162;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#164;&#206;&#190;&#229;&#201;&#244;&#205;&#190;&#199;&#242;&#164;&#203;&#161;&#214;&#198;&#195;&#202;&#204;&#206;&#197;&#205;&#220;&#200;&#241;&#161;&#215;&#164;&#200;&#188;&#235;&#181;&#173;&#164;&#183;&#161;&#162;&#190;&#229;&#181;&#173;&#183;&#239;&#191;&#244;&#205;&#243;&#164;&#203;&#164;&#207;&#180;&#222;&#164;&#225;&#164;&#186;&#161;&#162;&#198;&#195;&#202;&#204;&#206;&#197;&#205;&#220;&#200;&#241;&#205;&#243;&#164;&#203;&#183;&#239;&#191;&#244;&#164;&#242;&#181;&#173;&#186;&#220;&#164;&#183;&#164;&#198;&#164;&#175;&#164;&#192;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="2.355,22.9364"/>
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
    <object type="Standard - Text" version="0" id="O176">
      <attribute name="obj_pos">
        <point val="2.355,23.3614"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.355,23.1544;7.92212,23.4144"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#182;) &#199;&#203;&#192;&#254;&#164;&#232;&#164;&#234;&#178;&#188;&#195;&#202;&#164;&#207;&#181;&#173;&#186;&#220;&#164;&#206;&#201;&#172;&#205;&#215;&#164;&#207;&#164;&#162;&#164;&#234;&#164;&#222;&#164;&#187;&#164;&#243;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="2.355,23.3614"/>
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
    <object type="Standard - Text" version="0" id="O177">
      <attribute name="obj_pos">
        <point val="15.5255,15.7786"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.0105,15.5397;17.0405,16.1397"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#169;&#198;&#226;&#184;&#229;&#180;&#252;&#185;&#226;&#206;&#240;&#188;&#212;&#176;&#229;&#206;&#197;&#202;&#172;
&#187;&#230;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#185;&#231;&#183;&#215;&#183;&#239;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.5255,15.7786"/>
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
    <object type="Standard - Text" version="0" id="O178">
      <attribute name="obj_pos">
        <point val="18.9504,16.2878"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.708,16.0967;18.9504,16.3367"/>
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
            <point val="18.9504,16.2878"/>
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
    <object type="Standard - Text" version="0" id="O179">
      <attribute name="obj_pos">
        <point val="13.8737,18.3385"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.8737,18.0996;15.3887,18.3996"/>
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
            <point val="13.8737,18.3385"/>
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
    <object type="Standard - Text" version="0" id="O180">
      <attribute name="obj_pos">
        <point val="16.1337,18.0738"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.1337,17.8349;17.1033,18.1349"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#241;  &#202;&#221;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="16.1337,18.0738"/>
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
    <object type="Standard - Text" version="0" id="O181">
      <attribute name="obj_pos">
        <point val="15.6031,18.5928"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.6031,18.3539;17.7241,18.6539"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#229;&#180;&#252;&#185;&#226;&#206;&#240;&#188;&#212;&#176;&#229;&#206;&#197;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.6031,18.5928"/>
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
    <object type="Standard - Text" version="0" id="O182">
      <attribute name="obj_pos">
        <point val="18.975,18.0559"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.7326,17.8648;18.975,18.1048"/>
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
            <point val="18.975,18.0559"/>
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
    <object type="Standard - Text" version="0" id="O183">
      <attribute name="obj_pos">
        <point val="18.9504,18.7428"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.708,18.5517;18.9504,18.7917"/>
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
            <point val="18.9504,18.7428"/>
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
    <object type="Standard - Text" version="0" id="O184">
      <attribute name="obj_pos">
        <point val="2.825,21.0091"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.825,20.8021;12.016,21.0621"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#161;&#202;&#193;&#237;&#179;&#231;&#201;&#188;&#164;&#203;&#164;&#207;&#184;&#248;&#200;&#241;&#201;&#233;&#195;&#180;&#176;&#229;&#206;&#197;&#161;&#166;&#202;&#161;&#187;&#227;&#176;&#229;&#206;&#197;&#164;&#206;&#183;&#239;&#191;&#244;&#164;&#242;&#186;&#198;&#183;&#199;&#164;&#185;&#164;&#235;&#201;&#172;&#205;&#215;&#164;&#207;&#164;&#162;&#164;&#234;&#164;&#222;&#164;&#187;&#164;&#243;&#161;&#163;&#161;&#203;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="2.825,21.0091"/>
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
        <point val="2.825,21.7267"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.825,21.5197;15.955,21.7797"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#222;&#164;&#191;&#161;&#162;&#184;&#169;&#198;&#226;&#184;&#229;&#180;&#252;&#185;&#226;&#206;&#240;&#188;&#212;&#176;&#229;&#206;&#197;&#202;&#172;&#187;&#230;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#185;&#231;&#183;&#215;&#183;&#239;&#191;&#244;&#205;&#243;&#164;&#203;&#164;&#207;&#184;&#169;&#198;&#226;&#202;&#172;&#164;&#206;&#184;&#229;&#180;&#252;&#185;&#226;&#206;&#240;&#188;&#212;&#176;&#229;&#206;&#197;&#164;&#206;&#193;&#237;&#183;&#239;&#191;&#244;&#164;&#242;&#181;&#173;&#186;&#220;&#164;&#183;&#164;&#198;&#164;&#175;&#164;&#192;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="2.825,21.7267"/>
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
        <point val="14.1862,17.4209"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.1862,17.2218;14.6912,17.4718"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#198;&#163;&#196;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="14.1862,17.4209"/>
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
    <object type="Standard - Text" version="0" id="O187">
      <attribute name="obj_pos">
        <point val="15.3346,17.4209"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.3346,17.2218;15.8396,17.4718"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#205;&#163;&#207;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="15.3346,17.4209"/>
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
    <object type="Standard - Text" version="0" id="O188">
      <attribute name="obj_pos">
        <point val="16.2887,17.4209"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.2887,17.2218;17.2987,17.4718"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#195;&#163;&#196;&#161;&#221;&#163;&#210;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="16.2887,17.4209"/>
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
    <object type="Standard - Text" version="0" id="O189">
      <attribute name="obj_pos">
        <point val="2.84587,20.6443"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.84587,20.4373;6.52227,20.6973"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#231;&#183;&#215;&#203;&#231;&#191;&#244;&#164;&#242;&#181;&#173;&#186;&#220;&#164;&#183;&#164;&#198;&#164;&#175;&#164;&#192;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="2.84587,20.6443"/>
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
    <object type="Standard - Text" version="0" id="O190">
      <attribute name="obj_pos">
        <point val="8.98615,9.025"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.53165,8.78611;9.44065,9.08611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#161;&#202;&#181;&#236;&#161;&#203;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="8.98615,9.025"/>
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
    <object type="Standard - Text" version="0" id="O191">
      <attribute name="obj_pos">
        <point val="8.98615,13.2081"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.53165,12.9692;9.44065,13.2692"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#161;&#202;&#181;&#236;&#161;&#203;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="8.98615,13.2081"/>
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
    <object type="Standard - Text" version="0" id="O192">
      <attribute name="obj_pos">
        <point val="8.98615,13.8442"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.53165,13.6053;9.44065,13.9053"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#161;&#202;&#181;&#236;&#161;&#203;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="8.98615,13.8442"/>
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
    <object type="Standard - Text" version="0" id="O193">
      <attribute name="obj_pos">
        <point val="8.98615,14.4272"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.53165,14.1883;9.44065,14.4883"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#161;&#202;&#181;&#236;&#161;&#203;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="8.98615,14.4272"/>
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
    <object type="Standard - Text" version="0" id="O194">
      <attribute name="obj_pos">
        <point val="8.95081,15.0456"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.57206,14.8465;9.32956,15.0965"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#161;&#202;&#181;&#236;&#161;&#203;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="8.95081,15.0456"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O195">
      <attribute name="obj_pos">
        <point val="8.98615,15.6286"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.53165,15.3897;9.44065,15.6897"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#161;&#202;&#181;&#236;&#161;&#203;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="8.98615,15.6286"/>
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
    <object type="Standard - Text" version="0" id="O196">
      <attribute name="obj_pos">
        <point val="8.91548,16.2293"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.53673,16.0302;9.29423,16.2802"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#161;&#202;&#181;&#236;&#161;&#203;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="8.91548,16.2293"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
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
    <object type="Standard - Text" version="0" id="O197">
      <attribute name="obj_pos">
        <point val="2.355,22.5286"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.355,22.3216;16.3253,22.5816"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#180;) &#199;&#222;&#194;&#206;&#188;&#239;&#206;&#224;&#161;&#166;&#203;&#231;&#191;&#244;&#205;&#243;&#164;&#207;&#161;&#162;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#164;&#206;&#197;&#197;&#187;&#210;&#199;&#222;&#194;&#206;&#164;&#203;&#164;&#232;&#164;&#235;&#192;&#193;&#181;&#225;&#164;&#206;&#190;&#236;&#185;&#231;&#161;&#162;&#199;&#222;&#194;&#206;&#164;&#206;&#188;&#239;&#206;&#224;&#164;&#203;&#165;&#222;&#165;&#235;&#164;&#242;&#164;&#183;&#161;&#162;&#203;&#231;&#191;&#244;&#164;&#242;&#181;&#173;&#186;&#220;&#164;&#183;&#164;&#198;&#164;&#175;&#164;&#192;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="2.355,22.5286"/>
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
    <object type="Embed - Text" version="0" id="O198">
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
    <object type="Embed - Text" version="0" id="O199">
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
    <object type="Embed - Text" version="0" id="O200">
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
    <object type="Embed - Text" version="0" id="O201">
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
    <object type="Embed - Text" version="0" id="O202">
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
    <object type="Embed - Text" version="0" id="O203">
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
    <object type="Embed - Text" version="0" id="O204">
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
    <object type="Embed - Text" version="0" id="O205">
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
    <object type="Embed - Text" version="0" id="O206">
      <attribute name="obj_pos">
        <point val="8.4,9.62429"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,9.30577;8.4,9.70577"/>
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
            <point val="8.4,9.62429"/>
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
        <point val="8.4,10.2243"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,9.90578;8.4,10.3058"/>
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
            <point val="8.4,10.2243"/>
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
        <point val="8.4,10.8243"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,10.5058;8.4,10.9058"/>
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
            <point val="8.4,10.8243"/>
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
        <point val="8.4,11.4243"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,11.1058;8.4,11.5058"/>
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
            <point val="8.4,11.4243"/>
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
        <point val="8.4,12.0243"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,11.7058;8.4,12.1058"/>
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
            <point val="8.4,12.0243"/>
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
        <point val="8.4,12.6243"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,12.3058;8.4,12.7058"/>
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
            <point val="8.4,12.6243"/>
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
        <point val="8.4,13.2243"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,12.9058;8.4,13.3058"/>
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
            <point val="8.4,13.2243"/>
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
        <point val="8.4,13.8243"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,13.5058;8.4,13.9058"/>
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
            <point val="8.4,13.8243"/>
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
        <point val="8.4,14.4243"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,14.1058;8.4,14.5058"/>
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
            <point val="8.4,14.4243"/>
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
    <object type="Embed - Text" version="0" id="O215">
      <attribute name="obj_pos">
        <point val="8.4,15.0243"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,14.7058;8.4,15.1058"/>
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
            <point val="8.4,15.0243"/>
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
    <object type="Embed - Text" version="0" id="O216">
      <attribute name="obj_pos">
        <point val="8.4,15.6243"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,15.3058;8.4,15.7058"/>
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
            <point val="8.4,15.6243"/>
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
        <point val="8.4,16.2243"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,15.9058;8.4,16.3058"/>
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
            <point val="8.4,16.2243"/>
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
        <point val="8.4,16.8243"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,16.5058;8.4,16.9058"/>
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
            <point val="8.4,16.8243"/>
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
        <point val="8.4,17.4743"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.188,17.1558;8.4,17.5558"/>
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
            <point val="8.4,17.4743"/>
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
        <point val="18.875,14.7516"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.4206,14.4331;18.875,14.8331"/>
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
            <point val="18.875,14.7516"/>
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
    <object type="Embed - Text" version="0" id="O222">
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
    <object type="Embed - Text" version="0" id="O223">
      <attribute name="obj_pos">
        <point val="8.4122,18.0935"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.2002,17.775;8.4122,18.175"/>
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
            <point val="8.4122,18.0935"/>
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
        <point val="8.4122,18.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.2002,18.3315;8.4122,18.7315"/>
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
            <point val="8.4122,18.65"/>
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
    <object type="Embed - Text" version="0" id="O226">
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
    <object type="Embed - Text" version="0" id="O227">
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
    <object type="Embed - Text" version="0" id="O228">
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
    <object type="Embed - Text" version="0" id="O229">
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
    <object type="Embed - Text" version="0" id="O230">
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
    <object type="Embed - Text" version="0" id="O231">
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
    <object type="Embed - Text" version="0" id="O232">
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
    <object type="Embed - Text" version="0" id="O233">
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
    <object type="Embed - Text" version="0" id="O234">
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
    <object type="Embed - Text" version="0" id="O235">
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
    <object type="Embed - Text" version="0" id="O236">
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
    <object type="Embed - Text" version="0" id="O237">
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
    <object type="Embed - Text" version="0" id="O238">
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
    <object type="Embed - Text" version="0" id="O239">
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
    <object type="Embed - Text" version="0" id="O240">
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
    <object type="Embed - Text" version="0" id="O241">
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
    <object type="Embed - Text" version="0" id="O242">
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
    <object type="Embed - Text" version="0" id="O243">
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
    <object type="Embed - Text" version="0" id="O244">
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
    <object type="Embed - Text" version="0" id="O245">
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
    <object type="Embed - Text" version="0" id="O246">
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
    <object type="Embed - Text" version="0" id="O247">
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
    <object type="Embed - Text" version="0" id="O248">
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
    <object type="Embed - Text" version="0" id="O249">
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
    <object type="Embed - Text" version="0" id="O250">
      <attribute name="obj_pos">
        <point val="14.123,9.02145"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.123,8.78256;15.638,9.08256"/>
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
            <point val="14.123,9.02145"/>
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
    <object type="Embed - Text" version="0" id="O251">
      <attribute name="obj_pos">
        <point val="15.923,9.04645"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.923,8.75978;17.232,9.11978"/>
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
            <point val="15.923,9.04645"/>
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
    <object type="Embed - Text" version="0" id="O252">
      <attribute name="obj_pos">
        <point val="18.923,9.04645"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.711,8.72793;18.923,9.12793"/>
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
            <point val="18.923,9.04645"/>
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
    <object type="Embed - Text" version="0" id="O253">
      <attribute name="obj_pos">
        <point val="18.9004,15.9731"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.446,15.6546;18.9004,16.0546"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#GKENSUK#</string>
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
            <point val="18.9004,15.9731"/>
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
    <object type="Embed - Text" version="0" id="O254">
      <attribute name="obj_pos">
        <point val="18.0201,18.0303"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.0201,17.7118;18.7473,18.1118"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TOKURYO#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#123#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="18.0201,18.0303"/>
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
    <object type="Embed - Text" version="0" id="O255">
      <attribute name="obj_pos">
        <point val="18.0554,18.6472"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.0554,18.3287;18.7826,18.7287"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TOKURYOK#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#123#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="18.0554,18.6472"/>
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
  </layer>
</diagram>
