<?xml version="1.0"?>
<diagram xmlns:dia="http://www.lysator.liu.se/~alla/dia/">
  <dictionarydata>
    <element name="SEIYM" occurs="1">
      <appinfo>
        <embed object="string" length="16"/>
      </appinfo>
    </element>
    <element name="HOSPCD" occurs="1">
      <appinfo>
        <embed object="string" length="10"/>
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
    <element name="TEL" occurs="1">
      <appinfo>
        <embed object="string" length="15"/>
      </appinfo>
    </element>
    <element name="KAISETUNAME" occurs="1">
      <appinfo>
        <embed object="string" length="40"/>
      </appinfo>
    </element>
    <element name="RECEKA" occurs="1">
      <appinfo>
        <embed object="string" length="20"/>
      </appinfo>
    </element>
    <element name="SEIKYU-TBL" occurs="6">
      <element name="KENSU" occurs="1">
        <appinfo>
          <embed object="string" length="6"/>
        </appinfo>
      </element>
      <element name="TENSU" occurs="1">
        <appinfo>
          <embed object="string" length="10"/>
        </appinfo>
      </element>
      <element name="SKENSU" occurs="1">
        <appinfo>
          <embed object="string" length="6"/>
        </appinfo>
      </element>
      <element name="SKINGK" occurs="1">
        <appinfo>
          <embed object="string" length="10"/>
        </appinfo>
      </element>
      <element name="SFTNGK" occurs="1">
        <appinfo>
          <embed object="string" length="9"/>
        </appinfo>
      </element>
    </element>
    <element name="TOKUBETU" occurs="1">
      <appinfo>
        <embed object="string" length="10"/>
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
        <point val="14.2,25.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.185,25.685;19.515,28.915"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="14.2,25.7"/>
      </attribute>
      <attribute name="elem_width">
        <real val="5.3"/>
      </attribute>
      <attribute name="elem_height">
        <real val="3.2"/>
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
        <point val="1.5,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.485,4.585;19.515,15.515"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="1.5,4.6"/>
      </attribute>
      <attribute name="elem_width">
        <real val="18"/>
      </attribute>
      <attribute name="elem_height">
        <real val="10.9"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.03"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O2">
      <attribute name="obj_pos">
        <point val="1.5,16"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.485,15.985;19.515,25.065"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="1.5,16"/>
      </attribute>
      <attribute name="elem_width">
        <real val="18"/>
      </attribute>
      <attribute name="elem_height">
        <real val="9.05"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.03"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O3">
      <attribute name="obj_pos">
        <point val="1.5,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.495,4.595;19.505,4.605"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.5,4.6"/>
        <point val="19.5,4.6"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O1" connection="0"/>
        <connection handle="1" to="O1" connection="2"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O4">
      <attribute name="obj_pos">
        <point val="1.5,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.495,4.595;1.505,15.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.5,4.6"/>
        <point val="1.5,15.5"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O1" connection="0"/>
        <connection handle="1" to="O1" connection="5"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O5">
      <attribute name="obj_pos">
        <point val="1.5,16"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.495,15.995;1.505,25.055"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.5,16"/>
        <point val="1.5,25.05"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O2" connection="0"/>
        <connection handle="1" to="O2" connection="5"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O6">
      <attribute name="obj_pos">
        <point val="4.4,8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.395,7.995;4.405,15.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4.4,8"/>
        <point val="4.4,15.5"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O7">
      <attribute name="obj_pos">
        <point val="6.7,8.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.695,8.795;6.705,15.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.7,8.8"/>
        <point val="6.7,15.5"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O8">
      <attribute name="obj_pos">
        <point val="9.3,8.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.295,8.795;9.305,15.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="9.3,8.8"/>
        <point val="9.3,15.5"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O9">
      <attribute name="obj_pos">
        <point val="11.95,8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.945,7.995;11.955,15.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="11.95,8"/>
        <point val="11.95,15.5"/>
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
        <point val="13.7,8.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.695,8.795;13.705,15.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.7,8.8"/>
        <point val="13.7,15.5"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O11">
      <attribute name="obj_pos">
        <point val="17.1,8.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.095,8.795;17.105,15.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.1,8.8"/>
        <point val="17.1,15.5"/>
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
        <point val="4.4,16"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.395,15.995;4.405,25.055"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4.4,16"/>
        <point val="4.4,25.05"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O13">
      <attribute name="obj_pos">
        <point val="6.7,16.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.695,16.795;6.705,25.055"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.7,16.8"/>
        <point val="6.7,25.05"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O14">
      <attribute name="obj_pos">
        <point val="9.3,16.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.295,16.795;9.305,25.055"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="9.3,16.8"/>
        <point val="9.3,25.05"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O15">
      <attribute name="obj_pos">
        <point val="11.95,16"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.945,15.995;11.955,25.055"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="11.95,16"/>
        <point val="11.95,25.05"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O16">
      <attribute name="obj_pos">
        <point val="13.7,16.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.695,16.795;13.705,25.055"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.7,16.8"/>
        <point val="13.7,25.05"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O17">
      <attribute name="obj_pos">
        <point val="17.1,16.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.095,16.795;17.105,25.055"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.1,16.8"/>
        <point val="17.1,25.05"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O18">
      <attribute name="obj_pos">
        <point val="1.5,8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.495,7.995;19.505,8.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.5,8"/>
        <point val="19.5,8"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O19">
      <attribute name="obj_pos">
        <point val="2.4,11.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.395,11.495;19.505,11.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.4,11.5"/>
        <point val="19.5,11.5"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O20">
      <attribute name="obj_pos">
        <point val="3.15,10.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.145,10.495;19.505,10.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.15,10.5"/>
        <point val="19.5,10.5"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O21">
      <attribute name="obj_pos">
        <point val="1.5,9.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.495,9.495;19.505,9.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.5,9.5"/>
        <point val="19.5,9.5"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O22">
      <attribute name="obj_pos">
        <point val="4.4,8.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.395,8.795;19.505,8.805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4.4,8.8"/>
        <point val="19.5,8.8"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O23">
      <attribute name="obj_pos">
        <point val="10.6,3.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.585,3.485;19.515,3.515"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.6,3.5"/>
        <point val="19.5,3.5"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O24">
      <attribute name="obj_pos">
        <point val="2.4,9.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.395,9.495;2.405,15.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.4,9.5"/>
        <point val="2.4,15.5"/>
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
        <point val="4.4,16.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.395,16.795;19.505,16.805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4.4,16.8"/>
        <point val="19.5,16.8"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O26">
      <attribute name="obj_pos">
        <point val="3.2,18.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.195,18.245;19.505,18.255"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.2,18.25"/>
        <point val="19.5,18.25"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O27">
      <attribute name="obj_pos">
        <point val="2.4,19"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.395,18.995;19.5145,19.0054"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.4,19"/>
        <point val="19.5095,19.0004"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O28">
      <attribute name="obj_pos">
        <point val="3.2,19.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.195,19.745;19.505,19.755"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.2,19.75"/>
        <point val="19.5,19.75"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O29">
      <attribute name="obj_pos">
        <point val="1.5,17.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.495,17.4928;19.4999,17.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.5,17.5"/>
        <point val="19.4949,17.4978"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O30">
      <attribute name="obj_pos">
        <point val="2.4,20.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.395,20.495;19.505,20.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.4,20.5"/>
        <point val="19.5,20.5"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O31">
      <attribute name="obj_pos">
        <point val="3.2,21.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.195,21.245;19.505,21.255"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.2,21.25"/>
        <point val="19.5,21.25"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O32">
      <attribute name="obj_pos">
        <point val="3.2,22.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.195,22.694;19.4793,22.705"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.2,22.7"/>
        <point val="19.4743,22.699"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O33">
      <attribute name="obj_pos">
        <point val="1.5,23.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.495,23.4897;19.5025,23.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.5,23.5"/>
        <point val="19.4975,23.4947"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O34">
      <attribute name="obj_pos">
        <point val="3.2,24.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.195,24.295;19.505,24.305"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.2,24.3"/>
        <point val="19.5,24.3"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O35">
      <attribute name="obj_pos">
        <point val="2.4,22"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.395,21.995;19.4998,22.008"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.4,22"/>
        <point val="19.4948,22.003"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O36">
      <attribute name="obj_pos">
        <point val="2.4,17.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.395,17.495;2.405,23.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.4,17.5"/>
        <point val="2.4,23.5"/>
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
        <point val="3.2,17.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.195,17.495;3.205,25.055"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.2,17.5"/>
        <point val="3.2,25.05"/>
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
        <point val="1.5,23.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.495,23.545;19.505,23.555"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.5,23.55"/>
        <point val="19.5,23.55"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O39">
      <attribute name="obj_pos">
        <point val="10.6,3.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.585,3.485;10.615,4.615"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.6,3.5"/>
        <point val="10.6,4.6"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O40">
      <attribute name="obj_pos">
        <point val="14.9,27.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.895,27.295;15.605,27.305"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.9,27.3"/>
        <point val="15.6,27.3"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O41" connection="0"/>
        <connection handle="1" to="O42" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O41">
      <attribute name="obj_pos">
        <point val="14.9,25.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.895,25.695;14.905,28.905"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.9,25.7"/>
        <point val="14.9,28.9"/>
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
        <point val="15.6,25.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.595,25.695;15.605,28.905"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.6,25.7"/>
        <point val="15.6,28.9"/>
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
        <point val="14.9,26.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.895,26.4925;15.575,26.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.9,26.5"/>
        <point val="15.57,26.4975"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O44">
      <attribute name="obj_pos">
        <point val="14.9,28.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.895,28.0925;15.575,28.105"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.9,28.1"/>
        <point val="15.57,28.0975"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O45">
      <attribute name="obj_pos">
        <point val="3.15,12.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.145,12.495;19.505,12.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.15,12.5"/>
        <point val="19.5,12.5"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O49" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O46">
      <attribute name="obj_pos">
        <point val="19.5,3.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="19.485,3.485;19.515,4.615"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="19.5,3.5"/>
        <point val="19.5,4.6"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
      <connections>
        <connection handle="1" to="O1" connection="2"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O47">
      <attribute name="obj_pos">
        <point val="2.4,13.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.395,13.495;19.505,13.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.4,13.5"/>
        <point val="19.5,13.5"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O48">
      <attribute name="obj_pos">
        <point val="3.15,14.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.145,14.495;19.505,14.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.15,14.5"/>
        <point val="19.5,14.5"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_color">
        <color val="#010001"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O49">
      <attribute name="obj_pos">
        <point val="3.15,9.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.145,9.495;3.155,15.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.15,9.5"/>
        <point val="3.15,15.5"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
  </layer>
  <layer name="&#202;&#184;&#187;&#250;" visible="true">
    <object type="Standard - Text" version="0" id="O50">
      <attribute name="obj_pos">
        <point val="7.36481,5.29998"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.36481,4.98146;14.7176,5.38146"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#241;&#204;&#177;&#183;&#242;&#185;&#175;&#202;&#221;&#184;&#177;&#197;&#249;&#191;&#199;&#206;&#197;&#202;&#243;&#189;&#183;&#193;&#237;&#179;&#231;&#201;&#188;(&#176;&#229;&#161;&#166;&#187;&#245;)#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="7.36481,5.29998"/>
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
    <object type="Standard - Text" version="0" id="O51">
      <attribute name="obj_pos">
        <point val="10.914,4.02463"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.914,3.74593;12.328,4.44593"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#229;&#206;&#197;&#181;&#161;&#180;&#216;
&#165;&#179;&#161;&#188;&#165;&#201;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="10.914,4.02463"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O52">
      <attribute name="obj_pos">
        <point val="4.8,7.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.8,7.2213;5.1535,7.5713"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="4.8,7.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O53">
      <attribute name="obj_pos">
        <point val="7.82872,6.01382"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.82872,5.73512;10.3032,6.43512"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#176;&#229;&#206;&#197;&#181;&#161;&#180;&#216;&#164;&#206;
&#189;&#234;&#186;&#223;&#195;&#207;&#181;&#218;&#164;&#211;&#204;&#190;&#190;&#206;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="7.82872,6.01382"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O54">
      <attribute name="obj_pos">
        <point val="7.82872,7.18095"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.82872,6.90225;9.24272,7.25225"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="7.82872,7.18095"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O55">
      <attribute name="obj_pos">
        <point val="7.82872,7.70012"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.82872,7.42142;9.59622,7.77142"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="7.82872,7.70012"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O56">
      <attribute name="obj_pos">
        <point val="2.404,8.868"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.404,8.5893;3.5352,8.9393"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#182;&#232;  &#202;&#172;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="2.404,8.868"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O57">
      <attribute name="obj_pos">
        <point val="6.25144,8.55639"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.25144,8.27769;10.5641,8.62769"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="6.25144,8.55639"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O58">
      <attribute name="obj_pos">
        <point val="13.3766,8.55639"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.3766,8.27769;18.2549,8.62769"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#191;&#169; &#187;&#246; &#206;&#197; &#205;&#220; &#161;&#166; &#192;&#184; &#179;&#232; &#206;&#197; &#205;&#220;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="13.3766,8.55639"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O59">
      <attribute name="obj_pos">
        <point val="4.83002,9.28124"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.83002,9.00254;6.31472,9.35254"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#237; &#183;&#239; &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="4.83002,9.28124"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O60">
      <attribute name="obj_pos">
        <point val="7.22699,9.28124"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.22699,9.00254;8.71169,9.35254"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#237; &#197;&#192; &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="7.22699,9.28124"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O61">
      <attribute name="obj_pos">
        <point val="9.79874,9.28124"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.79874,9.00254;11.2834,9.35254"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#162;&#168; &#200;&#247; &#185;&#205;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.79874,9.28124"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O62">
      <attribute name="obj_pos">
        <point val="12.398,9.28124"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.398,9.00254;13.3171,9.35254"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.398,9.28124"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O63">
      <attribute name="obj_pos">
        <point val="14.4833,9.29724"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.4833,9.01854;16.4629,9.36854"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#182;&#226;      &#179;&#219;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="14.4833,9.29724"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O64">
      <attribute name="obj_pos">
        <point val="17.4875,9.28124"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.4875,9.00254;19.255,9.35254"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.4875,9.28124"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O65">
      <attribute name="obj_pos">
        <point val="1.7965,11.9157"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.7965,11.637;2.15,13.387"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#192;&#193;



&#181;&#225;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="1.7965,11.9157"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O66">
      <attribute name="obj_pos">
        <point val="5.0223,17.2822"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.0223,17.0035;6.1535,17.3535"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#239;  &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="5.0223,17.2822"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O67">
      <attribute name="obj_pos">
        <point val="7.37383,17.2822"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.37383,17.0035;8.50503,17.3535"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#192;  &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="7.37383,17.2822"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O68">
      <attribute name="obj_pos">
        <point val="9.96006,17.2822"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.96006,17.0035;11.0913,17.3535"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.96006,17.2822"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O69">
      <attribute name="obj_pos">
        <point val="12.2367,17.2822"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.2367,17.0035;13.3679,17.3535"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#239;  &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.2367,17.2822"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O70">
      <attribute name="obj_pos">
        <point val="14.7615,17.2822"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.7615,17.0035;15.8927,17.3535"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#182;&#226;  &#179;&#219;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="14.7615,17.2822"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O71">
      <attribute name="obj_pos">
        <point val="17.4566,17.2822"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.4566,17.0035;19.2241,17.3535"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.4566,17.2822"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O72">
      <attribute name="obj_pos">
        <point val="2.24,16.88"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.24,16.6013;3.5833,16.9513"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#182;&#232;   &#202;&#172;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="2.24,16.88"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O73">
      <attribute name="obj_pos">
        <point val="2.16945,24.0582"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.16945,23.7795;2.52295,24.8295"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#162;&#168;
&#183;&#232;
&#196;&#234;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="2.16945,24.0582"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O74">
      <attribute name="obj_pos">
        <point val="6.55731,16.512"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.55731,16.2333;10.0216,16.5833"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#206;&#197;  &#205;&#220;  &#164;&#206;  &#181;&#235;  &#201;&#213;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="6.55731,16.512"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O75">
      <attribute name="obj_pos">
        <point val="3.34969,17.9622"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.34969,17.6835;4.26879,18.0335"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254; &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.34969,17.9622"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O76">
      <attribute name="obj_pos">
        <point val="3.26889,18.7369"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.26889,18.4582;4.32939,18.8082"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.26889,18.7369"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O77">
      <attribute name="obj_pos">
        <point val="3.34969,19.4343"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.34969,19.1556;4.26879,19.5056"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254; &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.34969,19.4343"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O78">
      <attribute name="obj_pos">
        <point val="3.26889,20.2464"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.26889,19.9677;4.32939,20.3177"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.26889,20.2464"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O79">
      <attribute name="obj_pos">
        <point val="3.34969,20.935"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.34969,20.6563;4.26879,21.0063"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254; &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.34969,20.935"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O80">
      <attribute name="obj_pos">
        <point val="3.26889,21.7472"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.26889,21.4685;4.32939,21.8185"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.26889,21.7472"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O81">
      <attribute name="obj_pos">
        <point val="3.34969,22.4181"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.34969,22.1394;4.26879,22.4894"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254; &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.34969,22.4181"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O82">
      <attribute name="obj_pos">
        <point val="3.26889,23.2302"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.26889,22.9515;4.32939,23.3015"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.26889,23.2302"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O83">
      <attribute name="obj_pos">
        <point val="3.332,24.036"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.332,23.7573;4.2511,24.1073"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254; &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.332,24.036"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O84">
      <attribute name="obj_pos">
        <point val="3.3,24.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.3,24.5213;4.3605,24.8713"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.3,24.8"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O85">
      <attribute name="obj_pos">
        <point val="1.752,18.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.752,18.2213;2.1055,22.4213"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#162;&#168;

&#191;&#179;


&#186;&#186;


&#190;&#245;


&#182;&#183;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="1.752,18.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O86">
      <attribute name="obj_pos">
        <point val="2.62037,18.0134"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.62037,17.7347;2.97387,18.7847"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#214;

&#204;&#225;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="2.62037,18.0134"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O87">
      <attribute name="obj_pos">
        <point val="2.60437,19.4951"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.60437,19.2164;2.95787,20.2664"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#253;

&#197;&#192;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="2.60437,19.4951"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O88">
      <attribute name="obj_pos">
        <point val="2.60437,21.0099"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.60437,20.7312;2.95787,21.7812"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#186;

&#197;&#192;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="2.60437,21.0099"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O89">
      <attribute name="obj_pos">
        <point val="2.62037,22.5235"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.62037,22.2448;2.97387,23.2948"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#237;

&#187;&#187;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="2.62037,22.5235"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O90">
      <attribute name="obj_pos">
        <point val="2.79684,25.741"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.79684,25.4623;7.74584,25.8123"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#162;&#168;&#205;&#243;&#164;&#203;&#164;&#207;&#181;&#173;&#198;&#254;&#164;&#183;&#164;&#202;&#164;&#164;&#164;&#199;&#178;&#188;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="2.79684,25.741"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O91">
      <attribute name="obj_pos">
        <point val="14.5782,26.2818"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.4015,26.0031;14.755,28.4531"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#162;&#168;

&#188;&#245;

&#201;&#213;

&#176;&#245;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="14.5782,26.2818"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O92">
      <attribute name="obj_pos">
        <point val="15.2313,26.1845"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.0545,25.9058;15.408,26.2558"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#187;&#253;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="15.2313,26.1845"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O93">
      <attribute name="obj_pos">
        <point val="15.2313,27.032"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.0545,26.7533;15.408,27.1033"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#201;&#225;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="15.2313,27.032"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O94">
      <attribute name="obj_pos">
        <point val="15.2313,27.8265"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.0545,27.5478;15.408,27.8978"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#194;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="15.2313,27.8265"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O95">
      <attribute name="obj_pos">
        <point val="15.2313,28.5857"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.0545,28.307;15.408,28.657"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#189;&#241;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="15.2313,28.5857"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="1"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O96">
      <attribute name="obj_pos">
        <point val="13.0723,5.39272"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.0723,4.83531;13.7793,5.53531"/>
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
            <real val="0.7"/>
          </attribute>
          <attribute name="pos">
            <point val="13.0723,5.39272"/>
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
    <object type="Standard - Text" version="0" id="O97">
      <attribute name="obj_pos">
        <point val="13.3411,16.5106"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.3411,16.2319;18.2194,16.5819"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#191;&#169; &#187;&#246; &#206;&#197; &#205;&#220; &#161;&#166; &#192;&#184; &#179;&#232; &#206;&#197; &#205;&#220;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="13.3411,16.5106"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O98">
      <attribute name="obj_pos">
        <point val="3.3308,10.1253"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.3308,9.8466;4.2499,10.1966"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254; &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.3308,10.1253"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O99">
      <attribute name="obj_pos">
        <point val="3.25,11.0905"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.25,10.8118;4.3105,11.1618"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.25,11.0905"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O100">
      <attribute name="obj_pos">
        <point val="3.3308,12.1348"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.3308,11.8561;4.2499,12.2061"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254; &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.3308,12.1348"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O101">
      <attribute name="obj_pos">
        <point val="3.25,13.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.25,12.8213;4.3105,13.1713"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.25,13.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O102">
      <attribute name="obj_pos">
        <point val="3.3308,14.1348"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.3308,13.8561;4.2499,14.2061"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254; &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.3308,14.1348"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O103">
      <attribute name="obj_pos">
        <point val="3.25,15.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.25,14.8213;4.3105,15.1713"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.25,15.1"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O104">
      <attribute name="obj_pos">
        <point val="2.65,9.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.65,9.60093;2.9025,11.3509"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#229;
&#180;&#252;
&#185;&#226;
&#206;&#240;
&#188;&#212;
&#176;&#229;
&#206;&#197;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="2.65,9.8"/>
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
    <object type="Standard - Text" version="0" id="O105">
      <attribute name="obj_pos">
        <point val="2.6,12.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.6,12.0213;2.9535,13.0713"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#241;

&#202;&#221;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="2.6,12.3"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O106">
      <attribute name="obj_pos">
        <point val="2.6,14.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.6,13.9213;2.9535,14.9713"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#231;

&#183;&#215;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="2.6,14.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O107">
      <attribute name="obj_pos">
        <point val="2.1,3.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.1,2.9213;3.8675,3.2713"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#205;&#205;&#188;&#176;&#194;&#232;&#163;&#177;&#185;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="2.1,3.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
  </layer>
  <layer name="&#186;&#185;&#164;&#183;&#185;&#254;&#164;&#223;" visible="true">
    <object type="Embed - Text" version="0" id="O108">
      <attribute name="obj_pos">
        <point val="4.8,7.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.5376,7.2213;4.8,7.5713"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="4.8,7.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
          </attribute>
          <attribute name="single">
            <real val="0.2121"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O109">
      <attribute name="obj_pos">
        <point val="13.4,4.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.4,3.74259;17.642,4.44259"/>
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
            <real val="0.7"/>
          </attribute>
          <attribute name="pos">
            <point val="13.4,4.3"/>
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
    <object type="Embed - Text" version="0" id="O110">
      <attribute name="obj_pos">
        <point val="10.5,5.8022"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5,5.56331;18.075,6.16331"/>
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
            <point val="10.5,5.8022"/>
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
    <object type="Embed - Text" version="0" id="O111">
      <attribute name="obj_pos">
        <point val="10.5,6.43208"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5,6.19319;16.56,6.79319"/>
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
            <point val="10.5,6.43208"/>
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
    <object type="Embed - Text" version="0" id="O112">
      <attribute name="obj_pos">
        <point val="10.468,7.69361"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.468,7.37509;18.548,7.77509"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KAISETUNAME#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.468,7.69361"/>
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
    <object type="Embed - Text" version="0" id="O113">
      <attribute name="obj_pos">
        <point val="10.4977,7.18129"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.4977,6.86277;14.1337,7.26277"/>
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
            <point val="10.4977,7.18129"/>
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
    <object type="Embed - Text" version="0" id="O114">
      <attribute name="obj_pos">
        <point val="2.57314,6.825"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.57314,6.58611;5.60314,6.88611"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RECEKA#</string>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.57314,6.825"/>
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
    <group>
      <object type="Embed - Text" version="0" id="O115">
        <attribute name="obj_pos">
          <point val="6.302,10.116"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="4.8476,9.79748;6.302,10.1975"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[0].KENSU#</string>
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
              <point val="6.302,10.116"/>
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
      <object type="Embed - Text" version="0" id="O116">
        <attribute name="obj_pos">
          <point val="9.214,10.116"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="6.79,9.79748;9.214,10.1975"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[0].TENSU#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="9.214,10.116"/>
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
      <object type="Embed - Text" version="0" id="O117">
        <attribute name="obj_pos">
          <point val="13.548,10.116"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="12.0936,9.79748;13.548,10.1975"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[0].SKENSU#</string>
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
              <point val="13.548,10.116"/>
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
      <object type="Embed - Text" version="0" id="O118">
        <attribute name="obj_pos">
          <point val="16.674,10.116"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="14.25,9.79748;16.674,10.1975"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[0].SKINGK#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="16.674,10.116"/>
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
      <object type="Embed - Text" version="0" id="O119">
        <attribute name="obj_pos">
          <point val="19.384,10.116"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="17.2024,9.79748;19.384,10.1975"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[0].SFTNGK#</string>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="19.384,10.116"/>
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
    </group>
    <group>
      <object type="Embed - Text" version="0" id="O120">
        <attribute name="obj_pos">
          <point val="6.302,11.1089"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="4.8476,10.7904;6.302,11.1904"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[1].KENSU#</string>
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
              <point val="6.302,11.1089"/>
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
      <object type="Embed - Text" version="0" id="O121">
        <attribute name="obj_pos">
          <point val="9.214,11.1089"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="6.79,10.7904;9.214,11.1904"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[1].TENSU#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="9.214,11.1089"/>
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
      <object type="Embed - Text" version="0" id="O122">
        <attribute name="obj_pos">
          <point val="13.548,11.1089"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="12.0936,10.7904;13.548,11.1904"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[1].SKENSU#</string>
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
              <point val="13.548,11.1089"/>
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
      <object type="Embed - Text" version="0" id="O123">
        <attribute name="obj_pos">
          <point val="16.674,11.1089"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="14.25,10.7904;16.674,11.1904"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[1].SKINGK#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="16.674,11.1089"/>
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
      <object type="Embed - Text" version="0" id="O124">
        <attribute name="obj_pos">
          <point val="19.384,11.1089"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="17.2024,10.7904;19.384,11.1904"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[1].SFTNGK#</string>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="19.384,11.1089"/>
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
    </group>
    <group>
      <object type="Embed - Text" version="0" id="O125">
        <attribute name="obj_pos">
          <point val="6.302,12.1169"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="4.8476,11.7984;6.302,12.1984"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[2].KENSU#</string>
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
              <point val="6.302,12.1169"/>
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
      <object type="Embed - Text" version="0" id="O126">
        <attribute name="obj_pos">
          <point val="9.214,12.1169"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="6.79,11.7984;9.214,12.1984"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[2].TENSU#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="9.214,12.1169"/>
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
      <object type="Embed - Text" version="0" id="O127">
        <attribute name="obj_pos">
          <point val="13.548,12.1169"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="12.0936,11.7984;13.548,12.1984"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[2].SKENSU#</string>
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
              <point val="13.548,12.1169"/>
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
      <object type="Embed - Text" version="0" id="O128">
        <attribute name="obj_pos">
          <point val="16.674,12.1169"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="14.25,11.7984;16.674,12.1984"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[2].SKINGK#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="16.674,12.1169"/>
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
      <object type="Embed - Text" version="0" id="O129">
        <attribute name="obj_pos">
          <point val="19.384,12.1169"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="17.2024,11.7984;19.384,12.1984"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[2].SFTNGK#</string>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="19.384,12.1169"/>
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
    </group>
    <group>
      <object type="Embed - Text" version="0" id="O130">
        <attribute name="obj_pos">
          <point val="6.302,13.1089"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="4.8476,12.7904;6.302,13.1904"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[3].KENSU#</string>
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
              <point val="6.302,13.1089"/>
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
      <object type="Embed - Text" version="0" id="O131">
        <attribute name="obj_pos">
          <point val="9.214,13.1089"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="6.79,12.7904;9.214,13.1904"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[3].TENSU#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="9.214,13.1089"/>
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
      <object type="Embed - Text" version="0" id="O132">
        <attribute name="obj_pos">
          <point val="13.548,13.1089"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="12.0936,12.7904;13.548,13.1904"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[3].SKENSU#</string>
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
              <point val="13.548,13.1089"/>
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
      <object type="Embed - Text" version="0" id="O133">
        <attribute name="obj_pos">
          <point val="16.674,13.1089"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="14.25,12.7904;16.674,13.1904"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[3].SKINGK#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="16.674,13.1089"/>
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
      <object type="Embed - Text" version="0" id="O134">
        <attribute name="obj_pos">
          <point val="19.384,13.1089"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="17.2024,12.7904;19.384,13.1904"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[3].SFTNGK#</string>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="19.384,13.1089"/>
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
    </group>
    <group>
      <object type="Embed - Text" version="0" id="O135">
        <attribute name="obj_pos">
          <point val="6.302,14.1169"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="4.8476,13.7984;6.302,14.1984"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[4].KENSU#</string>
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
              <point val="6.302,14.1169"/>
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
      <object type="Embed - Text" version="0" id="O136">
        <attribute name="obj_pos">
          <point val="9.214,14.1169"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="6.79,13.7984;9.214,14.1984"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[4].TENSU#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="9.214,14.1169"/>
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
      <object type="Embed - Text" version="0" id="O137">
        <attribute name="obj_pos">
          <point val="13.548,14.1169"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="12.0936,13.7984;13.548,14.1984"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[4].SKENSU#</string>
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
              <point val="13.548,14.1169"/>
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
      <object type="Embed - Text" version="0" id="O138">
        <attribute name="obj_pos">
          <point val="16.674,14.1169"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="14.25,13.7984;16.674,14.1984"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[4].SKINGK#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="16.674,14.1169"/>
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
      <object type="Embed - Text" version="0" id="O139">
        <attribute name="obj_pos">
          <point val="19.384,14.1169"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="17.2024,13.7984;19.384,14.1984"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[4].SFTNGK#</string>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="19.384,14.1169"/>
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
    </group>
    <group>
      <object type="Embed - Text" version="0" id="O140">
        <attribute name="obj_pos">
          <point val="6.302,15.1089"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="4.8476,14.7904;6.302,15.1904"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[5].KENSU#</string>
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
              <point val="6.302,15.1089"/>
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
      <object type="Embed - Text" version="0" id="O141">
        <attribute name="obj_pos">
          <point val="9.214,15.1089"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="6.79,14.7904;9.214,15.1904"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[5].TENSU#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="9.214,15.1089"/>
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
      <object type="Embed - Text" version="0" id="O142">
        <attribute name="obj_pos">
          <point val="13.548,15.1089"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="12.0936,14.7904;13.548,15.1904"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[5].SKENSU#</string>
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
              <point val="13.548,15.1089"/>
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
      <object type="Embed - Text" version="0" id="O143">
        <attribute name="obj_pos">
          <point val="16.674,15.1089"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="14.25,14.7904;16.674,15.1904"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[5].SKINGK#</string>
        </attribute>
        <attribute name="embed_text_string">
          <enum val="0"/>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="16.674,15.1089"/>
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
      <object type="Embed - Text" version="0" id="O144">
        <attribute name="obj_pos">
          <point val="19.384,15.1089"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="17.2024,14.7904;19.384,15.1904"/>
        </attribute>
        <attribute name="dnode_path">
          <string>#SEIKYU-TBL[5].SFTNGK#</string>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="19.384,15.1089"/>
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
    </group>
    <object type="Embed - Text" version="0" id="O145">
      <attribute name="obj_pos">
        <point val="9.66997,3.20038"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.66997,2.88186;11.69,3.28186"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="9.66997,3.20038"/>
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
