<?xml version="1.0"?>
<diagram xmlns:dia="http://www.lysator.liu.se/~alla/dia/">
  <dictionarydata>
    <element name="PRTYM" occurs="1">
      <appinfo>
        <embed object="string" length="16"/>
      </appinfo>
    </element>
    <element name="HOSPCD" occurs="1">
      <appinfo>
        <embed object="string" length="7"/>
      </appinfo>
    </element>
    <element name="HOSPNAME" occurs="1">
      <appinfo>
        <embed object="string" length="100"/>
      </appinfo>
    </element>
    <element name="IKENSU" occurs="36">
      <appinfo>
        <embed object="string" length="5"/>
      </appinfo>
    </element>
    <element name="TKENSU" occurs="36">
      <appinfo>
        <embed object="string" length="5"/>
      </appinfo>
    </element>
    <element name="RKENSU" occurs="36">
      <appinfo>
        <embed object="string" length="5"/>
      </appinfo>
    </element>
    <element name="KNKENSU" occurs="1">
      <appinfo>
        <embed object="string" length="7"/>
      </appinfo>
    </element>
    <element name="KGKENSU" occurs="1">
      <appinfo>
        <embed object="string" length="7"/>
      </appinfo>
    </element>
    <element name="FKKENSU" occurs="1">
      <appinfo>
        <embed object="string" length="7"/>
      </appinfo>
    </element>
    <element name="FRKENSU" occurs="1">
      <appinfo>
        <embed object="string" length="7"/>
      </appinfo>
    </element>
    <element name="NYKENSU" occurs="1">
      <appinfo>
        <embed object="string" length="7"/>
      </appinfo>
    </element>
    <element name="HKNJANAME" occurs="10">
      <appinfo>
        <embed object="string" length="10"/>
      </appinfo>
    </element>
    <element name="KOUKI" occurs="13">
      <element name="KOU-KEN" occurs="1">
        <appinfo>
          <embed object="string" length="10"/>
        </appinfo>
      </element>
      <element name="KOU-KENSU" occurs="1">
        <appinfo>
          <embed object="string" length="5"/>
        </appinfo>
      </element>
    </element>
    <element name="KOUKENSU" occurs="1">
      <appinfo>
        <embed object="string" length="7"/>
      </appinfo>
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
  <layer name="&#199;&#216;&#183;&#202;" visible="true">
    <object type="Standard - Box" version="0" id="O0">
      <attribute name="obj_pos">
        <point val="5.00572,4.01263"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.98572,3.99263;17.1352,5.44554"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="5.00572,4.01263"/>
      </attribute>
      <attribute name="elem_width">
        <real val="12.1095"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1.41291"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O1">
      <attribute name="obj_pos">
        <point val="5.00572,4.71908"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.98572,4.69908;17.1352,4.73908"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.00572,4.71908"/>
        <point val="17.1152,4.71908"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
      <connections>
        <connection handle="0" to="O0" connection="3"/>
        <connection handle="1" to="O0" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O2">
      <attribute name="obj_pos">
        <point val="8.8,4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.78,3.98;8.82,5.45298"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="8.8,4"/>
        <point val="8.8,5.43298"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O3">
      <attribute name="obj_pos">
        <point val="2.5,12.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,12.19;19.01,12.21"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,12.2"/>
        <point val="19,12.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O4">
      <attribute name="obj_pos">
        <point val="2.5,21.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,21.7833;17.1093,21.81"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,21.8"/>
        <point val="17.0993,21.7933"/>
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
        <point val="10.75,6.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.7272,6.08;10.77,23.02"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.75,6.1"/>
        <point val="10.7472,23"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
      <connections>
        <connection handle="0" to="O36" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O6">
      <attribute name="obj_pos">
        <point val="2.5,25.4998"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,25.4898;18.9959,25.5098"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,25.4998"/>
        <point val="18.9859,25.4998"/>
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
        <point val="6.9,24.8998"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.89,24.8898;6.91,26.7098"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.9,24.8998"/>
        <point val="6.9,26.6998"/>
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
        <point val="2.5,17"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,16.9775;17.0978,17.01"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,17"/>
        <point val="17.0878,16.9875"/>
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
        <point val="2.5,15.7955"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,15.7855;17.1228,15.81"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,15.7955"/>
        <point val="17.1128,15.8"/>
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
        <point val="2.5,13.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,13.39;19.01,13.41"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,13.4"/>
        <point val="19,13.4"/>
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
        <point val="2.5,11.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,11.59;19.01,11.61"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,11.6"/>
        <point val="19,11.6"/>
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
        <point val="2.5,11"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,10.99;18.9856,11.0131"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,11"/>
        <point val="18.9756,11.0031"/>
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
        <point val="2.5,10.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,10.39;19.01,10.41"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,10.4"/>
        <point val="19,10.4"/>
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
        <point val="2.5,9.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,9.79;19.01,9.81"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,9.8"/>
        <point val="19,9.8"/>
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
        <point val="2.5,9.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,9.19;19.01,9.21"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,9.2"/>
        <point val="19,9.2"/>
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
        <point val="2.5,8.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,8.59;19.01,8.61"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,8.6"/>
        <point val="19,8.6"/>
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
        <point val="2.5,8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,7.99;19.01,8.01"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,8"/>
        <point val="19,8"/>
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
        <point val="2.5,7.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,7.39;19.01,7.41"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,7.4"/>
        <point val="19,7.4"/>
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
        <point val="2.49402,6.825"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.47402,6.805;19.0211,6.845"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.49402,6.825"/>
        <point val="19.0011,6.825"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O20">
      <attribute name="obj_pos">
        <point val="2.5,12.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,12.79;19.01,12.81"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,12.8"/>
        <point val="19,12.8"/>
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
        <point val="2.49891,15.1988"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.48891,15.1888;17.1103,15.21"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.49891,15.1988"/>
        <point val="17.1003,15.2"/>
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
        <point val="2.5,16.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,16.39;17.0978,16.4225"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,16.4"/>
        <point val="17.0878,16.4125"/>
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
        <point val="2.5,18.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,18.19;17.0978,18.21"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,18.2"/>
        <point val="17.0878,18.2"/>
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
        <point val="15.2286,24.9014"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2186,24.8914;15.2393,26.1223"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.2286,24.9014"/>
        <point val="15.2293,26.1123"/>
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
        <point val="6.9,6.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.8881,6.09;6.91,22.4393"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.9,6.1"/>
        <point val="6.8981,22.4293"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O26">
      <attribute name="obj_pos">
        <point val="5,6.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.97917,6.09;5.01,22.4305"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5,6.1"/>
        <point val="4.98917,22.4205"/>
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
        <point val="8.8,6.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.79,6.09;8.81623,22.4305"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="8.8,6.1"/>
        <point val="8.80623,22.4205"/>
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
        <point val="2.5,18.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,18.79;17.0978,18.8225"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,18.8"/>
        <point val="17.0878,18.8125"/>
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
        <point val="2.5,19.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,19.3775;17.1103,19.41"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,19.4"/>
        <point val="17.1003,19.3875"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O30">
      <attribute name="obj_pos">
        <point val="2.5,20"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,19.9775;17.1103,20.01"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,20"/>
        <point val="17.1003,19.9875"/>
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
        <point val="2.5,20.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,20.5775;17.0853,20.61"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,20.6"/>
        <point val="17.0753,20.5875"/>
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
        <point val="2.5,21.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,21.19;17.0978,21.2225"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,21.2"/>
        <point val="17.0878,21.2125"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O33">
      <attribute name="obj_pos">
        <point val="2.5,17.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,17.59;17.0978,17.61"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,17.6"/>
        <point val="17.0878,17.6"/>
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
        <point val="2.5,22.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,22.39;17.0859,22.4225"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,22.4"/>
        <point val="17.0759,22.4125"/>
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
        <point val="2.5,23"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,22.9775;17.0984,23.01"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,23"/>
        <point val="17.0884,22.9875"/>
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
        <point val="2.5,6.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.48,6.08;19.02,6.12"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,6.1"/>
        <point val="19,6.1"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O37">
      <attribute name="obj_pos">
        <point val="2.5,6.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.47875,6.08;2.52,23.0231"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,6.1"/>
        <point val="2.49875,23.0031"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O38">
      <attribute name="obj_pos">
        <point val="2.50286,22.4188"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.48286,22.3925;17.1078,22.4388"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.50286,22.4188"/>
        <point val="17.0878,22.4125"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O39">
      <attribute name="obj_pos">
        <point val="19,6.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.9744,6.08;19.02,13.4481"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="19,6.1"/>
        <point val="18.9944,13.4281"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O40">
      <attribute name="obj_pos">
        <point val="17.086,14.0156"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.0648,13.9956;17.106,23.0294"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.086,14.0156"/>
        <point val="17.0848,23.0094"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O41">
      <attribute name="obj_pos">
        <point val="10.75,13.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.73,13.38;19.0075,13.42"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.75,13.4"/>
        <point val="18.9875,13.4"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
      <connections>
        <connection handle="0" to="O10" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O42">
      <attribute name="obj_pos">
        <point val="10.7386,13.9959"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.7186,13.9759;17.1143,14.02"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.7386,13.9959"/>
        <point val="17.0943,14"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O43">
      <attribute name="obj_pos">
        <point val="15.2,6.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.1869,6.09;15.21,12.8006"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.2,6.1"/>
        <point val="15.1969,12.7906"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O44">
      <attribute name="obj_pos">
        <point val="13.3,6.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.29,6.09;13.3114,13.4006"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.3,6.1"/>
        <point val="13.3014,13.3906"/>
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
        <point val="17.1,6.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.0869,6.09;17.11,12.8131"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.1,6.1"/>
        <point val="17.0969,12.8031"/>
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
        <point val="2.5,22.9875"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.48,22.9675;17.1061,23.0138"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,22.9875"/>
        <point val="17.0861,22.9938"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O47">
      <attribute name="obj_pos">
        <point val="10.75,12.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.73,12.7738;18.9886,12.82"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.75,12.8"/>
        <point val="18.9686,12.7938"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
      <connections>
        <connection handle="0" to="O20" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O48">
      <attribute name="obj_pos">
        <point val="13.2981,13.9906"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.2881,13.9806;13.3101,22.9944"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.2981,13.9906"/>
        <point val="13.3001,22.9844"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - ZigZagLine" version="0" id="O49">
      <attribute name="obj_pos">
        <point val="2.49667,24.889"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.47667,24.869;10.7695,26.711"/>
      </attribute>
      <attribute name="orth_points">
        <point val="2.49667,24.889"/>
        <point val="2.49667,26.691"/>
        <point val="10.7495,26.691"/>
        <point val="10.7495,24.8944"/>
      </attribute>
      <attribute name="orth_orient">
        <enum val="1"/>
        <enum val="0"/>
        <enum val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
      <connections>
        <connection handle="1" to="O51" connection="0"/>
      </connections>
    </object>
    <object type="Standard - ZigZagLine" version="0" id="O50">
      <attribute name="obj_pos">
        <point val="10.7496,26.0904"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.7296,24.8798;19.02,26.1198"/>
      </attribute>
      <attribute name="orth_points">
        <point val="10.7496,26.0904"/>
        <point val="10.7496,26.0998"/>
        <point val="19,26.0998"/>
        <point val="19,24.8998"/>
      </attribute>
      <attribute name="orth_orient">
        <enum val="1"/>
        <enum val="0"/>
        <enum val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O51">
      <attribute name="obj_pos">
        <point val="2.49896,24.889"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.47896,24.869;19.02,24.9198"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.49896,24.889"/>
        <point val="19,24.8998"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O52">
      <attribute name="obj_pos">
        <point val="2.5,26.0998"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49,26.0898;10.81,26.1098"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.5,26.0998"/>
        <point val="10.8,26.0998"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O53">
      <attribute name="obj_pos">
        <point val="2.48799,6.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.46799,6.73;19.0211,6.77"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.48799,6.75"/>
        <point val="19.0011,6.75"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.04"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O54">
      <attribute name="obj_pos">
        <point val="2.49938,14.5516"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.48938,14.54;17.0978,14.5616"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.49938,14.5516"/>
        <point val="17.0878,14.55"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <connections>
        <connection handle="0" to="O37" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O55">
      <attribute name="obj_pos">
        <point val="2.49875,13.9969"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.48875,13.9806;10.7704,14.0069"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.49875,13.9969"/>
        <point val="10.7604,13.9906"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O56">
      <attribute name="obj_pos">
        <point val="10.7381,14.5125"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.7281,14.5025;17.0801,14.5225"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.7381,14.5125"/>
        <point val="17.0701,14.5125"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
  </layer>
  <layer name="&#202;&#184;&#187;&#250;" visible="true">
    <object type="Standard - Text" version="0" id="O57">
      <attribute name="obj_pos">
        <point val="8.99782,3.35357"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.99782,2.99524;9.45232,3.44524"/>
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
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="8.99782,3.35357"/>
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
        <point val="9.60885,3.31821"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.60885,2.95988;13.2448,3.40988"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#191;&#199;&#206;&#197;&#202;&#243;&#189;&#183;&#197;&#249;&#193;&#237;&#179;&#231;&#201;&#188;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="9.60885,3.31821"/>
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
        <point val="2.42125,24.7647"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.42125,24.486;4.96645,24.836"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#(&#184;&#169;&#195;&#177;&#198;&#200;&#176;&#229;&#206;&#197;&#202;&#172;)#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="2.42125,24.7647"/>
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
        <point val="5.83026,4.48844"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.83026,4.20974;8.30476,4.55974"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="5.83026,4.48844"/>
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
        <point val="5.3357,6.56805"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.3357,6.28935;6.7497,6.63935"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#236;&#200;&#204;&#183;&#239;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="5.3357,6.56805"/>
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
        <point val="3.1325,6.55838"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.1325,6.27968;4.5465,6.62968"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.1325,6.55838"/>
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
        <point val="5.80867,5.21248"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.80867,4.93378;8.42457,5.28378"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#229; &#206;&#197; &#181;&#161; &#180;&#216; &#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="5.80867,5.21248"/>
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
        <point val="7.26275,6.57307"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.26275,6.29437;8.67675,6.64437"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#194;&#224;&#191;&#166;&#183;&#239;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="7.26275,6.57307"/>
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
        <point val="9.14081,6.575"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.14081,6.2963;10.5548,6.6463"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#207;&#183;&#183;&#242;&#183;&#239;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.14081,6.575"/>
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
        <point val="13.5561,6.55004"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.5561,6.27134;14.9701,6.62134"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#236;&#200;&#204;&#183;&#239;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="13.5561,6.55004"/>
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
        <point val="15.5152,6.56838"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.5152,6.28968;16.9292,6.63968"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#194;&#224;&#191;&#166;&#183;&#239;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="15.5152,6.56838"/>
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
        <point val="17.3599,6.57928"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.3599,6.30058;18.7739,6.65058"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#207;&#183;&#183;&#242;&#183;&#239;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.3599,6.57928"/>
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
        <point val="3.30203,7.26201"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.30203,6.98331;4.36253,7.33331"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#190;&#190;&#185;&#190;&#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.30203,7.26201"/>
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
        <point val="3.30203,7.84545"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.30203,7.56675;4.36253,7.91675"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#201;&#205;&#197;&#196;&#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.30203,7.84545"/>
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
        <point val="3.31237,9.0404"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.31237,8.7617;4.37287,9.1117"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#177;&#215;&#197;&#196;&#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.31237,9.0404"/>
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
        <point val="3.30203,9.64883"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.30203,9.37013;4.36253,9.72013"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#194;&#231;&#197;&#196;&#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.30203,9.64883"/>
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
        <point val="3.30203,10.2572"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.30203,9.9785;4.36253,10.3285"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#194;&#205;&#232;&#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.30203,10.2572"/>
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
        <point val="11.4161,6.55694"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.4161,6.27824;12.8301,6.62824"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="11.4161,6.55694"/>
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
        <point val="3.13107,19.8475"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.13107,19.5688;4.54507,19.9188"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#231;&#186;&#172;&#176;&#229;&#187;&#213;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.13107,19.8475"/>
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
        <point val="3.14877,20.4309"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.14877,20.1522;4.56277,20.5022"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#180;&#185;&#241;&#187;&#245;&#178;&#202;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.14877,20.4309"/>
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
        <point val="3.14877,21.0423"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.14877,20.7636;4.56277,21.1136"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#180;&#185;&#241;&#197;&#218;&#204;&#218;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.14877,21.0423"/>
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
        <point val="3.1134,21.6362"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.1134,21.3575;4.5274,21.7075"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#195;&#230;&#177;&#251;&#183;&#250;&#192;&#223;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.1134,21.6362"/>
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
        <point val="3.1384,22.2505"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.1384,21.9718;4.5524,22.3218"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#180;&#185;&#241;&#185;&#169;&#187;&#246;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.1384,22.2505"/>
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
        <point val="11.522,13.2257"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.522,12.947;12.5825,13.297"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#169;&#179;&#176;&#183;&#215;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="11.522,13.2257"/>
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
        <point val="11.3263,7.24969"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.3263,6.97099;13.0938,7.32099"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#186;&#184;&#180;&#177;&#165;&#191;&#165;&#164;&#165;&#235;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="11.3263,7.24969"/>
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
        <point val="11.3263,7.79769"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.3263,7.51899;12.7403,7.86899"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#180;&#185;&#241;&#200;&#196;&#182;&#226;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="11.3263,7.79769"/>
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
        <point val="3.29885,11.4296"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.29885,11.1509;4.35935,11.5009"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#177;&#192;&#198;&#238;&#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.29885,11.4296"/>
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
        <point val="3.13984,12.023"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.13984,11.7443;4.55384,12.0943"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#236;&#189;&#208;&#177;&#192;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.13984,12.023"/>
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
        <point val="3.28851,12.6723"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.28851,12.3936;4.34901,12.7436"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#200;&#229;&#192;&#238;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.28851,12.6723"/>
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
        <point val="3.28118,13.2701"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.28118,12.9914;4.34168,13.3414"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#192;&#238;&#203;&#220;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.28118,13.2701"/>
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
        <point val="3.13251,13.8428"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.13251,13.5641;4.54651,13.9141"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#196;&#197;&#207;&#194;&#204;&#238;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.13251,13.8428"/>
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
        <point val="3.28851,14.4448"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.28851,14.1661;4.34901,14.5161"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#179;&#164;&#187;&#206;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.28851,14.4448"/>
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
        <point val="3.15751,15.0089"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15751,14.7302;4.57151,15.0802"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#192;&#190;&#165;&#206;&#197;&#231;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15751,15.0089"/>
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
        <point val="3.29885,15.6139"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.29885,15.3352;4.35935,15.6852"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#195;&#206;&#201;&#215;&#194;&#188;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.29885,15.6139"/>
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
        <point val="3.15018,16.2352"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.15018,15.9565;4.56418,16.3065"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#177;&#252;&#189;&#208;&#177;&#192;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.15018,16.2352"/>
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
    <object type="Standard - Text" version="0" id="O92">
      <attribute name="obj_pos">
        <point val="3.29885,16.8403"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.29885,16.5616;4.35935,16.9116"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#200;&#211;&#198;&#238;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.29885,16.8403"/>
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
    <object type="Standard - Text" version="0" id="O93">
      <attribute name="obj_pos">
        <point val="3.30919,17.4733"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.30919,17.1946;4.36969,17.5446"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#200;&#254;&#182;&#191;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.30919,17.4733"/>
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
    <object type="Standard - Text" version="0" id="O94">
      <attribute name="obj_pos">
        <point val="3.2992,18.046"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.2992,17.7673;4.3597,18.1173"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#205;&#184;&#198;&#238;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.2992,18.046"/>
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
    <object type="Standard - Text" version="0" id="O95">
      <attribute name="obj_pos">
        <point val="3.29885,18.6468"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.29885,18.3681;4.35935,18.7181"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#181;&#200;&#178;&#236;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.29885,18.6468"/>
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
    <object type="Standard - Text" version="0" id="O96">
      <attribute name="obj_pos">
        <point val="3.02951,19.2578"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.02951,18.9791;4.79701,19.3291"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#177;&#163;&#180;&#244;&#164;&#206;&#197;&#231;&#196;&#174;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.02951,19.2578"/>
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
    <object type="Standard - Text" version="0" id="O97">
      <attribute name="obj_pos">
        <point val="3.31148,10.8424"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.31148,10.5637;4.37198,10.9137"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#190;&#196;&#197;&#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.31148,10.8424"/>
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
        <point val="3.29885,8.45256"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.29885,8.17386;4.35935,8.52386"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#189;&#208;&#177;&#192;&#187;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.29885,8.45256"/>
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
        <point val="3.124,25.9567"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.124,25.678;6.659,26.028"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#161; &#187;&#227; &#176;&#229; &#206;&#197;(&#188;&#210;&#202;&#221;&#202;&#172;)#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.124,25.9567"/>
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
        <point val="3.138,26.5417"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.138,26.263;6.673,26.613"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#161; &#187;&#227; &#207;&#183; &#191;&#205;(&#188;&#210;&#202;&#221;&#202;&#172;)#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.138,26.5417"/>
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
        <point val="10.975,25.9265"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.975,25.6478;15.217,25.9978"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#199;&#165;&#201;&#216;&#161;&#166;&#198;&#253;&#187;&#249;&#197;&#249;&#192;&#186;&#204;&#169;&#183;&#242;&#185;&#175;&#191;&#199;&#186;&#186;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="10.975,25.9265"/>
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
        <point val="11.129,25.3475"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.129,25.0688;15.0175,25.4188"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#199;&#165;&#201;&#216;&#161;&#166;&#198;&#253;&#187;&#249;&#176;&#236;&#200;&#204;&#183;&#242;&#185;&#175;&#191;&#199;&#186;&#186;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="11.129,25.3475"/>
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
        <point val="3.114,25.3365"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.114,25.0578;6.7197,25.4078"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#253;&#205;&#196;&#187;&#249;&#197;&#249;&#176;&#229;&#206;&#197;(&#188;&#210;&#202;&#221;&#202;&#172;)#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.114,25.3365"/>
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
        <point val="3.33347,22.8197"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.33347,22.541;4.39397,22.891"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#169;&#198;&#226;&#183;&#215;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="3.33347,22.8197"/>
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
    <object type="Standard - Text" version="0" id="O105">
      <attribute name="obj_pos">
        <point val="2.5877,5.8762"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.5877,5.5975;5.4864,5.9475"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#(&#185;&#241;&#204;&#177;&#183;&#242;&#185;&#175;&#202;&#221;&#184;&#177;&#202;&#172;)#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="2.5877,5.8762"/>
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
        <point val="10.9906,13.8137"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.9906,13.535;14.2428,13.885"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#(&#184;&#229;&#180;&#252;&#185;&#226;&#206;&#240;&#188;&#212;&#176;&#229;&#206;&#197;&#202;&#172;)#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="10.9906,13.8137"/>
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
        <point val="11.6676,14.3637"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.6676,14.085;12.3746,14.435"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#169;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="11.6676,14.3637"/>
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
    <object type="Standard - Text" version="0" id="O108">
      <attribute name="obj_pos">
        <point val="14.204,14.3512"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.204,14.0725;16.325,14.4225"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#229;&#180;&#252;&#185;&#226;&#206;&#240;&#183;&#239;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="14.204,14.3512"/>
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
    <object type="Standard - Text" version="0" id="O109">
      <attribute name="obj_pos">
        <point val="11.3843,15.0012"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.3843,14.7225;12.869,15.0725"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#231; &#186;&#172; &#184;&#169;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="11.3843,15.0012"/>
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
    <object type="Standard - Text" version="0" id="O110">
      <attribute name="obj_pos">
        <point val="11.8934,22.8012"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.8934,22.5225;12.2469,22.8725"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#183;&#215;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="11.8934,22.8012"/>
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
    <object type="Embed - Text" version="0" id="O111">
      <attribute name="obj_pos">
        <point val="5.325,3.325"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.325,2.96667;8.961,3.41667"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#PRTYM#</string>
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
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="5.325,3.325"/>
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
    <object type="Embed - Text" version="0" id="O112">
      <attribute name="obj_pos">
        <point val="9.525,4.575"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.525,4.13704;11.8581,4.68704"/>
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
            <real val="0.55"/>
          </attribute>
          <attribute name="pos">
            <point val="9.525,4.575"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.3333"/>
          </attribute>
          <attribute name="multi">
            <real val="0.27775"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O113">
      <attribute name="obj_pos">
        <point val="9.175,5.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.175,4.81111;16.75,5.41111"/>
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
            <point val="9.175,5.05"/>
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
    <object type="Embed - Text" version="0" id="O114">
      <attribute name="obj_pos">
        <point val="6.51017,7.28966"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.29817,6.97114;6.51017,7.37114"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[0]#</string>
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
            <point val="6.51017,7.28966"/>
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
    <object type="Embed - Text" version="0" id="O115">
      <attribute name="obj_pos">
        <point val="6.51017,7.87127"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,7.55275;6.51017,7.95275"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[1]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,7.87127"/>
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
        <point val="6.51017,8.47237"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,8.15385;6.51017,8.55385"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[2]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,8.47237"/>
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
        <point val="6.51017,9.07347"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,8.75495;6.51017,9.15495"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[3]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,9.07347"/>
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
        <point val="6.51017,9.68927"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,9.37075;6.51017,9.77075"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[4]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,9.68927"/>
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
        <point val="6.51017,10.2654"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,9.94688;6.51017,10.3469"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[5]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,10.2654"/>
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
    <object type="Embed - Text" version="0" id="O120">
      <attribute name="obj_pos">
        <point val="6.51017,10.8915"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,10.573;6.51017,10.973"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[6]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,10.8915"/>
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
        <point val="6.51017,11.4853"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,11.1668;6.51017,11.5668"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[7]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,11.4853"/>
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
        <point val="6.51017,12.0633"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,11.7448;6.51017,12.1448"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[8]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,12.0633"/>
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
        <point val="6.51017,12.6626"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,12.3441;6.51017,12.7441"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[9]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,12.6626"/>
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
        <point val="6.51017,13.2637"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,12.9452;6.51017,13.3452"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[10]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,13.2637"/>
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
    <object type="Embed - Text" version="0" id="O125">
      <attribute name="obj_pos">
        <point val="6.51017,13.8721"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,13.5536;6.51017,13.9536"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[11]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,13.8721"/>
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
        <point val="6.51017,14.4983"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,14.1798;6.51017,14.5798"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[12]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,14.4983"/>
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
        <point val="6.51017,15.0214"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,14.7029;6.51017,15.1029"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[13]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,15.0214"/>
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
        <point val="6.51017,15.6652"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,15.3467;6.51017,15.7467"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[14]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,15.6652"/>
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
        <point val="6.51017,16.2693"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,15.9508;6.51017,16.3508"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[15]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,16.2693"/>
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
    <object type="Embed - Text" version="0" id="O130">
      <attribute name="obj_pos">
        <point val="6.51017,16.837"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,16.5185;6.51017,16.9185"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[16]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,16.837"/>
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
        <point val="6.51017,17.4394"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,17.1209;6.51017,17.5209"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[17]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,17.4394"/>
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
        <point val="6.51017,18.0758"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,17.7573;6.51017,18.1573"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[18]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,18.0758"/>
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
        <point val="6.51017,18.6593"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,18.3408;6.51017,18.7408"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[19]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,18.6593"/>
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
        <point val="6.51017,19.2853"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,18.9668;6.51017,19.3668"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[20]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,19.2853"/>
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
    <object type="Embed - Text" version="0" id="O135">
      <attribute name="obj_pos">
        <point val="6.51017,19.8963"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,19.5778;6.51017,19.9778"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[21]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,19.8963"/>
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
        <point val="6.51017,20.537"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,20.2185;6.51017,20.6185"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[22]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,20.537"/>
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
        <point val="6.51017,21.1015"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,20.783;6.51017,21.183"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[23]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,21.1015"/>
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
        <point val="6.51017,21.6966"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,21.3781;6.51017,21.7781"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[24]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,21.6966"/>
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
        <point val="6.51017,22.3154"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.26777,21.9969;6.51017,22.3969"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[25]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="6.51017,22.3154"/>
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
    <object type="Embed - Text" version="0" id="O140">
      <attribute name="obj_pos">
        <point val="8.44102,7.28966"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.22902,6.97114;8.44102,7.37114"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[0]#</string>
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
            <point val="8.44102,7.28966"/>
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
        <point val="8.44102,7.87127"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,7.55275;8.44102,7.95275"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[1]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,7.87127"/>
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
        <point val="8.44102,8.47237"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,8.15385;8.44102,8.55385"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[2]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,8.47237"/>
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
        <point val="8.44102,9.07347"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,8.75495;8.44102,9.15495"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[3]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,9.07347"/>
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
        <point val="8.44102,9.68927"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,9.37075;8.44102,9.77075"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[4]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,9.68927"/>
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
    <object type="Embed - Text" version="0" id="O145">
      <attribute name="obj_pos">
        <point val="8.44102,10.2654"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,9.94688;8.44102,10.3469"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[5]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,10.2654"/>
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
    <object type="Embed - Text" version="0" id="O146">
      <attribute name="obj_pos">
        <point val="8.44102,10.8916"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,10.5731;8.44102,10.9731"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[6]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,10.8916"/>
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
    <object type="Embed - Text" version="0" id="O147">
      <attribute name="obj_pos">
        <point val="8.44102,11.4854"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,11.1669;8.44102,11.5669"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[7]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,11.4854"/>
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
    <object type="Embed - Text" version="0" id="O148">
      <attribute name="obj_pos">
        <point val="8.44102,12.0634"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,11.7449;8.44102,12.1449"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[8]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,12.0634"/>
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
    <object type="Embed - Text" version="0" id="O149">
      <attribute name="obj_pos">
        <point val="8.44102,12.6627"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,12.3442;8.44102,12.7442"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[9]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,12.6627"/>
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
    <object type="Embed - Text" version="0" id="O150">
      <attribute name="obj_pos">
        <point val="8.44102,13.2638"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,12.9453;8.44102,13.3453"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[10]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,13.2638"/>
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
    <object type="Embed - Text" version="0" id="O151">
      <attribute name="obj_pos">
        <point val="8.44102,13.8722"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,13.5537;8.44102,13.9537"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[11]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,13.8722"/>
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
    <object type="Embed - Text" version="0" id="O152">
      <attribute name="obj_pos">
        <point val="8.44102,14.4984"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,14.1799;8.44102,14.5799"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[12]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,14.4984"/>
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
    <object type="Embed - Text" version="0" id="O153">
      <attribute name="obj_pos">
        <point val="8.44102,15.0215"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,14.703;8.44102,15.103"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[13]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,15.0215"/>
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
    <object type="Embed - Text" version="0" id="O154">
      <attribute name="obj_pos">
        <point val="8.44102,15.6653"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,15.3468;8.44102,15.7468"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[14]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,15.6653"/>
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
    <object type="Embed - Text" version="0" id="O155">
      <attribute name="obj_pos">
        <point val="8.44102,16.2694"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,15.9509;8.44102,16.3509"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[15]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,16.2694"/>
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
    <object type="Embed - Text" version="0" id="O156">
      <attribute name="obj_pos">
        <point val="8.44102,16.8371"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,16.5186;8.44102,16.9186"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[16]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,16.8371"/>
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
    <object type="Embed - Text" version="0" id="O157">
      <attribute name="obj_pos">
        <point val="8.44102,17.4395"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,17.121;8.44102,17.521"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[17]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,17.4395"/>
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
    <object type="Embed - Text" version="0" id="O158">
      <attribute name="obj_pos">
        <point val="8.44102,18.0759"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,17.7574;8.44102,18.1574"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[18]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,18.0759"/>
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
    <object type="Embed - Text" version="0" id="O159">
      <attribute name="obj_pos">
        <point val="8.44102,18.6594"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,18.3409;8.44102,18.7409"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[19]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,18.6594"/>
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
    <object type="Embed - Text" version="0" id="O160">
      <attribute name="obj_pos">
        <point val="8.44102,19.2854"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,18.9669;8.44102,19.3669"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[20]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,19.2854"/>
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
    <object type="Embed - Text" version="0" id="O161">
      <attribute name="obj_pos">
        <point val="8.44102,19.8964"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,19.5779;8.44102,19.9779"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[21]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,19.8964"/>
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
    <object type="Embed - Text" version="0" id="O162">
      <attribute name="obj_pos">
        <point val="8.44102,20.5371"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,20.2186;8.44102,20.6186"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[22]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,20.5371"/>
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
    <object type="Embed - Text" version="0" id="O163">
      <attribute name="obj_pos">
        <point val="8.44102,21.1016"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,20.7831;8.44102,21.1831"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[23]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,21.1016"/>
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
    <object type="Embed - Text" version="0" id="O164">
      <attribute name="obj_pos">
        <point val="8.44102,21.6967"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,21.3782;8.44102,21.7782"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[24]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,21.6967"/>
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
    <object type="Embed - Text" version="0" id="O165">
      <attribute name="obj_pos">
        <point val="8.44102,22.3155"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.19862,21.997;8.44102,22.397"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[25]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.44102,22.3155"/>
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
    <object type="Embed - Text" version="0" id="O166">
      <attribute name="obj_pos">
        <point val="10.3774,7.27189"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.1654,6.95337;10.3774,7.35337"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[0]#</string>
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
            <point val="10.3774,7.27189"/>
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
    <object type="Embed - Text" version="0" id="O167">
      <attribute name="obj_pos">
        <point val="10.3774,7.8785"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,7.55998;10.3774,7.95998"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[1]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,7.8785"/>
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
    <object type="Embed - Text" version="0" id="O168">
      <attribute name="obj_pos">
        <point val="10.3774,8.4796"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,8.16108;10.3774,8.56108"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[2]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,8.4796"/>
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
    <object type="Embed - Text" version="0" id="O169">
      <attribute name="obj_pos">
        <point val="10.3774,9.1057"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,8.78718;10.3774,9.18718"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[3]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,9.1057"/>
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
    <object type="Embed - Text" version="0" id="O170">
      <attribute name="obj_pos">
        <point val="10.3774,9.6715"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,9.35298;10.3774,9.75298"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[4]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,9.6715"/>
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
    <object type="Embed - Text" version="0" id="O171">
      <attribute name="obj_pos">
        <point val="10.3774,10.2476"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,9.92908;10.3774,10.3291"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[5]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,10.2476"/>
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
    <object type="Embed - Text" version="0" id="O172">
      <attribute name="obj_pos">
        <point val="10.3774,10.8738"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,10.5553;10.3774,10.9553"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[6]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,10.8738"/>
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
    <object type="Embed - Text" version="0" id="O173">
      <attribute name="obj_pos">
        <point val="10.3774,11.4852"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,11.1667;10.3774,11.5667"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[7]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,11.4852"/>
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
    <object type="Embed - Text" version="0" id="O174">
      <attribute name="obj_pos">
        <point val="10.3774,12.0706"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,11.7521;10.3774,12.1521"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[8]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,12.0706"/>
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
    <object type="Embed - Text" version="0" id="O175">
      <attribute name="obj_pos">
        <point val="10.3774,12.6699"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,12.3514;10.3774,12.7514"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[9]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,12.6699"/>
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
    <object type="Embed - Text" version="0" id="O176">
      <attribute name="obj_pos">
        <point val="10.3774,13.271"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,12.9525;10.3774,13.3525"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[10]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,13.271"/>
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
    <object type="Embed - Text" version="0" id="O177">
      <attribute name="obj_pos">
        <point val="10.3774,13.8721"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,13.5536;10.3774,13.9536"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[11]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,13.8721"/>
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
    <object type="Embed - Text" version="0" id="O178">
      <attribute name="obj_pos">
        <point val="10.3774,14.5056"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,14.1871;10.3774,14.5871"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[12]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,14.5056"/>
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
    <object type="Embed - Text" version="0" id="O179">
      <attribute name="obj_pos">
        <point val="10.3774,15.0537"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,14.7352;10.3774,15.1352"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[13]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,15.0537"/>
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
    <object type="Embed - Text" version="0" id="O180">
      <attribute name="obj_pos">
        <point val="10.3774,15.6725"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,15.354;10.3774,15.754"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[14]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,15.6725"/>
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
    <object type="Embed - Text" version="0" id="O181">
      <attribute name="obj_pos">
        <point val="10.3774,16.2736"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,15.9551;10.3774,16.3551"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[15]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,16.2736"/>
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
    <object type="Embed - Text" version="0" id="O182">
      <attribute name="obj_pos">
        <point val="10.3774,16.859"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,16.5405;10.3774,16.9405"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[16]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,16.859"/>
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
    <object type="Embed - Text" version="0" id="O183">
      <attribute name="obj_pos">
        <point val="10.3774,17.4217"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,17.1032;10.3774,17.5032"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[17]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,17.4217"/>
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
    <object type="Embed - Text" version="0" id="O184">
      <attribute name="obj_pos">
        <point val="10.3774,18.0581"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,17.7396;10.3774,18.1396"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[18]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,18.0581"/>
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
    <object type="Embed - Text" version="0" id="O185">
      <attribute name="obj_pos">
        <point val="10.3774,18.6593"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,18.3408;10.3774,18.7408"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[19]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,18.6593"/>
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
    <object type="Embed - Text" version="0" id="O186">
      <attribute name="obj_pos">
        <point val="10.3774,19.278"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,18.9595;10.3774,19.3595"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[20]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,19.278"/>
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
    <object type="Embed - Text" version="0" id="O187">
      <attribute name="obj_pos">
        <point val="10.3774,19.8462"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,19.5277;10.3774,19.9277"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[21]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,19.8462"/>
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
    <object type="Embed - Text" version="0" id="O188">
      <attribute name="obj_pos">
        <point val="10.3774,20.4443"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,20.1258;10.3774,20.5258"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[22]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,20.4443"/>
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
    <object type="Embed - Text" version="0" id="O189">
      <attribute name="obj_pos">
        <point val="10.3774,21.1088"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,20.7903;10.3774,21.1903"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[23]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,21.1088"/>
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
    <object type="Embed - Text" version="0" id="O190">
      <attribute name="obj_pos">
        <point val="10.3774,21.7039"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,21.3854;10.3774,21.7854"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[24]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,21.7039"/>
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
    <object type="Embed - Text" version="0" id="O191">
      <attribute name="obj_pos">
        <point val="10.3774,22.3227"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.135,22.0042;10.3774,22.4042"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[25]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3774,22.3227"/>
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
    <object type="Embed - Text" version="0" id="O192">
      <attribute name="obj_pos">
        <point val="10.3902,22.8268"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.6934,22.5083;10.3902,22.9083"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KNKENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3902,22.8268"/>
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
    <object type="Embed - Text" version="0" id="O193">
      <attribute name="obj_pos">
        <point val="18.8614,13.2013"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.1646,12.8828;18.8614,13.2828"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KGKENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="18.8614,13.2013"/>
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
    <object type="Embed - Text" version="0" id="O194">
      <attribute name="obj_pos">
        <point val="10.1662,25.9695"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.4694,25.651;10.1662,26.051"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#FKKENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.1662,25.9695"/>
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
    <object type="Embed - Text" version="0" id="O195">
      <attribute name="obj_pos">
        <point val="10.1784,25.3645"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.4816,25.046;10.1784,25.446"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#NYKENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.1784,25.3645"/>
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
    <object type="Embed - Text" version="0" id="O196">
      <attribute name="obj_pos">
        <point val="10.1975,26.6048"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.5007,26.2863;10.1975,26.6863"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#FRKENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.1975,26.6048"/>
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
        <point val="11.5463,7.20292"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.5463,6.96133;13.0613,7.26133"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKNJANAME[0]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;&#204;&#190;&#163;&#177;#</string>
          </attribute>
          <attribute name="font">
            <font name="Times-Roman"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="11.5463,7.20292"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.07575"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O198">
      <attribute name="obj_pos">
        <point val="11.559,7.80102"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.559,7.55943;13.074,7.85943"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKNJANAME[1]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;&#204;&#190;&#163;&#177;#</string>
          </attribute>
          <attribute name="font">
            <font name="Times-Roman"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="11.559,7.80102"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.07575"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O199">
      <attribute name="obj_pos">
        <point val="11.559,8.36682"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.559,8.12523;13.074,8.42523"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKNJANAME[2]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;&#204;&#190;&#163;&#177;#</string>
          </attribute>
          <attribute name="font">
            <font name="Times-Roman"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="11.559,8.36682"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.07575"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O200">
      <attribute name="obj_pos">
        <point val="11.5767,8.98562"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.5767,8.74403;13.0917,9.04403"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKNJANAME[3]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;&#204;&#190;&#163;&#177;#</string>
          </attribute>
          <attribute name="font">
            <font name="Times-Roman"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="11.5767,8.98562"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.07575"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O201">
      <attribute name="obj_pos">
        <point val="11.559,9.57882"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.559,9.33723;13.074,9.63723"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKNJANAME[4]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;&#204;&#190;&#163;&#177;#</string>
          </attribute>
          <attribute name="font">
            <font name="Times-Roman"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="11.559,9.57882"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.07575"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O202">
      <attribute name="obj_pos">
        <point val="11.559,10.2092"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.559,9.96761;13.074,10.2676"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKNJANAME[5]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;&#204;&#190;&#163;&#177;#</string>
          </attribute>
          <attribute name="font">
            <font name="Times-Roman"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="11.559,10.2092"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.07575"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O203">
      <attribute name="obj_pos">
        <point val="11.559,10.828"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.559,10.5864;13.074,10.8864"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKNJANAME[6]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;&#204;&#190;&#163;&#177;#</string>
          </attribute>
          <attribute name="font">
            <font name="Times-Roman"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="11.559,10.828"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.07575"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O204">
      <attribute name="obj_pos">
        <point val="11.559,11.4584"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.559,11.2168;13.074,11.5168"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKNJANAME[7]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;&#204;&#190;&#163;&#177;#</string>
          </attribute>
          <attribute name="font">
            <font name="Times-Roman"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="11.559,11.4584"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.07575"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O205">
      <attribute name="obj_pos">
        <point val="11.559,12.0096"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.559,11.768;13.074,12.068"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKNJANAME[8]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;&#204;&#190;&#163;&#177;#</string>
          </attribute>
          <attribute name="font">
            <font name="Times-Roman"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="11.559,12.0096"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.07575"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O206">
      <attribute name="obj_pos">
        <point val="11.5413,12.6357"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.5413,12.3941;13.0563,12.6941"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKNJANAME[9]#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#188;&#212;&#204;&#190;&#163;&#177;#</string>
          </attribute>
          <attribute name="font">
            <font name="Times-Roman"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="11.5413,12.6357"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.07575"/>
          </attribute>
          <attribute name="multi">
            <real val="0.1515"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O207">
      <attribute name="obj_pos">
        <point val="18.7435,7.25302"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.5011,6.9345;18.7435,7.3345"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[26]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="18.7435,7.25302"/>
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
        <point val="18.7435,7.85602"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.5011,7.5375;18.7435,7.9375"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[27]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="18.7435,7.85602"/>
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
        <point val="18.7435,8.43632"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.5011,8.1178;18.7435,8.5178"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[28]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="18.7435,8.43632"/>
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
        <point val="18.7435,9.03752"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.5011,8.719;18.7435,9.119"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[29]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="18.7435,9.03752"/>
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
        <point val="18.7362,9.67402"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.4938,9.3555;18.7362,9.7555"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[30]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="18.7362,9.67402"/>
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
        <point val="18.7245,10.275"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.4821,9.95648;18.7245,10.3565"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[31]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="18.7245,10.275"/>
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
        <point val="18.7245,10.8786"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.4821,10.5601;18.7245,10.9601"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[32]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="18.7245,10.8786"/>
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
        <point val="18.7245,11.4767"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.4821,11.1582;18.7245,11.5582"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[33]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="18.7245,11.4767"/>
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
        <point val="18.7245,12.0558"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.4821,11.7373;18.7245,12.1373"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[34]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="18.7245,12.0558"/>
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
        <point val="18.7348,12.6759"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.4924,12.3574;18.7348,12.7574"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#RKENSU[35]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="18.7348,12.6759"/>
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
        <point val="16.9269,7.24852"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.6845,6.93;16.9269,7.33"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[26]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="16.9269,7.24852"/>
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
        <point val="16.9093,7.84972"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.6669,7.5312;16.9093,7.9312"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[27]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="16.9093,7.84972"/>
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
        <point val="16.9269,8.47042"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.6845,8.1519;16.9269,8.5519"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[28]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="16.9269,8.47042"/>
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
        <point val="16.9093,9.05502"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.6669,8.7365;16.9093,9.1365"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[29]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="16.9093,9.05502"/>
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
        <point val="16.9093,9.67382"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.6669,9.3553;16.9093,9.7553"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[30]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="16.9093,9.67382"/>
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
        <point val="16.9196,10.2573"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.6772,9.93878;16.9196,10.3388"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[31]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="16.9196,10.2573"/>
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
        <point val="16.9255,10.8583"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.6831,10.5398;16.9255,10.9398"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[32]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="16.9255,10.8583"/>
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
        <point val="16.9255,11.4619"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.6831,11.1434;16.9255,11.5434"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[33]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="16.9255,11.4619"/>
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
        <point val="16.9255,12.0527"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.6831,11.7342;16.9255,12.1342"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[34]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="16.9255,12.0527"/>
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
        <point val="16.9255,12.6568"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.6831,12.3383;16.9255,12.7383"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#TKENSU[35]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="16.9255,12.6568"/>
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
        <point val="15.0596,7.26622"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8172,6.9477;15.0596,7.3477"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[26]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="15.0596,7.26622"/>
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
        <point val="15.0596,7.86002"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8172,7.5415;15.0596,7.9415"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[27]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="15.0596,7.86002"/>
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
        <point val="15.0596,8.46112"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8172,8.1426;15.0596,8.5426"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[28]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="15.0596,8.46112"/>
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
        <point val="15.0596,9.04652"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8172,8.728;15.0596,9.128"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[29]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="15.0596,9.04652"/>
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
        <point val="15.0596,9.66652"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8172,9.348;15.0596,9.748"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[30]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="15.0596,9.66652"/>
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
        <point val="15.0419,10.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.7995,9.93148;15.0419,10.3315"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[31]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="15.0419,10.25"/>
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
        <point val="15.0346,10.8688"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.7922,10.5503;15.0346,10.9503"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[32]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="15.0346,10.8688"/>
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
        <point val="15.0228,11.4875"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.7804,11.169;15.0228,11.569"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[33]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="15.0228,11.4875"/>
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
        <point val="15.0405,12.0557"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.7981,11.7372;15.0405,12.1372"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[34]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="15.0405,12.0557"/>
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
        <point val="15.0405,12.6995"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.7981,12.381;15.0405,12.781"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#IKENSU[35]#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="15.0405,12.6995"/>
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
        <point val="15.3154,22.825"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.3154,22.5065;17.0122,22.9065"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#999,999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="15.3154,22.825"/>
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
    <object type="Embed - Text" version="0" id="O238">
      <attribute name="obj_pos">
        <point val="11.268,15.025"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.268,14.7065;12.884,15.1065"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[0].KOU-KEN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#229;&#180;&#252;&#184;&#169;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="11.268,15.025"/>
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
    <object type="Embed - Text" version="0" id="O239">
      <attribute name="obj_pos">
        <point val="11.268,15.641"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.268,15.3225;12.884,15.7225"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[1].KOU-KEN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#229;&#180;&#252;&#184;&#169;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="11.268,15.641"/>
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
    <object type="Embed - Text" version="0" id="O240">
      <attribute name="obj_pos">
        <point val="11.268,16.3035"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.268,15.985;12.884,16.385"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[2].KOU-KEN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#229;&#180;&#252;&#184;&#169;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="11.268,16.3035"/>
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
    <object type="Embed - Text" version="0" id="O241">
      <attribute name="obj_pos">
        <point val="11.268,16.841"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.268,16.5225;12.884,16.9225"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[3].KOU-KEN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#229;&#180;&#252;&#184;&#169;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="11.268,16.841"/>
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
    <object type="Embed - Text" version="0" id="O242">
      <attribute name="obj_pos">
        <point val="11.268,17.4535"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.268,17.135;12.884,17.535"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[4].KOU-KEN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#229;&#180;&#252;&#184;&#169;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="11.268,17.4535"/>
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
    <object type="Embed - Text" version="0" id="O243">
      <attribute name="obj_pos">
        <point val="11.268,18.041"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.268,17.7225;12.884,18.1225"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[5].KOU-KEN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#229;&#180;&#252;&#184;&#169;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="11.268,18.041"/>
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
    <object type="Embed - Text" version="0" id="O244">
      <attribute name="obj_pos">
        <point val="11.268,18.6535"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.268,18.335;12.884,18.735"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[6].KOU-KEN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#229;&#180;&#252;&#184;&#169;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="11.268,18.6535"/>
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
    <object type="Embed - Text" version="0" id="O245">
      <attribute name="obj_pos">
        <point val="11.268,19.2285"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.268,18.91;12.884,19.31"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[7].KOU-KEN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#229;&#180;&#252;&#184;&#169;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="11.268,19.2285"/>
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
    <object type="Embed - Text" version="0" id="O246">
      <attribute name="obj_pos">
        <point val="11.268,19.8535"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.268,19.535;12.884,19.935"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[8].KOU-KEN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#229;&#180;&#252;&#184;&#169;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="11.268,19.8535"/>
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
    <object type="Embed - Text" version="0" id="O247">
      <attribute name="obj_pos">
        <point val="11.268,20.441"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.268,20.1225;12.884,20.5225"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[9].KOU-KEN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#229;&#180;&#252;&#184;&#169;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="11.268,20.441"/>
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
    <object type="Embed - Text" version="0" id="O248">
      <attribute name="obj_pos">
        <point val="11.268,21.0285"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.268,20.71;12.884,21.11"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[10].KOU-KEN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#229;&#180;&#252;&#184;&#169;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="11.268,21.0285"/>
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
    <object type="Embed - Text" version="0" id="O249">
      <attribute name="obj_pos">
        <point val="11.268,21.6535"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.268,21.335;12.884,21.735"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[11].KOU-KEN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#229;&#180;&#252;&#184;&#169;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="11.268,21.6535"/>
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
    <object type="Embed - Text" version="0" id="O250">
      <attribute name="obj_pos">
        <point val="11.268,22.241"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.268,21.9225;12.884,22.3225"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[12].KOU-KEN#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#229;&#180;&#252;&#184;&#169;&#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="11.268,22.241"/>
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
    <object type="Embed - Text" version="0" id="O251">
      <attribute name="obj_pos">
        <point val="15.7512,14.9625"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7512,14.644;16.9632,15.044"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[0].KOU-KENSU#</string>
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
            <point val="15.7512,14.9625"/>
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
    <object type="Embed - Text" version="0" id="O252">
      <attribute name="obj_pos">
        <point val="15.7512,15.591"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7512,15.2725;16.9632,15.6725"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[1].KOU-KENSU#</string>
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
            <point val="15.7512,15.591"/>
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
    <object type="Embed - Text" version="0" id="O253">
      <attribute name="obj_pos">
        <point val="15.7512,16.1785"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7512,15.86;16.9632,16.26"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[2].KOU-KENSU#</string>
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
            <point val="15.7512,16.1785"/>
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
    <object type="Embed - Text" version="0" id="O254">
      <attribute name="obj_pos">
        <point val="15.7512,16.816"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7512,16.4975;16.9632,16.8975"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[3].KOU-KENSU#</string>
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
            <point val="15.7512,16.816"/>
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
        <point val="15.7512,17.366"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7512,17.0475;16.9632,17.4475"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[4].KOU-KENSU#</string>
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
            <point val="15.7512,17.366"/>
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
    <object type="Embed - Text" version="0" id="O256">
      <attribute name="obj_pos">
        <point val="15.7512,17.9535"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7512,17.635;16.9632,18.035"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[5].KOU-KENSU#</string>
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
            <point val="15.7512,17.9535"/>
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
    <object type="Embed - Text" version="0" id="O257">
      <attribute name="obj_pos">
        <point val="15.7512,18.541"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7512,18.2225;16.9632,18.6225"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[6].KOU-KENSU#</string>
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
            <point val="15.7512,18.541"/>
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
    <object type="Embed - Text" version="0" id="O258">
      <attribute name="obj_pos">
        <point val="15.7512,19.166"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7512,18.8475;16.9632,19.2475"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[7].KOU-KENSU#</string>
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
            <point val="15.7512,19.166"/>
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
    <object type="Embed - Text" version="0" id="O259">
      <attribute name="obj_pos">
        <point val="15.7512,19.791"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7512,19.4725;16.9632,19.8725"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[8].KOU-KENSU#</string>
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
            <point val="15.7512,19.791"/>
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
    <object type="Embed - Text" version="0" id="O260">
      <attribute name="obj_pos">
        <point val="15.7512,20.391"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7512,20.0725;16.9632,20.4725"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[9].KOU-KENSU#</string>
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
            <point val="15.7512,20.391"/>
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
    <object type="Embed - Text" version="0" id="O261">
      <attribute name="obj_pos">
        <point val="15.7512,20.9535"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7512,20.635;16.9632,21.035"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[10].KOU-KENSU#</string>
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
            <point val="15.7512,20.9535"/>
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
    <object type="Embed - Text" version="0" id="O262">
      <attribute name="obj_pos">
        <point val="15.7512,21.5785"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.7512,21.26;16.9632,21.66"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[11].KOU-KENSU#</string>
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
            <point val="15.7512,21.5785"/>
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
    <object type="Embed - Text" version="0" id="O263">
      <attribute name="obj_pos">
        <point val="15.8002,22.1285"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.8002,21.81;17.0122,22.21"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KOUKI[12].KOU-KENSU#</string>
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
            <point val="15.8002,22.1285"/>
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
    <object type="Embed - Text" version="0" id="O264">
      <attribute name="obj_pos">
        <point val="9.57959,2.36046"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.57959,2.04194;11.5996,2.44194"/>
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
            <point val="9.57959,2.36046"/>
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
