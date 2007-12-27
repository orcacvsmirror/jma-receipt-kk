<?xml version="1.0"?>
<diagram xmlns:dia="http://www.lysator.liu.se/~alla/dia/">
  <dictionarydata>
    <element name="SRYYY" occurs="1">
      <appinfo>
        <embed object="string" length="4"/>
      </appinfo>
    </element>
    <element name="SRYMM" occurs="1">
      <appinfo>
        <embed object="string" length="4"/>
      </appinfo>
    </element>
    <element name="HOSPCD" occurs="1">
      <appinfo>
        <embed object="string" length="14"/>
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
        <embed object="string" length="30"/>
      </appinfo>
    </element>
    <element name="MAISU" occurs="4">
      <appinfo>
        <embed object="string" length="5"/>
      </appinfo>
    </element>
    <element name="KINGK" occurs="4">
      <appinfo>
        <embed object="string" length="9"/>
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
        <point val="6.5,11.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.49,11.29;18.51,17.31"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="6.5,11.3"/>
      </attribute>
      <attribute name="elem_width">
        <real val="12"/>
      </attribute>
      <attribute name="elem_height">
        <real val="6"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O1">
      <attribute name="obj_pos">
        <point val="2.5,24.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,24.49;18.51,28.11"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="2.5,24.5"/>
      </attribute>
      <attribute name="elem_width">
        <real val="16"/>
      </attribute>
      <attribute name="elem_height">
        <real val="3.6"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O2">
      <attribute name="obj_pos">
        <point val="9.5,7.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.49,7.29;18.51,10.81"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="9.5,7.3"/>
      </attribute>
      <attribute name="elem_width">
        <real val="9"/>
      </attribute>
      <attribute name="elem_height">
        <real val="3.5"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O3">
      <attribute name="obj_pos">
        <point val="12.9,2.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.895,2.595;18.505,3.805"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="12.9,2.6"/>
      </attribute>
      <attribute name="elem_width">
        <real val="5.6"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1.2"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O4">
      <attribute name="obj_pos">
        <point val="12.9,3.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.895,3.195;18.505,3.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.9,3.2"/>
        <point val="18.5,3.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O3" connection="3"/>
        <connection handle="1" to="O3" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O5">
      <attribute name="obj_pos">
        <point val="15.7,3.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.695,3.195;15.705,3.805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.7,3.2"/>
        <point val="15.7,3.8"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O4" connection="0"/>
        <connection handle="1" to="O3" connection="6"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O6">
      <attribute name="obj_pos">
        <point val="14.3,3.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.295,3.195;14.305,3.805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.3,3.2"/>
        <point val="14.3,3.8"/>
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
        <point val="13.6,2.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.595,2.595;13.605,3.805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.6,2.6"/>
        <point val="13.6,3.8"/>
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
        <point val="15,2.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.995,2.595;15.005,3.805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15,2.6"/>
        <point val="15,3.8"/>
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
        <point val="17.1,3.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.095,3.195;17.105,3.805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.1,3.2"/>
        <point val="17.1,3.8"/>
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
        <point val="16.4,2.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.395,2.595;16.405,3.805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="16.4,2.6"/>
        <point val="16.4,3.8"/>
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
        <point val="17.8,3.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.795,3.195;17.805,3.805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.8,3.2"/>
        <point val="17.8,3.8"/>
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
        <point val="9.5,7.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.495,7.895;18.505,7.905"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="9.5,7.9"/>
        <point val="18.5,7.9"/>
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
        <point val="9.5,8.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.495,8.495;18.505,8.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="9.5,8.5"/>
        <point val="18.5,8.5"/>
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
        <point val="12.1,8.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.095,8.495;12.105,10.805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.1,8.5"/>
        <point val="12.1,10.8"/>
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
        <point val="13.6,7.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.595,7.295;13.605,8.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.6,7.3"/>
        <point val="13.6,8.5"/>
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
        <point val="13.6,7.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.595,7.295;13.605,7.905"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.6,7.3"/>
        <point val="13.6,7.9"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="1" to="O15" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O17">
      <attribute name="obj_pos">
        <point val="15.7,7.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.695,7.295;15.705,7.905"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.7,7.3"/>
        <point val="15.7,7.9"/>
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
        <point val="17.8,7.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.795,7.295;17.805,7.905"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.8,7.3"/>
        <point val="17.8,7.9"/>
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
        <point val="7.7,11.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.695,11.295;7.705,17.305"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="7.7,11.3"/>
        <point val="7.7,17.3"/>
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
        <point val="12,11.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.995,11.295;12.005,17.305"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12,11.3"/>
        <point val="12,17.3"/>
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
        <point val="14.6,11.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.595,11.295;14.605,17.305"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.6,11.3"/>
        <point val="14.6,17.3"/>
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
        <point val="18.5,25.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.495,25.695;18.505,25.705"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="18.5,25.7"/>
        <point val="2.5,25.7"/>
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
        <point val="6.5,12.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.495,12.495;18.505,12.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.5,12.5"/>
        <point val="18.5,12.5"/>
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
        <point val="6.5,11.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.495,11.295;15.505,11.305"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.5,11.3"/>
        <point val="15.5,11.3"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O0" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O25">
      <attribute name="obj_pos">
        <point val="6.5,13.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.495,13.695;18.505,13.705"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.5,13.7"/>
        <point val="18.5,13.7"/>
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
        <point val="6.5,14.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.495,14.895;18.505,14.905"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.5,14.9"/>
        <point val="18.5,14.9"/>
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
        <point val="6.5,16.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.495,16.095;18.505,16.105"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.5,16.1"/>
        <point val="18.5,16.1"/>
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
        <point val="4.3,24.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.295,24.495;4.305,28.105"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4.3,24.5"/>
        <point val="4.3,28.1"/>
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
        <point val="18.5,26.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.495,26.895;18.505,26.905"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="18.5,26.9"/>
        <point val="2.5,26.9"/>
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
        <point val="18.5,26.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.495,26.295;18.505,26.305"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="18.5,26.3"/>
        <point val="2.5,26.3"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O1" connection="4"/>
        <connection handle="1" to="O1" connection="3"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O31">
      <attribute name="obj_pos">
        <point val="18.5,27.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.495,27.495;18.505,27.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="18.5,27.5"/>
        <point val="2.5,27.5"/>
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
        <point val="9.1,24.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.095,24.495;9.105,28.105"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="9.1,24.5"/>
        <point val="9.1,28.1"/>
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
        <point val="12.3,24.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.295,24.495;12.305,28.105"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.3,24.5"/>
        <point val="12.3,28.1"/>
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
        <point val="16.7,24.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.695,24.495;16.705,28.105"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="16.7,24.5"/>
        <point val="16.7,28.1"/>
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
        <point val="6.7,25.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.695,25.695;6.705,28.105"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.7,25.7"/>
        <point val="6.7,28.1"/>
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
        <point val="5.5,25.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.495,25.695;5.505,28.105"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.5,25.7"/>
        <point val="5.5,28.1"/>
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
        <point val="8.5,25.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.495,25.695;8.505,28.105"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="8.5,25.7"/>
        <point val="8.5,28.1"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <group>
      <object type="Standard - Line" version="0" id="O38">
        <attribute name="obj_pos">
          <point val="4.9,25.7"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="4.895,25.695;4.905,28.105"/>
        </attribute>
        <attribute name="conn_endpoints">
          <point val="4.9,25.7"/>
          <point val="4.9,28.1"/>
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
      <object type="Standard - Line" version="0" id="O39">
        <attribute name="obj_pos">
          <point val="6.1,25.7"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="6.095,25.695;6.105,28.105"/>
        </attribute>
        <attribute name="conn_endpoints">
          <point val="6.1,25.7"/>
          <point val="6.1,28.1"/>
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
      <object type="Standard - Line" version="0" id="O40">
        <attribute name="obj_pos">
          <point val="7.9,25.7"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="7.895,25.695;7.905,28.105"/>
        </attribute>
        <attribute name="conn_endpoints">
          <point val="7.9,25.7"/>
          <point val="7.9,28.1"/>
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
      <object type="Standard - Line" version="0" id="O41">
        <attribute name="obj_pos">
          <point val="7.3,25.7"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="7.295,25.695;7.305,28.105"/>
        </attribute>
        <attribute name="conn_endpoints">
          <point val="7.3,25.7"/>
          <point val="7.3,28.1"/>
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
    </group>
    <object type="Standard - Box" version="0" id="O42">
      <attribute name="obj_pos">
        <point val="8.7,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.69,4.59;9.71,5.31"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="8.7,4.6"/>
      </attribute>
      <attribute name="elem_width">
        <real val="1"/>
      </attribute>
      <attribute name="elem_height">
        <real val="0.7"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O43">
      <attribute name="obj_pos">
        <point val="10.5,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.49,4.59;11.51,5.31"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="10.5,4.6"/>
      </attribute>
      <attribute name="elem_width">
        <real val="1"/>
      </attribute>
      <attribute name="elem_height">
        <real val="0.7"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O44">
      <attribute name="obj_pos">
        <point val="14.3,7.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.295,7.295;14.305,7.905"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.3,7.3"/>
        <point val="14.3,7.9"/>
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
    <object type="Standard - Line" version="0" id="O45">
      <attribute name="obj_pos">
        <point val="15,7.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.995,7.295;15.005,7.905"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15,7.3"/>
        <point val="15,7.9"/>
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
    <object type="Standard - Line" version="0" id="O46">
      <attribute name="obj_pos">
        <point val="16.4,7.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.395,7.295;16.405,7.905"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="16.4,7.3"/>
        <point val="16.4,7.9"/>
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
    <object type="Standard - Line" version="0" id="O47">
      <attribute name="obj_pos">
        <point val="17.1,7.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.095,7.295;17.105,7.905"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.1,7.3"/>
        <point val="17.1,7.9"/>
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
  </layer>
  <layer name="&#202;&#184;&#187;&#250;" visible="true">
    <object type="Standard - Text" version="0" id="O48">
      <attribute name="obj_pos">
        <point val="13.25,3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.947,2.77368;13.553,3.07368"/>
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
            <point val="13.25,3"/>
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
    <object type="Standard - Text" version="0" id="O49">
      <attribute name="obj_pos">
        <point val="14.3,3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.1485,2.77368;14.4515,3.07368"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#184;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14.3,3"/>
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
    <object type="Standard - Text" version="0" id="O50">
      <attribute name="obj_pos">
        <point val="15.7,3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.397,2.77368;16.003,3.07368"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#195;&#180;&#197;&#246;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.7,3"/>
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
    <object type="Standard - Text" version="0" id="O51">
      <attribute name="obj_pos">
        <point val="17.45,3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.147,2.77368;17.753,3.07368"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#186;&#253;&#200;&#214;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.45,3"/>
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
    <object type="Standard - Text" version="0" id="O52">
      <attribute name="obj_pos">
        <point val="14,2.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14,2.27368;18.848,2.57368"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#161;&#202;&#164;&#179;&#164;&#206;&#205;&#243;&#164;&#207;&#185;&#241;&#202;&#221;&#207;&#162;&#164;&#172;&#181;&#173;&#198;&#254;&#164;&#183;&#164;&#222;&#164;&#185;&#161;&#163;&#161;&#203;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="14,2.5"/>
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
    <object type="Standard - Text" version="0" id="O53">
      <attribute name="obj_pos">
        <point val="13.15,3.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.15,3.37368;13.453,3.67368"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="13.15,3.6"/>
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
    <object type="Standard - Text" version="0" id="O54">
      <attribute name="obj_pos">
        <point val="11.55,7.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.53,7.44825;13.57,7.84825"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#229;&#206;&#197;&#161;&#166;&#204;&#244;&#182;&#201;&#181;&#161;&#180;&#216;&#165;&#179;&#161;&#188;&#165;&#201;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="11.55,7.75"/>
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
    <object type="Standard - Text" version="0" id="O55">
      <attribute name="obj_pos">
        <point val="9.95,8.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.546,8.04825;10.354,8.44825"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#201;&#189;&#202;&#204;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="9.95,8.35"/>
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
    <object type="Standard - Text" version="0" id="O56">
      <attribute name="obj_pos">
        <point val="10.4,8.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.4,8.20386;13.2886,8.46386"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#161;&#202;&#161;&#251;&#164;&#242;&#201;&#213;&#164;&#183;&#164;&#198;&#178;&#188;&#164;&#181;&#164;&#164;&#161;&#163;&#161;&#203;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="10.4,8.4"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.160186"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1313"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O57">
      <attribute name="obj_pos">
        <point val="13.8,8.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.8,8.04825;15.012,8.44825"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#177;&#176;&#229;&#178;&#202;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.8,8.35"/>
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
        <point val="15.45,8.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.45,8.04825;16.662,8.44825"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#178;&#187;&#245;&#178;&#202;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="15.45,8.35"/>
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
    <object type="Standard - Text" version="0" id="O59">
      <attribute name="obj_pos">
        <point val="17.15,8.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.15,8.04825;18.362,8.44825"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#179;&#196;&#180;&#186;&#222;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="17.15,8.35"/>
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
    <object type="Standard - Text" version="0" id="O60">
      <attribute name="obj_pos">
        <point val="9.75,8.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.75,8.64825;11.366,9.04825"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="9.75,8.95"/>
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
    <object type="Standard - Text" version="0" id="O61">
      <attribute name="obj_pos">
        <point val="9.75,9.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.75,9.19825;11.77,9.59825"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#204;&#244;&#182;&#201;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="9.75,9.5"/>
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
    <object type="Standard - Text" version="0" id="O62">
      <attribute name="obj_pos">
        <point val="9.75,10.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.75,9.74825;11.7902,10.1482"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#189;&#187;     &#189;&#234;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="9.75,10.05"/>
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
    <object type="Standard - Text" version="0" id="O63">
      <attribute name="obj_pos">
        <point val="9.75,10.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.75,10.2982;11.77,10.6982"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="9.75,10.6"/>
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
    <object type="Standard - Text" version="0" id="O64">
      <attribute name="obj_pos">
        <point val="11.35,8.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.35,8.75386;11.8752,9.01386"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#181;&#218;&#164;&#211;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.26"/>
          </attribute>
          <attribute name="pos">
            <point val="11.35,8.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.160186"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1313"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O65">
      <attribute name="obj_pos">
        <point val="18.05,10.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.05,10.3982;18.454,10.7982"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="18.05,10.7"/>
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
    <object type="Standard - Text" version="0" id="O66">
      <attribute name="obj_pos">
        <point val="7.1,12.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.696,11.7982;7.504,12.1982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#200;&#214;&#185;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="7.1,12.1"/>
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
    <object type="Standard - Text" version="0" id="O67">
      <attribute name="obj_pos">
        <point val="7.1,13.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.696,12.9982;7.504,13.3982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#176;&#163;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="7.1,13.3"/>
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
    <object type="Standard - Text" version="0" id="O68">
      <attribute name="obj_pos">
        <point val="7.1,14.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.696,14.1982;7.504,14.5982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#178;&#163;&#183;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="7.1,14.5"/>
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
    <object type="Standard - Text" version="0" id="O69">
      <attribute name="obj_pos">
        <point val="7.1,15.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.696,15.3982;7.504,15.7982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#178;&#163;&#184;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="7.1,15.7"/>
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
    <object type="Standard - Text" version="0" id="O70">
      <attribute name="obj_pos">
        <point val="9.8,12.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.7799,11.7982;10.8201,12.1982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#182;&#232;     &#202;&#172;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="9.8,12.1"/>
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
    <object type="Standard - Text" version="0" id="O71">
      <attribute name="obj_pos">
        <point val="13.3,12.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.088,11.7982;14.512,12.1982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#191;&#189;&#192;&#193;&#189;&#241;&#164;&#206;&#203;&#231;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="13.3,12.1"/>
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
    <object type="Standard - Text" version="0" id="O72">
      <attribute name="obj_pos">
        <point val="16.6,12.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.59,11.7982;17.61,12.1982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#188;&#245;&#206;&#206;&#176;&#209;&#199;&#164;&#179;&#219;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="16.6,12.1"/>
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
    <object type="Standard - Text" version="0" id="O73">
      <attribute name="obj_pos">
        <point val="18.1,12.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.1,12.5482;18.504,12.9482"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="18.1,12.85"/>
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
    <object type="Standard - Text" version="0" id="O74">
      <attribute name="obj_pos">
        <point val="14.2,12.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2,12.5982;14.604,12.9982"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="14.2,12.9"/>
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
    <object type="Standard - Text" version="0" id="O75">
      <attribute name="obj_pos">
        <point val="9.9,13.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.486,12.7982;11.314,13.5982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#241;&#202;&#221;&#193;&#176;&#180;&#252;&#185;&#226;&#206;&#240;&#188;&#212;
&#161;&#202;&#176;&#236;&#200;&#204;&#161;&#166;&#194;&#224;&#191;&#166;&#161;&#203;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="9.9,13.1"/>
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
    <object type="Standard - Text" version="0" id="O76">
      <attribute name="obj_pos">
        <point val="9.9,14.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.35268,14.1982;11.4473,14.5982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#241;  &#202;&#221;  &#207;&#183;  &#191;&#205;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="9.9,14.5"/>
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
    <object type="Standard - Text" version="0" id="O77">
      <attribute name="obj_pos">
        <point val="9.9,15.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.35268,15.3982;11.4473,15.7982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#188;&#210;  &#202;&#221;  &#207;&#183;  &#191;&#205;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="9.9,15.7"/>
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
    <object type="Standard - Text" version="0" id="O78">
      <attribute name="obj_pos">
        <point val="9.9,16.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.24956,16.5982;10.5504,16.9982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#231;  &#183;&#215;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="9.9,16.9"/>
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
    <object type="Standard - Text" version="0" id="O79">
      <attribute name="obj_pos">
        <point val="3.7,24.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.488,24.0982;4.912,24.4982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#204;&#164;&#196;&#243;&#189;&#208;&#188;&#212;&#176;&#236;&#205;&#247;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="3.7,24.4"/>
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
    <object type="Standard - Text" version="0" id="O80">
      <attribute name="obj_pos">
        <point val="6.5,17.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.5,17.4284;19.226,18.1484"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#176;&#163;&#176;&#181;&#218;&#164;&#211;&#163;&#178;&#163;&#183;&#164;&#206;&#203;&#231;&#191;&#244;&#164;&#207;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#205;&#209;&#192;&#193;&#181;&#225;&#189;&#241;&#164;&#206;&#186;&#198;&#183;&#199;&#205;&#243;&#164;&#203;&#181;&#173;&#186;&#220;&#164;&#183;&#164;&#191;&#188;&#245;&#206;&#206;&#176;&#209;&#199;&#164;&#164;&#206;&#183;&#239;&#191;&#244;&#164;&#200;
&#198;&#177;&#164;&#184;&#164;&#199;&#164;&#185;&#161;&#163;&#161;&#202;&#188;&#245;&#206;&#206;&#176;&#209;&#199;&#164;&#164;&#206;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#183;&#239;&#191;&#244;&#161;&#225;&#191;&#189;&#192;&#193;&#189;&#241;&#164;&#206;&#203;&#231;&#191;&#244;&#164;&#199;&#164;&#185;&#161;&#163;&#161;&#203;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.5,17.7"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.221796"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O81">
      <attribute name="obj_pos">
        <point val="3.4,25.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.592,24.9982;4.208,25.3982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#187;&#212;&#196;&#174;&#194;&#188;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="3.4,25.3"/>
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
    <object type="Standard - Text" version="0" id="O82">
      <attribute name="obj_pos">
        <point val="6.8,25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.8,24.7284;8.9816,25.0884"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#207;&#187;&#212;&#196;&#174;&#194;&#188;&#200;&#214;&#185;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.8,25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.221796"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O83">
      <attribute name="obj_pos">
        <point val="6.8,25.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.8,25.2284;8.9816,25.5884"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#207;&#202;&#221;&#184;&#177;&#188;&#212;&#200;&#214;&#185;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="6.8,25.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.221796"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O84">
      <attribute name="obj_pos">
        <point val="4.4,25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.4,24.7284;6.51979,25.0884"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#207;&#183; &#191;&#205; &#202;&#221; &#183;&#242;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="4.4,25"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.221796"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O85">
      <attribute name="obj_pos">
        <point val="4.4,25.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.4,25.2284;6.218,25.5884"/>
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
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="4.4,25.5"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.221796"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O86">
      <attribute name="obj_pos">
        <point val="10.7,25.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.92634,24.9982;11.4737,25.3982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#187;&#225;   &#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.7,25.3"/>
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
    <object type="Standard - Text" version="0" id="O87">
      <attribute name="obj_pos">
        <point val="12.5,25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.5,24.6982;15.328,25.0982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#207;&#183;&#191;&#205;&#188;&#245;&#181;&#235;&#188;&#212;&#200;&#214;&#185;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="12.5,25"/>
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
    <object type="Standard - Text" version="0" id="O88">
      <attribute name="obj_pos">
        <point val="12.5,25.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.5,25.1982;15.732,25.5982"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#241;&#202;&#221;&#200;&#239;&#202;&#221;&#184;&#177;&#188;&#212;&#200;&#214;&#185;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="12.5,25.5"/>
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
    <object type="Standard - Text" version="0" id="O89">
      <attribute name="obj_pos">
        <point val="15.9,25.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.9,24.8737;16.506,25.1737"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#203;&#244;&#164;&#207;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="15.9,25.1"/>
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
    <object type="Standard - Text" version="0" id="O90">
      <attribute name="obj_pos">
        <point val="17.6,25.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.8425,24.8737;18.3575,25.4737"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#188;&#171;&#184;&#202;&#201;&#233;&#195;&#180;
&#184;&#194;&#197;&#217;&#179;&#219;&#200;&#214;&#185;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.6,25.1"/>
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
    <object type="Standard - Text" version="0" id="O91">
      <attribute name="obj_pos">
        <point val="3.1,18.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.1,18.3284;4.1908,18.6884"/>
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
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="3.1,18.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.221796"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O92">
      <attribute name="obj_pos">
        <point val="4.3,18.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.3,18.3284;5.0272,18.6884"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#177;&#161;&#167;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="4.3,18.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.221796"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O93">
      <attribute name="obj_pos">
        <point val="4.3,22.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.3,21.9284;5.0272,22.2884"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#178;&#161;&#167;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.36"/>
          </attribute>
          <attribute name="pos">
            <point val="4.3,22.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.221796"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1818"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <group>
      <object type="Standard - Text" version="0" id="O94">
        <attribute name="obj_pos">
          <point val="5.2,18.6"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="5.2,18.3284;18.6532,18.6884"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#191;&#189;&#192;&#193;&#189;&#241;&#164;&#206;&#196;&#243;&#189;&#208;&#164;&#172;&#164;&#202;&#164;&#177;&#164;&#236;&#164;&#208;&#161;&#162;&#188;&#245;&#206;&#206;&#176;&#209;&#199;&#164;&#164;&#206;&#188;&#232;&#164;&#234;&#176;&#183;&#164;&#164;&#164;&#242;&#164;&#183;&#164;&#202;&#164;&#164;&#161;&#202;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#164;&#203;&#188;&#171;&#184;&#202;&#201;&#233;&#195;&#180;&#184;&#194;&#197;&#217;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.36"/>
            </attribute>
            <attribute name="pos">
              <point val="5.2,18.6"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.221796"/>
            </attribute>
            <attribute name="multi">
              <real val="0.1818"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O95">
        <attribute name="obj_pos">
          <point val="4.9,19.2"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="4.9,18.9284;10.7176,19.2884"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#179;&#219;&#164;&#206;&#200;&#214;&#185;&#230;&#164;&#242;&#181;&#173;&#198;&#254;&#164;&#183;&#164;&#202;&#164;&#164;&#161;&#203;&#164;&#199;&#178;&#188;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.36"/>
            </attribute>
            <attribute name="pos">
              <point val="4.9,19.2"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.221796"/>
            </attribute>
            <attribute name="multi">
              <real val="0.1818"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O96">
        <attribute name="obj_pos">
          <point val="5.2,19.8"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="5.2,19.5284;18.6532,19.8884"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#164;&#228;&#164;&#224;&#164;&#242;&#198;&#192;&#164;&#202;&#164;&#164;&#187;&#246;&#190;&#240;&#164;&#199;&#196;&#243;&#189;&#208;&#164;&#172;&#195;&#217;&#164;&#236;&#164;&#198;&#164;&#164;&#164;&#235;&#190;&#236;&#185;&#231;&#164;&#207;&#161;&#162;&#178;&#188;&#195;&#202;&#164;&#206;&#204;&#164;&#196;&#243;&#189;&#208;&#188;&#212;&#176;&#236;&#205;&#247;&#164;&#203;&#181;&#173;&#198;&#254;&#164;&#183;&#164;&#198;&#178;&#188;&#164;&#181;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.36"/>
            </attribute>
            <attribute name="pos">
              <point val="5.2,19.8"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.221796"/>
            </attribute>
            <attribute name="multi">
              <real val="0.1818"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O97">
        <attribute name="obj_pos">
          <point val="4.9,20.4"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="4.9,20.1284;13.6264,20.4884"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#164;&#164;&#161;&#163;&#163;&#178;&#163;&#176;&#198;&#252;&#201;&#172;&#195;&#229;&#164;&#206;&#190;&#236;&#185;&#231;&#164;&#203;&#184;&#194;&#164;&#234;&#197;&#246;&#183;&#238;&#189;&#232;&#205;&#253;&#164;&#200;&#164;&#164;&#164;&#191;&#164;&#183;&#164;&#222;&#164;&#185;&#161;&#163;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.36"/>
            </attribute>
            <attribute name="pos">
              <point val="4.9,20.4"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.221796"/>
            </attribute>
            <attribute name="multi">
              <real val="0.1818"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O98">
        <attribute name="obj_pos">
          <point val="5.2,21"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="5.2,20.7284;18.6532,21.0884"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#164;&#202;&#164;&#170;&#161;&#162;&#196;&#243;&#189;&#208;&#164;&#172;&#204;&#181;&#164;&#171;&#164;&#195;&#164;&#191;&#190;&#236;&#185;&#231;&#164;&#207;&#161;&#162;&#188;&#245;&#206;&#206;&#176;&#209;&#199;&#164;&#164;&#200;&#164;&#187;&#164;&#186;&#178;&#254;&#164;&#225;&#164;&#198;&#203;&#161;&#196;&#234;&#181;&#235;&#201;&#213;&#161;&#202;&#176;&#236;&#201;&#244;&#201;&#233;&#195;&#180;&#182;&#226;&#164;&#200;&#164;&#183;&#164;&#198;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.36"/>
            </attribute>
            <attribute name="pos">
              <point val="5.2,21"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.221796"/>
            </attribute>
            <attribute name="multi">
              <real val="0.1818"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O99">
        <attribute name="obj_pos">
          <point val="4.9,21.6"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="4.9,21.3284;12.172,21.6884"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#163;&#177;&#179;&#228;&#203;&#244;&#164;&#207;&#163;&#178;&#179;&#228;&#161;&#203;&#164;&#206;&#200;&#241;&#205;&#209;&#164;&#242;&#196;&#167;&#188;&#253;&#164;&#183;&#164;&#198;&#164;&#175;&#164;&#192;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.36"/>
            </attribute>
            <attribute name="pos">
              <point val="4.9,21.6"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.221796"/>
            </attribute>
            <attribute name="multi">
              <real val="0.1818"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O100">
        <attribute name="obj_pos">
          <point val="5.2,22.2"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="5.2,21.9284;19.744,22.2884"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#191;&#189;&#192;&#193;&#189;&#241;&#164;&#207;&#161;&#162;&#161;&#214;&#185;&#241;&#202;&#221;&#193;&#176;&#180;&#252;&#185;&#226;&#206;&#240;&#188;&#212;&#161;&#215;&#161;&#214;&#185;&#241;&#202;&#221;&#207;&#183;&#191;&#205;&#161;&#215;&#161;&#214;&#188;&#210;&#202;&#221;&#207;&#183;&#191;&#205;&#161;&#215;&#164;&#206;&#189;&#231;&#164;&#203;&#161;&#162;&#165;&#236;&#165;&#187;&#165;&#215;&#165;&#200;&#164;&#200;&#198;&#177;&#164;&#184;&#196;&#214;&#164;&#234;&#202;&#253;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.36"/>
            </attribute>
            <attribute name="pos">
              <point val="5.2,22.2"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.221796"/>
            </attribute>
            <attribute name="multi">
              <real val="0.1818"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O101">
        <attribute name="obj_pos">
          <point val="4.9,22.8"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="4.9,22.5284;19.0804,22.8884"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#164;&#199;&#187;&#212;&#196;&#174;&#194;&#188;&#200;&#214;&#185;&#230;&#164;&#206;&#188;&#227;&#164;&#164;&#189;&#231;&#164;&#203;&#202;&#194;&#164;&#217;&#164;&#222;&#164;&#185;&#161;&#163;&#164;&#179;&#164;&#206;&#192;&#193;&#181;&#225;&#189;&#241;&#164;&#242;&#190;&#229;&#164;&#203;&#164;&#206;&#164;&#187;&#176;&#236;&#179;&#231;&#196;&#214;&#164;&#184;&#164;&#200;&#164;&#183;&#161;&#162;&#191;&#199;&#206;&#197;&#183;&#238;&#164;&#206;&#205;&#226;&#183;&#238;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.36"/>
            </attribute>
            <attribute name="pos">
              <point val="4.9,22.8"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.221796"/>
            </attribute>
            <attribute name="multi">
              <real val="0.1818"/>
            </attribute>
          </composite>
        </attribute>
      </object>
      <object type="Standard - Text" version="0" id="O102">
        <attribute name="obj_pos">
          <point val="5.2,23.4"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="5.2,23.1284;12.472,23.4884"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#163;&#177;&#163;&#181;&#198;&#252;&#164;&#222;&#164;&#199;&#164;&#203;&#161;&#214;&#185;&#241;&#202;&#221;&#207;&#162;&#161;&#215;&#164;&#203;&#196;&#243;&#189;&#208;&#164;&#183;&#164;&#198;&#178;&#188;&#164;&#181;&#164;&#164;&#161;&#163;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.36"/>
            </attribute>
            <attribute name="pos">
              <point val="5.2,23.4"/>
            </attribute>
            <attribute name="color">
              <color val="#000000"/>
            </attribute>
            <attribute name="alignment">
              <enum val="0"/>
            </attribute>
            <attribute name="single">
              <real val="0.221796"/>
            </attribute>
            <attribute name="multi">
              <real val="0.1818"/>
            </attribute>
          </composite>
        </attribute>
      </object>
    </group>
    <object type="Standard - Text" version="0" id="O103">
      <attribute name="obj_pos">
        <point val="3,2.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3,2.19825;4.212,2.59825"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#205;&#205;&#188;&#176;&#163;&#177;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="3,2.5"/>
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
        <point val="3.9,6.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.9,6.49825;7.30976,6.89825"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#241;&#202;&#221;&#207;&#162;&#185;&#231;&#178;&#241;    &#205;&#205;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="3.9,6.8"/>
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
        <point val="10,6.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.87102,5.79825;13.129,6.19825"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#226; &#179;&#219; &#188;&#245; &#206;&#206; &#176;&#209; &#199;&#164; &#202;&#167; &#192;&#193; &#181;&#225; &#189;&#241;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10,6.1"/>
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
    <object type="Standard - Text" version="0" id="O106">
      <attribute name="obj_pos">
        <point val="7.6,5.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.6,4.79825;8.408,5.19825"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="7.6,5.1"/>
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
        <point val="9.9,5.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.9,4.79825;10.304,5.19825"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="9.9,5.1"/>
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
        <point val="11.8,5.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.8,4.79825;13.416,5.19825"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#238;&#191;&#199;&#206;&#197;&#202;&#172;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="11.8,5.1"/>
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
        <point val="13.7093,8.42583"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.7093,7.9732;14.3153,8.5732"/>
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
            <point val="13.7093,8.42583"/>
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
  </layer>
  <layer name="&#186;&#185;&#164;&#183;&#185;&#254;&#164;&#223;" visible="true">
    <object type="Embed - Text" version="0" id="O110">
      <attribute name="obj_pos">
        <point val="9.6,5.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.792,4.79825;9.6,5.19825"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SRYYY#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="9.6,5.1"/>
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
    <object type="Embed - Text" version="0" id="O111">
      <attribute name="obj_pos">
        <point val="11.4,5.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.592,4.79825;11.4,5.19825"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SRYMM#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="11.4,5.1"/>
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
        <point val="13.6,7.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.6,7.32193;18.549,8.02193"/>
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
            <string>#&#163;&#185;&#163;&#185;&#163;&#185;&#163;&#185;&#163;&#185;&#163;&#185;&#163;&#185;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.7"/>
          </attribute>
          <attribute name="pos">
            <point val="13.6,7.85"/>
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
    <object type="Embed - Text" version="0" id="O113">
      <attribute name="obj_pos">
        <point val="12.15,8.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.15,8.7614;18.4625,9.2614"/>
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
&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="12.15,8.95"/>
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
    <object type="Embed - Text" version="0" id="O114">
      <attribute name="obj_pos">
        <point val="12.15,9.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.15,9.5114;15.9375,10.0114"/>
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
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;
&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="12.15,9.7"/>
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
    <object type="Embed - Text" version="0" id="O115">
      <attribute name="obj_pos">
        <point val="12.15,10.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.15,10.3133;17.907,10.6933"/>
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
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.38"/>
          </attribute>
          <attribute name="pos">
            <point val="12.15,10.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.234118"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1919"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O116">
      <attribute name="obj_pos">
        <point val="14.2,13.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.3517,12.8474;14.2,13.4474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#MAISU[0]#</string>
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
            <point val="14.2,13.3"/>
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
    <object type="Embed - Text" version="0" id="O117">
      <attribute name="obj_pos">
        <point val="14.2,14.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.3517,14.0474;14.2,14.6474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#MAISU[1]#</string>
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
            <point val="14.2,14.5"/>
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
    <object type="Embed - Text" version="0" id="O118">
      <attribute name="obj_pos">
        <point val="14.25,15.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.4017,15.2474;14.25,15.8474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#MAISU[2]#</string>
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
            <point val="14.25,15.7"/>
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
    <object type="Embed - Text" version="0" id="O119">
      <attribute name="obj_pos">
        <point val="14.25,16.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.4017,16.4474;14.25,17.0474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#MAISU[3]#</string>
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
            <point val="14.25,16.9"/>
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
    <object type="Embed - Text" version="0" id="O120">
      <attribute name="obj_pos">
        <point val="18.25,13.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.9231,12.8474;18.25,13.4474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KINGK[0]#</string>
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
            <point val="18.25,13.3"/>
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
    <object type="Embed - Text" version="0" id="O121">
      <attribute name="obj_pos">
        <point val="18.3,14.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.9731,14.0474;18.3,14.6474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KINGK[1]#</string>
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
            <point val="18.3,14.5"/>
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
    <object type="Embed - Text" version="0" id="O122">
      <attribute name="obj_pos">
        <point val="18.3,15.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.9731,15.2474;18.3,15.8474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KINGK[2]#</string>
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
            <point val="18.3,15.7"/>
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
    <object type="Embed - Text" version="0" id="O123">
      <attribute name="obj_pos">
        <point val="18.3,16.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.9731,16.4474;18.3,17.0474"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KINGK[3]#</string>
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
            <point val="18.3,16.9"/>
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
