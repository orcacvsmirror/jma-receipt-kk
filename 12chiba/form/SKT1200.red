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
    <element name="SEIKYU-TBL" occurs="3">
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
        <point val="14.1865,23.2973"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.1715,23.2823;19.5015,26.4623"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="14.1865,23.2973"/>
      </attribute>
      <attribute name="elem_width">
        <real val="5.3"/>
      </attribute>
      <attribute name="elem_height">
        <real val="3.15"/>
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
        <point val="1.55555,4.60753"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.54055,4.59253;19.5051,13.0301"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="1.55555,4.60753"/>
      </attribute>
      <attribute name="elem_width">
        <real val="17.9345"/>
      </attribute>
      <attribute name="elem_height">
        <real val="8.40754"/>
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
        <point val="1.54873,13.5234"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.53373,13.5084;19.4872,22.4803"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="1.54873,13.5234"/>
      </attribute>
      <attribute name="elem_width">
        <real val="17.9235"/>
      </attribute>
      <attribute name="elem_height">
        <real val="8.94186"/>
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
        <point val="1.55555,4.60753"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.55055,4.60253;19.4951,4.61253"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.55555,4.60753"/>
        <point val="19.4901,4.60753"/>
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
        <point val="1.55555,4.60753"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.55055,4.60253;1.56055,13.0201"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.55555,4.60753"/>
        <point val="1.55555,13.0151"/>
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
        <point val="1.55555,13.0151"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.55055,13.0101;19.4951,13.0201"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.55555,13.0151"/>
        <point val="19.4901,13.0151"/>
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
        <connection handle="0" to="O1" connection="5"/>
        <connection handle="1" to="O1" connection="7"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O6">
      <attribute name="obj_pos">
        <point val="19.4901,4.60753"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="19.4851,4.60253;19.4951,13.0201"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="19.4901,4.60753"/>
        <point val="19.4901,13.0151"/>
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
        <point val="1.54873,13.5234"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.54373,13.5184;1.55373,22.4703"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.54873,13.5234"/>
        <point val="1.54873,22.4653"/>
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
    <object type="Standard - Line" version="0" id="O8">
      <attribute name="obj_pos">
        <point val="19.4722,13.5234"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="19.4672,13.5184;19.4772,22.4703"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="19.4722,13.5234"/>
        <point val="19.4722,22.4653"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O2" connection="2"/>
        <connection handle="1" to="O2" connection="7"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O9">
      <attribute name="obj_pos">
        <point val="4.32858,8.08529"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.32358,8.08029;4.33439,13.0194"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4.32858,8.08529"/>
        <point val="4.32939,13.0144"/>
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
        <point val="6.64266,8.81605"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.63766,8.81105;6.65018,13.0194"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.64266,8.81605"/>
        <point val="6.64518,13.0144"/>
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
        <point val="9.23901,8.80944"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.23401,8.80444;9.24445,13.035"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="9.23901,8.80944"/>
        <point val="9.23945,13.03"/>
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
        <point val="11.8682,8.06861"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.8627,8.06361;11.8732,13.026"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="11.8682,8.06861"/>
        <point val="11.8677,13.021"/>
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
        <point val="13.6566,8.80773"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.6516,8.80273;13.6639,13.0304"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.6566,8.80773"/>
        <point val="13.6589,13.0254"/>
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
        <point val="17.1001,8.80899"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.0944,8.80399;17.1051,13.0194"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.1001,8.80899"/>
        <point val="17.0994,13.0144"/>
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
        <point val="4.39997,13.5251"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.39497,13.5201;4.40717,22.4743"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4.39997,13.5251"/>
        <point val="4.40217,22.4693"/>
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
        <point val="6.66997,14.2898"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.66497,14.2848;6.67612,22.4812"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="6.66997,14.2898"/>
        <point val="6.67112,22.4762"/>
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
        <point val="9.24497,14.2898"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.23997,14.2848;9.25062,22.4868"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="9.24497,14.2898"/>
        <point val="9.24562,22.4818"/>
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
        <point val="11.8566,13.5501"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.8498,13.5451;11.8616,22.4868"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="11.8566,13.5501"/>
        <point val="11.8548,22.4818"/>
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
        <point val="13.6716,14.2829"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.6666,14.2779;13.6779,22.4824"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.6716,14.2829"/>
        <point val="13.6729,22.4774"/>
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
        <point val="17.1535,14.2874"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.1454,14.2824;17.1585,22.4989"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.1535,14.2874"/>
        <point val="17.1504,22.4939"/>
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
        <point val="1.57314,8.08629"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.56814,8.08014;19.4883,8.09129"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.57314,8.08629"/>
        <point val="19.4833,8.08514"/>
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
        <point val="2.40038,11.8891"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.39538,11.8747;19.4911,11.8941"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.40038,11.8891"/>
        <point val="19.4861,11.8797"/>
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
        <point val="2.42343,10.7028"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.41843,10.6978;19.4899,10.7082"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.42343,10.7028"/>
        <point val="19.4849,10.7032"/>
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
    <object type="Standard - Line" version="0" id="O24">
      <attribute name="obj_pos">
        <point val="1.54081,9.54399"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.53581,9.53821;19.4844,9.54899"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.54081,9.54399"/>
        <point val="19.4794,9.54321"/>
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
    <object type="Standard - Line" version="0" id="O25">
      <attribute name="obj_pos">
        <point val="4.32955,8.80944"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.32455,8.80444;19.4951,8.8163"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4.32955,8.80944"/>
        <point val="19.4901,8.8113"/>
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
        <connection handle="1" to="O1" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O26">
      <attribute name="obj_pos">
        <point val="10.5205,3.5763"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5055,3.55194;19.5091,3.5913"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.5205,3.5763"/>
        <point val="19.4941,3.56694"/>
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
    <object type="Standard - Line" version="0" id="O27">
      <attribute name="obj_pos">
        <point val="2.40472,9.54252"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.39897,9.53752;2.40972,13.026"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.40472,9.54252"/>
        <point val="2.40397,13.021"/>
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
        <point val="4.40483,14.2874"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.39983,14.2824;19.4767,14.2931"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4.40483,14.2874"/>
        <point val="19.4717,14.2881"/>
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
        <point val="3.20205,15.7624"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.19705,15.7574;19.4635,15.7739"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.20205,15.7624"/>
        <point val="19.4585,15.7689"/>
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
        <point val="2.36865,16.5109"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.36365,16.5059;19.4832,16.5163"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.36865,16.5109"/>
        <point val="19.4782,16.5113"/>
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
        <point val="3.21264,17.2773"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.20764,17.2723;19.4815,17.2837"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.21264,17.2773"/>
        <point val="19.4765,17.2787"/>
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
        <point val="2.375,15.025"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.37,15.02;19.4899,15.0328"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.375,15.025"/>
        <point val="19.4849,15.0278"/>
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
        <point val="2.36397,17.9893"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.35897,17.9843;19.4772,17.9993"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.36397,17.9893"/>
        <point val="19.4722,17.9943"/>
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
        <connection handle="1" to="O8" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O34">
      <attribute name="obj_pos">
        <point val="3.1992,18.7456"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.1942,18.7384;19.4965,18.7506"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.1992,18.7456"/>
        <point val="19.4915,18.7434"/>
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
        <connection handle="0" to="O40" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O35">
      <attribute name="obj_pos">
        <point val="3.19164,20.2383"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.18664,20.2323;19.4709,20.2433"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.19164,20.2383"/>
        <point val="19.4659,20.2373"/>
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
        <point val="1.5404,21.0286"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.5354,21.0197;19.4925,21.0336"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.5404,21.0286"/>
        <point val="19.4875,21.0247"/>
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
    <object type="Standard - Line" version="0" id="O37">
      <attribute name="obj_pos">
        <point val="3.19424,21.7306"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.18924,21.7256;19.4762,21.7356"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.19424,21.7306"/>
        <point val="19.4712,21.7306"/>
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
    <object type="Standard - Line" version="0" id="O38">
      <attribute name="obj_pos">
        <point val="2.37132,19.4776"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.36632,19.4726;19.4711,19.4856"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.37132,19.4776"/>
        <point val="19.4661,19.4806"/>
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
        <point val="2.36865,13.5452"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.36317,13.5402;2.37365,20.9809"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.36865,13.5452"/>
        <point val="2.36817,20.9759"/>
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
        <point val="3.20121,15.0261"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.1922,15.0211;3.20621,22.47"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.20121,15.0261"/>
        <point val="3.1972,22.465"/>
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
        <point val="1.54923,20.9756"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.54423,20.9706;19.4774,20.9833"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.54923,20.9756"/>
        <point val="19.4724,20.9783"/>
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
    <object type="Standard - Line" version="0" id="O42">
      <attribute name="obj_pos">
        <point val="10.5198,3.5549"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5048,3.5399;10.5378,4.62253"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.5198,3.5549"/>
        <point val="10.5228,4.60753"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.03"/>
      </attribute>
      <connections>
        <connection handle="1" to="O3" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O43">
      <attribute name="obj_pos">
        <point val="14.8602,24.8598"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8552,24.8523;15.5352,24.8648"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.8602,24.8598"/>
        <point val="15.5302,24.8573"/>
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
        <connection handle="0" to="O44" connection="0"/>
        <connection handle="1" to="O45" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O44">
      <attribute name="obj_pos">
        <point val="14.8602,23.2848"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8552,23.2798;14.8652,26.4398"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.8602,23.2848"/>
        <point val="14.8602,26.4348"/>
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
        <point val="15.5302,23.2823"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.5252,23.2773;15.5352,26.4373"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.5302,23.2823"/>
        <point val="15.5302,26.4323"/>
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
        <point val="14.8552,24.0473"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8502,24.0398;15.5302,24.0523"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.8552,24.0473"/>
        <point val="15.5252,24.0448"/>
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
    <object type="Standard - Line" version="0" id="O47">
      <attribute name="obj_pos">
        <point val="14.8552,25.6848"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8502,25.6773;15.5302,25.6898"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.8552,25.6848"/>
        <point val="15.5252,25.6823"/>
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
        <point val="1.54873,13.5234"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.53373,13.5084;19.4872,13.5384"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.54873,13.5234"/>
        <point val="19.4722,13.5234"/>
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
      <connections>
        <connection handle="0" to="O2" connection="0"/>
        <connection handle="1" to="O2" connection="2"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O49">
      <attribute name="obj_pos">
        <point val="1.54873,22.4653"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.54373,22.4603;19.4772,22.4703"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.54873,22.4653"/>
        <point val="19.4722,22.4653"/>
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
        <connection handle="0" to="O2" connection="5"/>
        <connection handle="1" to="O2" connection="7"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O50">
      <attribute name="obj_pos">
        <point val="19.4941,3.56694"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="19.4751,3.55194;19.5091,4.62253"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="19.4941,3.56694"/>
        <point val="19.4901,4.60753"/>
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
  </layer>
  <layer name="&#202;&#184;&#187;&#250;" visible="true">
    <object type="Standard - Text" version="0" id="O51">
      <attribute name="obj_pos">
        <point val="7.36681,5.40998"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.36681,5.10823;14.3237,5.50823"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#241;&#204;&#177;&#183;&#242;&#185;&#175;&#202;&#221;&#184;&#177;&#191;&#199;&#206;&#197;&#202;&#243;&#189;&#183;&#193;&#237;&#179;&#231;&#201;&#188;(&#176;&#229;&#161;&#166;&#187;&#245;)#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="7.36681,5.40998"/>
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
    <object type="Standard - Text" version="0" id="O52">
      <attribute name="obj_pos">
        <point val="10.77,4.02463"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.77,3.76059;12.184,4.46059"/>
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
            <point val="10.77,4.02463"/>
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
    <object type="Standard - Text" version="0" id="O53">
      <attribute name="obj_pos">
        <point val="4.8,7.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.8,7.23596;5.1535,7.58596"/>
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
            <real val="0.215635"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O54">
      <attribute name="obj_pos">
        <point val="7.83072,6.12382"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.83072,5.85978;10.3052,6.55978"/>
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
            <point val="7.83072,6.12382"/>
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
    <object type="Standard - Text" version="0" id="O55">
      <attribute name="obj_pos">
        <point val="7.83072,7.29095"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.83072,7.02691;9.24472,7.37691"/>
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
            <point val="7.83072,7.29095"/>
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
    <object type="Standard - Text" version="0" id="O56">
      <attribute name="obj_pos">
        <point val="7.83072,7.81012"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.83072,7.54608;9.59822,7.89608"/>
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
            <point val="7.83072,7.81012"/>
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
    <object type="Standard - Text" version="0" id="O57">
      <attribute name="obj_pos">
        <point val="2.33068,8.96839"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.33068,8.70435;3.46895,9.05435"/>
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
            <point val="2.33068,8.96839"/>
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
    <object type="Standard - Text" version="0" id="O58">
      <attribute name="obj_pos">
        <point val="6.25144,8.55639"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.25144,8.29235;10.6066,8.64235"/>
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
            <real val="0.215635"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O59">
      <attribute name="obj_pos">
        <point val="13.3766,8.55639"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.3766,8.29235;18.2832,8.64235"/>
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
            <real val="0.215635"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O60">
      <attribute name="obj_pos">
        <point val="4.83002,9.28124"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.83002,9.0172;6.32179,9.3672"/>
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
            <real val="0.215635"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O61">
      <attribute name="obj_pos">
        <point val="7.22699,9.28124"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.22699,9.0172;8.71876,9.3672"/>
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
            <real val="0.215635"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O62">
      <attribute name="obj_pos">
        <point val="9.79874,9.28124"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.79874,9.0172;11.2905,9.3672"/>
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
            <real val="0.215635"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O63">
      <attribute name="obj_pos">
        <point val="12.35,9.28124"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.35,9.0172;13.2726,9.3672"/>
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
            <point val="12.35,9.28124"/>
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
    <object type="Standard - Text" version="0" id="O64">
      <attribute name="obj_pos">
        <point val="14.6113,9.28124"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.6113,9.0172;16.6121,9.3672"/>
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
            <point val="14.6113,9.28124"/>
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
    <object type="Standard - Text" version="0" id="O65">
      <attribute name="obj_pos">
        <point val="17.4875,9.28124"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.4875,9.0172;19.255,9.3672"/>
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
            <real val="0.215635"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O66">
      <attribute name="obj_pos">
        <point val="2.59884,10.3615"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.59884,10.0975;4.16838,10.4475"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254;    &#177;&#161;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="2.59884,10.3615"/>
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
    <object type="Standard - Text" version="0" id="O67">
      <attribute name="obj_pos">
        <point val="2.65926,11.4292"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.65926,11.1652;4.15103,11.5152"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#254; &#177;&#161; &#179;&#176;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="2.65926,11.4292"/>
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
    <object type="Standard - Text" version="0" id="O68">
      <attribute name="obj_pos">
        <point val="3.16462,12.5762"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.16462,12.3122;3.51812,12.6622"/>
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
            <point val="3.16462,12.5762"/>
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
    <object type="Standard - Text" version="0" id="O69">
      <attribute name="obj_pos">
        <point val="1.8445,10.6037"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.8445,10.3397;2.198,12.0897"/>
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
            <point val="1.8445,10.6037"/>
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
    <object type="Standard - Text" version="0" id="O70">
      <attribute name="obj_pos">
        <point val="5.0063,14.8022"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.0063,14.5382;6.14457,14.8882"/>
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
            <point val="5.0063,14.8022"/>
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
    <object type="Standard - Text" version="0" id="O71">
      <attribute name="obj_pos">
        <point val="7.35783,14.8022"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.35783,14.5382;8.4961,14.8882"/>
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
            <point val="7.35783,14.8022"/>
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
    <object type="Standard - Text" version="0" id="O72">
      <attribute name="obj_pos">
        <point val="9.94406,14.8022"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.94406,14.5382;11.0823,14.8882"/>
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
            <point val="9.94406,14.8022"/>
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
    <object type="Standard - Text" version="0" id="O73">
      <attribute name="obj_pos">
        <point val="12.2207,14.8022"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.2207,14.5382;13.359,14.8882"/>
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
            <point val="12.2207,14.8022"/>
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
    <object type="Standard - Text" version="0" id="O74">
      <attribute name="obj_pos">
        <point val="14.7455,14.8022"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.7455,14.5382;15.8838,14.8882"/>
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
            <point val="14.7455,14.8022"/>
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
    <object type="Standard - Text" version="0" id="O75">
      <attribute name="obj_pos">
        <point val="17.4406,14.8022"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.4406,14.5382;19.2081,14.8882"/>
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
            <point val="17.4406,14.8022"/>
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
    <object type="Standard - Text" version="0" id="O76">
      <attribute name="obj_pos">
        <point val="2.63961,14.4693"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.63961,14.2053;3.99351,14.5553"/>
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
            <point val="2.63961,14.4693"/>
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
    <object type="Standard - Text" version="0" id="O77">
      <attribute name="obj_pos">
        <point val="1.97745,21.7222"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.97745,21.4582;2.68445,22.1582"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#162;&#168;
&#183;&#232;&#196;&#234;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="1.97745,21.7222"/>
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
    <object type="Standard - Text" version="0" id="O78">
      <attribute name="obj_pos">
        <point val="6.54131,14.08"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.54131,13.816;10.0339,14.166"/>
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
            <point val="6.54131,14.08"/>
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
    <object type="Standard - Text" version="0" id="O79">
      <attribute name="obj_pos">
        <point val="3.33369,15.5302"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.33369,15.2662;4.25632,15.6162"/>
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
            <point val="3.33369,15.5302"/>
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
    <object type="Standard - Text" version="0" id="O80">
      <attribute name="obj_pos">
        <point val="3.25289,16.3049"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.25289,16.0409;4.31339,16.3909"/>
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
            <point val="3.25289,16.3049"/>
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
    <object type="Standard - Text" version="0" id="O81">
      <attribute name="obj_pos">
        <point val="3.33369,17.0023"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.33369,16.7383;4.25632,17.0883"/>
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
            <point val="3.33369,17.0023"/>
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
    <object type="Standard - Text" version="0" id="O82">
      <attribute name="obj_pos">
        <point val="3.25289,17.8144"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.25289,17.5504;4.31339,17.9004"/>
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
            <point val="3.25289,17.8144"/>
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
    <object type="Standard - Text" version="0" id="O83">
      <attribute name="obj_pos">
        <point val="3.33369,18.503"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.33369,18.239;4.25632,18.589"/>
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
            <point val="3.33369,18.503"/>
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
    <object type="Standard - Text" version="0" id="O84">
      <attribute name="obj_pos">
        <point val="3.25289,19.3152"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.25289,19.0512;4.31339,19.4012"/>
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
            <point val="3.25289,19.3152"/>
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
    <object type="Standard - Text" version="0" id="O85">
      <attribute name="obj_pos">
        <point val="3.33369,19.9861"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.33369,19.7221;4.25632,20.0721"/>
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
            <point val="3.33369,19.9861"/>
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
    <object type="Standard - Text" version="0" id="O86">
      <attribute name="obj_pos">
        <point val="3.25289,20.7982"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.25289,20.5342;4.31339,20.8842"/>
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
            <point val="3.25289,20.7982"/>
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
    <object type="Standard - Text" version="0" id="O87">
      <attribute name="obj_pos">
        <point val="3.35092,21.5221"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.35092,21.2581;4.27355,21.6081"/>
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
            <point val="3.35092,21.5221"/>
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
    <object type="Standard - Text" version="0" id="O88">
      <attribute name="obj_pos">
        <point val="3.23738,22.2459"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.23738,21.9819;4.29788,22.3319"/>
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
            <point val="3.23738,22.2459"/>
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
    <object type="Standard - Text" version="0" id="O89">
      <attribute name="obj_pos">
        <point val="1.82739,15.3872"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.82739,15.1232;2.18089,19.3232"/>
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
            <point val="1.82739,15.3872"/>
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
    <object type="Standard - Text" version="0" id="O90">
      <attribute name="obj_pos">
        <point val="2.63637,15.5494"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.63637,15.2854;2.98987,16.3354"/>
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
            <point val="2.63637,15.5494"/>
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
    <object type="Standard - Text" version="0" id="O91">
      <attribute name="obj_pos">
        <point val="2.63637,16.9671"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.63637,16.7031;2.98987,17.7531"/>
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
            <point val="2.63637,16.9671"/>
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
    <object type="Standard - Text" version="0" id="O92">
      <attribute name="obj_pos">
        <point val="2.63637,18.4979"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.63637,18.2339;2.98987,19.2839"/>
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
            <point val="2.63637,18.4979"/>
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
    <object type="Standard - Text" version="0" id="O93">
      <attribute name="obj_pos">
        <point val="2.63637,19.9155"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.63637,19.6515;2.98987,20.7015"/>
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
            <point val="2.63637,19.9155"/>
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
    <object type="Standard - Text" version="0" id="O94">
      <attribute name="obj_pos">
        <point val="2.78084,23.309"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.78084,23.045;7.72984,23.395"/>
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
            <point val="2.78084,23.309"/>
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
    <object type="Standard - Text" version="0" id="O95">
      <attribute name="obj_pos">
        <point val="14.5622,23.8498"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.3855,23.5858;14.739,26.0358"/>
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
            <point val="14.5622,23.8498"/>
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
    <object type="Standard - Text" version="0" id="O96">
      <attribute name="obj_pos">
        <point val="15.2153,23.7525"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.0385,23.4885;15.392,23.8385"/>
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
            <point val="15.2153,23.7525"/>
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
    <object type="Standard - Text" version="0" id="O97">
      <attribute name="obj_pos">
        <point val="15.2153,24.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.0385,24.336;15.392,24.686"/>
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
            <point val="15.2153,24.6"/>
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
    <object type="Standard - Text" version="0" id="O98">
      <attribute name="obj_pos">
        <point val="15.2153,25.3945"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.0385,25.1305;15.392,25.4805"/>
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
            <point val="15.2153,25.3945"/>
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
    <object type="Standard - Text" version="0" id="O99">
      <attribute name="obj_pos">
        <point val="15.2153,26.1537"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.0385,25.8897;15.392,26.2397"/>
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
            <point val="15.2153,26.1537"/>
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
    <object type="Standard - Text" version="0" id="O100">
      <attribute name="obj_pos">
        <point val="12.6823,5.51472"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.6823,4.98665;13.3893,5.68665"/>
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
            <point val="12.6823,5.51472"/>
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
    <object type="Standard - Text" version="0" id="O101">
      <attribute name="obj_pos">
        <point val="13.3251,14.0786"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.3251,13.8146;18.2317,14.1646"/>
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
            <point val="13.3251,14.0786"/>
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
  </layer>
  <layer name="&#186;&#185;&#164;&#183;&#185;&#254;&#164;&#223;" visible="true">
    <object type="Embed - Text" version="0" id="O102">
      <attribute name="obj_pos">
        <point val="4.8,7.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.52346,7.23596;4.8,7.58596"/>
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
            <real val="0.215635"/>
          </attribute>
          <attribute name="multi">
            <real val="0.17675"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O103">
      <attribute name="obj_pos">
        <point val="13.4,4.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.4,3.77193;17.7127,4.47193"/>
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
            <real val="0.43127"/>
          </attribute>
          <attribute name="multi">
            <real val="0.3535"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O104">
      <attribute name="obj_pos">
        <point val="10.5,5.8982"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5,5.67188;18.075,6.27188"/>
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
            <point val="10.5,5.8982"/>
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
    <object type="Embed - Text" version="0" id="O105">
      <attribute name="obj_pos">
        <point val="10.5,6.65608"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5,6.42976;16.56,7.02976"/>
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
            <point val="10.5,6.65608"/>
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
    <object type="Embed - Text" version="0" id="O106">
      <attribute name="obj_pos">
        <point val="10.5,7.85361"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.5,7.55186;18.58,7.95186"/>
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
            <point val="10.5,7.85361"/>
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
    <object type="Embed - Text" version="0" id="O107">
      <attribute name="obj_pos">
        <point val="10.4177,7.42129"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.4177,7.11954;14.1143,7.51954"/>
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
            <point val="10.4177,7.42129"/>
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
    <object type="Embed - Text" version="0" id="O108">
      <attribute name="obj_pos">
        <point val="6.35,10.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.87136,9.99825;6.35,10.3982"/>
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
            <point val="6.35,10.3"/>
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
    <object type="Embed - Text" version="0" id="O109">
      <attribute name="obj_pos">
        <point val="9.15,10.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.6856,9.99825;9.15,10.3982"/>
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
            <point val="9.15,10.3"/>
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
    <object type="Embed - Text" version="0" id="O110">
      <attribute name="obj_pos">
        <point val="13.5,10.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.0214,9.99825;13.5,10.3982"/>
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
            <point val="13.5,10.3"/>
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
        <point val="16.85,10.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.3856,9.99825;16.85,10.3982"/>
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
            <point val="16.85,10.3"/>
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
        <point val="19.4,10.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.182,9.99825;19.4,10.3982"/>
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
            <point val="19.4,10.3"/>
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
    <object type="Embed - Text" version="0" id="O113">
      <attribute name="obj_pos">
        <point val="6.35,11.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.87136,11.0982;6.35,11.4982"/>
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
            <point val="6.35,11.4"/>
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
    <object type="Embed - Text" version="0" id="O114">
      <attribute name="obj_pos">
        <point val="9.15,11.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.6856,11.0982;9.15,11.4982"/>
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
            <point val="9.15,11.4"/>
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
    <object type="Embed - Text" version="0" id="O115">
      <attribute name="obj_pos">
        <point val="13.5,11.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.0214,11.0982;13.5,11.4982"/>
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
            <point val="13.5,11.4"/>
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
    <object type="Embed - Text" version="0" id="O116">
      <attribute name="obj_pos">
        <point val="16.85,11.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.3856,11.0982;16.85,11.4982"/>
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
            <point val="16.85,11.4"/>
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
    <object type="Embed - Text" version="0" id="O117">
      <attribute name="obj_pos">
        <point val="19.4,11.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.182,11.0982;19.4,11.4982"/>
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
            <point val="19.4,11.4"/>
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
    <object type="Embed - Text" version="0" id="O118">
      <attribute name="obj_pos">
        <point val="6.35,12.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.87136,12.3482;6.35,12.7482"/>
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
            <point val="6.35,12.65"/>
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
    <object type="Embed - Text" version="0" id="O119">
      <attribute name="obj_pos">
        <point val="9.15,12.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.6856,12.3482;9.15,12.7482"/>
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
            <point val="9.15,12.65"/>
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
    <object type="Embed - Text" version="0" id="O120">
      <attribute name="obj_pos">
        <point val="13.5,12.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.0214,12.3482;13.5,12.7482"/>
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
            <point val="13.5,12.65"/>
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
    <object type="Embed - Text" version="0" id="O121">
      <attribute name="obj_pos">
        <point val="16.85,12.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.3856,12.3482;16.85,12.7482"/>
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
            <point val="16.85,12.65"/>
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
    <object type="Embed - Text" version="0" id="O122">
      <attribute name="obj_pos">
        <point val="19.4,12.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.182,12.3482;19.4,12.7482"/>
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
            <point val="19.4,12.65"/>
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
  </layer>
</diagram>
