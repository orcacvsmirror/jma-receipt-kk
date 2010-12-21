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
        <embed object="string" length="14"/>
      </appinfo>
    </element>
    <element name="KAMOKU" occurs="1">
      <appinfo>
        <embed object="string" length="26"/>
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
    <element name="KAISETUNAME" occurs="1">
      <appinfo>
        <embed object="string" length="40"/>
      </appinfo>
    </element>
    <element name="TEL" occurs="1">
      <appinfo>
        <embed object="string" length="15"/>
      </appinfo>
    </element>
    <element name="SEIKYUYMD" occurs="1">
      <appinfo>
        <embed object="string" length="22"/>
      </appinfo>
    </element>
    <element name="TOKUBETU" occurs="1">
      <appinfo>
        <embed object="string" length="10"/>
      </appinfo>
    </element>
    <element name="SYUKEI-TBL" occurs="3">
      <element name="NYUGAI-TBL" occurs="2">
        <element name="HKN-TBL" occurs="4">
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
      </element>
      <element name="KINGK" occurs="1">
        <appinfo>
          <embed object="string" length="9"/>
        </appinfo>
      </element>
      <element name="RKINGK" occurs="1">
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
          <string>#A5#</string>
        </attribute>
        <attribute name="pswidth">
          <real val="14.85"/>
        </attribute>
        <attribute name="psheight">
          <real val="21"/>
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
          <boolean val="false"/>
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
        <point val="1,5.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.98,5.93;20.02,13.9513"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="1,5.95"/>
      </attribute>
      <attribute name="elem_width">
        <real val="19"/>
      </attribute>
      <attribute name="elem_height">
        <real val="7.98132"/>
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
        <point val="10.5,2.27439"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.48,2.25439;20.02,3.54439"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="10.5,2.27439"/>
      </attribute>
      <attribute name="elem_width">
        <real val="9.5"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1.25"/>
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
        <point val="12.15,2.27439"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.14,2.26439;12.16,3.53439"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.15,2.27439"/>
        <point val="12.15,3.52439"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O3">
      <attribute name="obj_pos">
        <point val="14.45,2.27439"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.44,2.26439;14.46,3.53439"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.45,2.27439"/>
        <point val="14.45,3.52439"/>
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
        <point val="12.15,2.89939"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.14,2.88939;20.01,2.90939"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.15,2.89939"/>
        <point val="20,2.89939"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <connections>
        <connection handle="0" to="O2" connection="0"/>
        <connection handle="1" to="O1" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O5">
      <attribute name="obj_pos">
        <point val="1,9.81566"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,9.80566;20.01,9.82566"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,9.81566"/>
        <point val="20,9.81566"/>
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
        <point val="1,7.93132"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,7.92132;20.01,7.94132"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,7.93132"/>
        <point val="20,7.93132"/>
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
        <point val="1,11.9313"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,11.9213;20.01,11.9413"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,11.9313"/>
        <point val="20,11.9313"/>
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
        <point val="3.50389,5.925"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.49,5.915;3.51389,13.9413"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.50389,5.925"/>
        <point val="3.5,13.9313"/>
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
        <point val="2,7.93132"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.99,7.92132;2.01,13.9413"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,7.93132"/>
        <point val="2,13.9313"/>
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
        <point val="3.5,6.49952"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.49,6.48952;17.51,6.50952"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.5,6.49952"/>
        <point val="17.5,6.49952"/>
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
        <point val="5.00389,7.14033"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.99,7.13033;5.01389,13.9413"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.00389,7.14033"/>
        <point val="5,13.9313"/>
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
        <point val="7.00242,6.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.99,6.49;7.01242,13.9413"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="7.00242,6.5"/>
        <point val="7,13.9313"/>
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
        <point val="8.52889,7.14033"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.49,7.13033;8.53889,13.9413"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="8.52889,7.14033"/>
        <point val="8.5,13.9313"/>
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
        <point val="10.5,6.49952"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.49,6.48952;10.51,13.9413"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.5,6.49952"/>
        <point val="10.5,13.9313"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <connections>
        <connection handle="0" to="O10" connection="0"/>
        <connection handle="1" to="O0" connection="6"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O15">
      <attribute name="obj_pos">
        <point val="12.0039,7.11533"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.99,7.10533;12.0139,13.9413"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.0039,7.11533"/>
        <point val="12,13.9313"/>
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
        <point val="14.0024,6.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.99,6.49;14.0124,13.9413"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.0024,6.5"/>
        <point val="14,13.9313"/>
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
        <point val="17.5039,5.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.49,5.94;17.5139,13.9413"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.5039,5.95"/>
        <point val="17.5,13.9313"/>
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
        <point val="15.5039,7.11533"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.49,7.10533;15.5139,13.9413"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.5039,7.11533"/>
        <point val="15.5,13.9313"/>
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
        <point val="2,8.93132"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.99,8.92132;20.01,8.94132"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,8.93132"/>
        <point val="20,8.93132"/>
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
        <point val="2,10.9313"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.99,10.9213;20.01,10.9413"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,10.9313"/>
        <point val="20,10.9313"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <connections>
        <connection handle="0" to="O9" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O21">
      <attribute name="obj_pos">
        <point val="2,12.9313"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.99,12.9213;20.01,12.9413"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2,12.9313"/>
        <point val="20,12.9313"/>
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
        <point val="1.85,1.8746"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.84,1.8646;18.91,1.8846"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.85,1.8746"/>
        <point val="18.9,1.8746"/>
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
        <point val="1.85,1.9746"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.84,1.9646;18.91,1.9846"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.85,1.9746"/>
        <point val="18.9,1.9746"/>
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
        <point val="3.5,7.14345"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.49,7.13345;17.51,7.15345"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.5,7.14345"/>
        <point val="17.5,7.14345"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Ellipse" version="0" id="O25">
      <attribute name="obj_pos">
        <point val="19.35,5.23475"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="19.345,5.22975;19.7027,5.56475"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="19.35,5.23475"/>
      </attribute>
      <attribute name="elem_width">
        <real val="0.3477"/>
      </attribute>
      <attribute name="elem_height">
        <real val="0.325"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
  </layer>
  <layer name="&#202;&#184;&#187;&#250;" visible="true">
    <object type="Standard - Text" version="0" id="O26">
      <attribute name="obj_pos">
        <point val="6.15,1.72457"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.15,1.32643;18.775,1.82643"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#172;&#185;&#241;&#204;&#177;&#183;&#242;&#185;&#175;&#202;&#221;&#184;&#177;&#161;&#166;&#184;&#229;&#180;&#252;&#185;&#226;&#206;&#240;&#188;&#212;&#176;&#229;&#206;&#197;&#191;&#199;&#206;&#197;&#202;&#243;&#189;&#183;&#192;&#193;&#181;&#225;&#189;&#241;&#193;&#247;&#201;&#213;&#189;&#241;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="6.15,1.72457"/>
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
    <object type="Standard - Text" version="0" id="O27">
      <attribute name="obj_pos">
        <point val="1.45,3.08475"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.45,2.6866;9.53,3.1866"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#178;&#172;&#187;&#179;&#184;&#169;&#185;&#241;&#204;&#177;&#183;&#242;&#185;&#175;&#202;&#221;&#184;&#177;&#195;&#196;&#194;&#206;&#207;&#162;&#185;&#231;&#178;&#241;&#184;&#230;&#195;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="1.45,3.08475"/>
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
    <object type="Standard - Text" version="0" id="O28">
      <attribute name="obj_pos">
        <point val="1.25,5.04376"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.25,4.72524;8.926,5.12524"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#178;&#188;&#181;&#173;&#164;&#206;&#164;&#200;&#164;&#170;&#164;&#234;&#191;&#199;&#206;&#197;&#202;&#243;&#189;&#183;&#192;&#193;&#181;&#225;&#189;&#241;&#164;&#242;&#193;&#247;&#201;&#213;&#164;&#185;&#164;&#235;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="1.25,5.04376"/>
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
    <object type="Standard - Text" version="0" id="O29">
      <attribute name="obj_pos">
        <point val="6.20606,4.20086"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.20606,3.80271;9.23606,4.30271"/>
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
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="6.20606,4.20086"/>
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
    <object type="Standard - Text" version="0" id="O30">
      <attribute name="obj_pos">
        <point val="9.45,4.21299"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.45,3.81484;12.177,4.31484"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#189;&#234;  &#186;&#223;  &#195;&#207;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,4.21299"/>
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
    <object type="Standard - Text" version="0" id="O31">
      <attribute name="obj_pos">
        <point val="9.45,4.91299"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.45,4.51484;11.975,5.01484"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#204;&#190;     &#190;&#206;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,4.91299"/>
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
    <object type="Standard - Text" version="0" id="O32">
      <attribute name="obj_pos">
        <point val="9.45,5.66299"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.45,5.26484;11.975,5.76484"/>
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
            <real val="0.5"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,5.66299"/>
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
    <object type="Standard - Text" version="0" id="O33">
      <attribute name="obj_pos">
        <point val="10.6561,3.09939"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.6561,2.78087;11.9489,3.18087"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#229;  &#178;&#202;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="10.6561,3.09939"/>
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
    <object type="Standard - Text" version="0" id="O34">
      <attribute name="obj_pos">
        <point val="12.3,2.78475"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.3,2.46623;14.32,2.86623"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#181;&#161;&#180;&#216;&#165;&#179;&#161;&#188;&#165;&#201;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,2.78475"/>
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
    <object type="Standard - Text" version="0" id="O35">
      <attribute name="obj_pos">
        <point val="12.3,3.38475"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.3,3.06623;13.916,3.46623"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#201;&#184;&#220;&#214;&#178;&#202;&#204;&#220;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,3.38475"/>
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
    <object type="Standard - Text" version="0" id="O36">
      <attribute name="obj_pos">
        <point val="1.45,7.11061"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.45,6.79209;2.9852,7.19209"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="1.45,7.11061"/>
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
    <object type="Standard - Text" version="0" id="O37">
      <attribute name="obj_pos">
        <point val="1.3,8.51061"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.3,8.19209;1.704,8.59209"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#169;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="1.3,8.51061"/>
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
    <object type="Standard - Text" version="0" id="O38">
      <attribute name="obj_pos">
        <point val="1.3,9.56061"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.3,9.24209;1.704,9.64209"/>
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
            <point val="1.3,9.56061"/>
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
    <object type="Standard - Text" version="0" id="O39">
      <attribute name="obj_pos">
        <point val="1.3,10.5606"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.3,10.2421;1.704,10.6421"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#169;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="1.3,10.5606"/>
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
    <object type="Standard - Text" version="0" id="O40">
      <attribute name="obj_pos">
        <point val="1.3,11.4606"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.3,11.1421;1.704,11.5421"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#226;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="1.3,11.4606"/>
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
    <object type="Standard - Text" version="0" id="O41">
      <attribute name="obj_pos">
        <point val="1.3,12.9106"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.3,12.5921;1.704,12.9921"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="1.3,12.9106"/>
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
    <object type="Standard - Text" version="0" id="O42">
      <attribute name="obj_pos">
        <point val="2.1171,8.47781"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.1171,8.15929;3.4099,8.55929"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.1171,8.47781"/>
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
    <object type="Standard - Text" version="0" id="O43">
      <attribute name="obj_pos">
        <point val="2.15,9.47781"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.15,9.15929;3.362,9.55929"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.15,9.47781"/>
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
    <object type="Standard - Text" version="0" id="O44">
      <attribute name="obj_pos">
        <point val="2.1096,10.4106"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.1096,10.0921;3.4024,10.4921"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.1096,10.4106"/>
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
        <point val="2.15,11.4606"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.15,11.1421;3.362,11.5421"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.15,11.4606"/>
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
        <point val="2.1096,12.4606"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.1096,12.1421;3.4024,12.5421"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.1096,12.4606"/>
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
        <point val="2.15,13.5106"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.15,13.1921;3.362,13.5921"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="2.15,13.5106"/>
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
      <object type="Standard - Text" version="0" id="O48">
        <attribute name="obj_pos">
          <point val="6.65,6.43561"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="6.65,6.11709;7.054,6.51709"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#206;&#197;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="6.65,6.43561"/>
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
      <object type="Standard - Text" version="0" id="O49">
        <attribute name="obj_pos">
          <point val="8.45,6.43561"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="8.45,6.11709;8.854,6.51709"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#205;&#220;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="8.45,6.43561"/>
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
      <object type="Standard - Text" version="0" id="O50">
        <attribute name="obj_pos">
          <point val="10.25,6.43561"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="10.25,6.11709;10.654,6.51709"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#164;&#206;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="10.25,6.43561"/>
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
          <point val="12.05,6.43561"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="12.05,6.11709;12.454,6.51709"/>
        </attribute>
        <attribute name="text">
          <composite type="text">
            <attribute name="string">
              <string>#&#181;&#235;#</string>
            </attribute>
            <attribute name="font">
              <font name="Courier"/>
            </attribute>
            <attribute name="height">
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="12.05,6.43561"/>
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
      <object type="Standard - Text" version="0" id="O52">
        <attribute name="obj_pos">
          <point val="13.85,6.43561"/>
        </attribute>
        <attribute name="obj_bb">
          <rectangle val="13.85,6.11709;14.254,6.51709"/>
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
              <real val="0.4"/>
            </attribute>
            <attribute name="pos">
              <point val="13.85,6.43561"/>
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
    <object type="Standard - Text" version="0" id="O53">
      <attribute name="obj_pos">
        <point val="14.3,6.99774"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.3,6.67922;17.128,7.07922"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="14.3,6.99774"/>
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
    <object type="Standard - Text" version="0" id="O54">
      <attribute name="obj_pos">
        <point val="4,6.96238"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4,6.64386;6.424,7.04386"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#185;&#241;&#204;&#177;&#183;&#242;&#185;&#175;&#202;&#221;&#184;&#177;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="4,6.96238"/>
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
    <object type="Standard - Text" version="0" id="O55">
      <attribute name="obj_pos">
        <point val="12.05,6.99774"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.05,6.67922;12.454,7.07922"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="12.05,6.99774"/>
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
    <object type="Standard - Text" version="0" id="O56">
      <attribute name="obj_pos">
        <point val="3.85,7.68561"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.85,7.36709;4.658,7.76709"/>
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
            <point val="3.85,7.68561"/>
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
    <object type="Standard - Text" version="0" id="O57">
      <attribute name="obj_pos">
        <point val="5.35,7.68561"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.35,7.36709;6.562,7.76709"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#237;&#197;&#192;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="5.35,7.68561"/>
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
        <point val="1.1,14.1856"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.1,13.9865;7.4125,14.2365"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#161;&#202;&#195;&#237;&#161;&#203;&#194;&#224;&#191;&#166;&#188;&#212;&#202;&#172;&#164;&#207;&#185;&#241;&#204;&#177;&#183;&#242;&#185;&#175;&#202;&#221;&#184;&#177;&#205;&#243;&#164;&#203;&#185;&#231;&#187;&#187;&#164;&#183;&#181;&#173;&#198;&#254;&#164;&#206;&#164;&#179;&#164;&#200;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="1.1,14.1856"/>
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
    <object type="Standard - Text" version="0" id="O59">
      <attribute name="obj_pos">
        <point val="4.65,8.21061"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.65,7.97172;4.953,8.27172"/>
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
            <point val="4.65,8.21061"/>
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
    <object type="Standard - Text" version="0" id="O60">
      <attribute name="obj_pos">
        <point val="6.6,8.21061"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.6,7.97172;6.903,8.27172"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#192;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="6.6,8.21061"/>
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
    <object type="Standard - Text" version="0" id="O61">
      <attribute name="obj_pos">
        <point val="19.4,5.51299"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="19.4,5.2741;19.703,5.5741"/>
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
            <point val="19.4,5.51299"/>
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
    <object type="Standard - Text" version="0" id="O62">
      <attribute name="obj_pos">
        <point val="7.3,7.68561"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.3,7.36709;8.108,7.76709"/>
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
            <point val="7.3,7.68561"/>
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
        <point val="8.9,7.68561"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.9,7.36709;10.112,7.76709"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#237;&#197;&#192;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="8.9,7.68561"/>
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
        <point val="10.8,7.68561"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.8,7.36709;11.608,7.76709"/>
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
            <point val="10.8,7.68561"/>
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
        <point val="12.35,7.68561"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.35,7.36709;13.562,7.76709"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#237;&#197;&#192;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="12.35,7.68561"/>
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
        <point val="14.3,7.68561"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.3,7.36709;15.108,7.76709"/>
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
            <point val="14.3,7.68561"/>
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
        <point val="15.85,7.68561"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.85,7.36709;17.062,7.76709"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#193;&#237;&#197;&#192;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="15.85,7.68561"/>
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
        <point val="18.1,7.08561"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.1,6.76709;19.3928,7.16709"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="18.1,7.08561"/>
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
        <point val="8.15,8.21061"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.15,7.97172;8.453,8.27172"/>
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
            <point val="8.15,8.21061"/>
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
    <object type="Standard - Text" version="0" id="O70">
      <attribute name="obj_pos">
        <point val="10.1,8.21061"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.1,7.97172;10.403,8.27172"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#192;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.1,8.21061"/>
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
    <object type="Standard - Text" version="0" id="O71">
      <attribute name="obj_pos">
        <point val="11.65,8.21061"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.65,7.97172;11.953,8.27172"/>
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
            <point val="11.65,8.21061"/>
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
    <object type="Standard - Text" version="0" id="O72">
      <attribute name="obj_pos">
        <point val="13.6,8.21061"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.6,7.97172;13.903,8.27172"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#192;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="13.6,8.21061"/>
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
    <object type="Standard - Text" version="0" id="O73">
      <attribute name="obj_pos">
        <point val="15.15,8.21061"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.15,7.97172;15.453,8.27172"/>
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
            <point val="15.15,8.21061"/>
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
        <point val="17.1,8.21061"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.1,7.97172;17.403,8.27172"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#192;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="17.1,8.21061"/>
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
  </layer>
  <layer name="&#186;&#185;&#164;&#183;&#185;&#254;&#164;&#223;" visible="true">
    <object type="Embed - Text" version="0" id="O75">
      <attribute name="obj_pos">
        <point val="2.15,1.7246"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.15,1.32645;6.19,1.82645"/>
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
            <point val="2.15,1.7246"/>
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
    <object type="Embed - Text" version="0" id="O76">
      <attribute name="obj_pos">
        <point val="1.45,5.70485"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.45,5.38633;5.894,5.78633"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SEIKYUYMD#</string>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="1.45,5.70485"/>
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
    <object type="Embed - Text" version="0" id="O77">
      <attribute name="obj_pos">
        <point val="14.55,2.74939"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.55,2.43087;17.378,2.83087"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HOSPCD#</string>
      </attribute>
      <attribute name="embed_text_column">
        <int val="20"/>
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
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="14.55,2.74939"/>
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
    <object type="Embed - Text" version="0" id="O78">
      <attribute name="obj_pos">
        <point val="14.6,3.34939"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.6,3.03087;19.852,3.43087"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KAMOKU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.4"/>
          </attribute>
          <attribute name="pos">
            <point val="14.6,3.34939"/>
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
    <object type="Embed - Text" version="0" id="O79">
      <attribute name="obj_pos">
        <point val="12.3,5.86299"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.3,5.58429;14.8452,5.93429"/>
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
            <string>#01-2345-6789#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,5.86299"/>
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
    <object type="Embed - Text" version="0" id="O80">
      <attribute name="obj_pos">
        <point val="4.75,8.68446"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.6895,8.40576;4.75,8.75576"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[0].NYUGAI-TBL[0].HKN-TBL[0].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="4.75,8.68446"/>
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
    <object type="Embed - Text" version="0" id="O81">
      <attribute name="obj_pos">
        <point val="6.925,8.67786"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.0161,8.39916;6.925,8.74916"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[0].NYUGAI-TBL[0].HKN-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="6.925,8.67786"/>
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
    <object type="Embed - Text" version="0" id="O82">
      <attribute name="obj_pos">
        <point val="12.3,4.01299"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.3,3.7741;19.875,4.3741"/>
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
            <point val="12.3,4.01299"/>
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
    <object type="Embed - Text" version="0" id="O83">
      <attribute name="obj_pos">
        <point val="12.3,4.76299"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.3,4.5241;18.36,5.1241"/>
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
            <point val="12.3,4.76299"/>
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
    <object type="Embed - Text" version="0" id="O84">
      <attribute name="obj_pos">
        <point val="12.3,5.51299"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.3,5.23429;19.37,5.58429"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#KAISETUNAME#</string>
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
            <string>#&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,5.51299"/>
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
    <object type="Embed - Text" version="0" id="O85">
      <attribute name="obj_pos">
        <point val="8.2205,8.67626"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.16,8.39756;8.2205,8.74756"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[0].NYUGAI-TBL[0].HKN-TBL[1].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="8.2205,8.67626"/>
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
    <object type="Embed - Text" version="0" id="O86">
      <attribute name="obj_pos">
        <point val="10.3955,8.66966"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.4866,8.39096;10.3955,8.74096"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[0].NYUGAI-TBL[0].HKN-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="10.3955,8.66966"/>
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
    <object type="Embed - Text" version="0" id="O87">
      <attribute name="obj_pos">
        <point val="11.6955,8.70126"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.635,8.42256;11.6955,8.77256"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[0].NYUGAI-TBL[0].HKN-TBL[2].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="11.6955,8.70126"/>
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
    <object type="Embed - Text" version="0" id="O88">
      <attribute name="obj_pos">
        <point val="13.8705,8.69466"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.9616,8.41596;13.8705,8.76596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[0].NYUGAI-TBL[0].HKN-TBL[2].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="13.8705,8.69466"/>
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
    <object type="Embed - Text" version="0" id="O89">
      <attribute name="obj_pos">
        <point val="15.2455,8.70126"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.185,8.42256;15.2455,8.77256"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[0].NYUGAI-TBL[0].HKN-TBL[3].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="15.2455,8.70126"/>
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
    <object type="Embed - Text" version="0" id="O90">
      <attribute name="obj_pos">
        <point val="17.4205,8.69466"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.5116,8.41596;17.4205,8.76596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[0].NYUGAI-TBL[0].HKN-TBL[3].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.4205,8.69466"/>
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
    <object type="Embed - Text" version="0" id="O91">
      <attribute name="obj_pos">
        <point val="4.7455,9.68446"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.685,9.40576;4.7455,9.75576"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[0].NYUGAI-TBL[1].HKN-TBL[0].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="4.7455,9.68446"/>
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
    <object type="Embed - Text" version="0" id="O92">
      <attribute name="obj_pos">
        <point val="6.9205,9.67786"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.0116,9.39916;6.9205,9.74916"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[0].NYUGAI-TBL[1].HKN-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9205,9.67786"/>
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
    <object type="Embed - Text" version="0" id="O93">
      <attribute name="obj_pos">
        <point val="8.216,9.67626"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.1555,9.39756;8.216,9.74756"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[0].NYUGAI-TBL[1].HKN-TBL[1].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="8.216,9.67626"/>
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
    <object type="Embed - Text" version="0" id="O94">
      <attribute name="obj_pos">
        <point val="10.391,9.66966"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.4821,9.39096;10.391,9.74096"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[0].NYUGAI-TBL[1].HKN-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="10.391,9.66966"/>
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
    <object type="Embed - Text" version="0" id="O95">
      <attribute name="obj_pos">
        <point val="11.691,9.70126"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.6305,9.42256;11.691,9.77256"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[0].NYUGAI-TBL[1].HKN-TBL[2].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="11.691,9.70126"/>
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
    <object type="Embed - Text" version="0" id="O96">
      <attribute name="obj_pos">
        <point val="13.866,9.69466"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.9571,9.41596;13.866,9.76596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[0].NYUGAI-TBL[1].HKN-TBL[2].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="13.866,9.69466"/>
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
    <object type="Embed - Text" version="0" id="O97">
      <attribute name="obj_pos">
        <point val="15.241,9.70126"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.1805,9.42256;15.241,9.77256"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[0].NYUGAI-TBL[1].HKN-TBL[3].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="15.241,9.70126"/>
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
    <object type="Embed - Text" version="0" id="O98">
      <attribute name="obj_pos">
        <point val="17.416,9.69466"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.5071,9.41596;17.416,9.76596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[0].NYUGAI-TBL[1].HKN-TBL[3].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.416,9.69466"/>
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
    <object type="Embed - Text" version="0" id="O99">
      <attribute name="obj_pos">
        <point val="4.7705,10.6595"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.71,10.3808;4.7705,10.7308"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[1].NYUGAI-TBL[0].HKN-TBL[0].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="4.7705,10.6595"/>
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
    <object type="Embed - Text" version="0" id="O100">
      <attribute name="obj_pos">
        <point val="6.9455,10.6529"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.0366,10.3742;6.9455,10.7242"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[1].NYUGAI-TBL[0].HKN-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9455,10.6529"/>
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
    <object type="Embed - Text" version="0" id="O101">
      <attribute name="obj_pos">
        <point val="8.241,10.6513"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.1805,10.3726;8.241,10.7226"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[1].NYUGAI-TBL[0].HKN-TBL[1].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="8.241,10.6513"/>
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
    <object type="Embed - Text" version="0" id="O102">
      <attribute name="obj_pos">
        <point val="10.416,10.6447"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.5071,10.366;10.416,10.716"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[1].NYUGAI-TBL[0].HKN-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="10.416,10.6447"/>
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
    <object type="Embed - Text" version="0" id="O103">
      <attribute name="obj_pos">
        <point val="11.716,10.6763"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.6555,10.3976;11.716,10.7476"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[1].NYUGAI-TBL[0].HKN-TBL[2].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="11.716,10.6763"/>
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
    <object type="Embed - Text" version="0" id="O104">
      <attribute name="obj_pos">
        <point val="13.891,10.6697"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.9821,10.391;13.891,10.741"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[1].NYUGAI-TBL[0].HKN-TBL[2].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="13.891,10.6697"/>
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
    <object type="Embed - Text" version="0" id="O105">
      <attribute name="obj_pos">
        <point val="15.266,10.6763"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.2055,10.3976;15.266,10.7476"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[1].NYUGAI-TBL[0].HKN-TBL[3].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="15.266,10.6763"/>
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
    <object type="Embed - Text" version="0" id="O106">
      <attribute name="obj_pos">
        <point val="17.441,10.6697"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.5321,10.391;17.441,10.741"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[1].NYUGAI-TBL[0].HKN-TBL[3].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.441,10.6697"/>
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
    <object type="Embed - Text" version="0" id="O107">
      <attribute name="obj_pos">
        <point val="4.7455,11.6845"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.685,11.4058;4.7455,11.7558"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[1].NYUGAI-TBL[1].HKN-TBL[0].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="4.7455,11.6845"/>
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
    <object type="Embed - Text" version="0" id="O108">
      <attribute name="obj_pos">
        <point val="6.9205,11.6779"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.0116,11.3992;6.9205,11.7492"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[1].NYUGAI-TBL[1].HKN-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="6.9205,11.6779"/>
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
        <point val="8.216,11.6763"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.1555,11.3976;8.216,11.7476"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[1].NYUGAI-TBL[1].HKN-TBL[1].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="8.216,11.6763"/>
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
    <object type="Embed - Text" version="0" id="O110">
      <attribute name="obj_pos">
        <point val="10.391,11.6697"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.4821,11.391;10.391,11.741"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[1].NYUGAI-TBL[1].HKN-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="10.391,11.6697"/>
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
    <object type="Embed - Text" version="0" id="O111">
      <attribute name="obj_pos">
        <point val="11.691,11.7013"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.6305,11.4226;11.691,11.7726"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[1].NYUGAI-TBL[1].HKN-TBL[2].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="11.691,11.7013"/>
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
    <object type="Embed - Text" version="0" id="O112">
      <attribute name="obj_pos">
        <point val="13.866,11.6947"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.9571,11.416;13.866,11.766"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[1].NYUGAI-TBL[1].HKN-TBL[2].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="13.866,11.6947"/>
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
    <object type="Embed - Text" version="0" id="O113">
      <attribute name="obj_pos">
        <point val="15.241,11.7013"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.1805,11.4226;15.241,11.7726"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[1].NYUGAI-TBL[1].HKN-TBL[3].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="15.241,11.7013"/>
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
    <object type="Embed - Text" version="0" id="O114">
      <attribute name="obj_pos">
        <point val="17.416,11.6947"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.5071,11.416;17.416,11.766"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[1].NYUGAI-TBL[1].HKN-TBL[3].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.416,11.6947"/>
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
    <object type="Embed - Text" version="0" id="O115">
      <attribute name="obj_pos">
        <point val="4.7205,12.7095"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.66,12.4308;4.7205,12.7808"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[2].NYUGAI-TBL[0].HKN-TBL[0].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="4.7205,12.7095"/>
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
    <object type="Embed - Text" version="0" id="O116">
      <attribute name="obj_pos">
        <point val="6.8955,12.7029"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.9866,12.4242;6.8955,12.7742"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[2].NYUGAI-TBL[0].HKN-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="6.8955,12.7029"/>
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
    <object type="Embed - Text" version="0" id="O117">
      <attribute name="obj_pos">
        <point val="8.191,12.7013"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.1305,12.4226;8.191,12.7726"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[2].NYUGAI-TBL[0].HKN-TBL[1].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="8.191,12.7013"/>
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
    <object type="Embed - Text" version="0" id="O118">
      <attribute name="obj_pos">
        <point val="10.366,12.6947"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.4571,12.416;10.366,12.766"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[2].NYUGAI-TBL[0].HKN-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="10.366,12.6947"/>
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
    <object type="Embed - Text" version="0" id="O119">
      <attribute name="obj_pos">
        <point val="11.666,12.7263"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.6055,12.4476;11.666,12.7976"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[2].NYUGAI-TBL[0].HKN-TBL[2].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="11.666,12.7263"/>
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
    <object type="Embed - Text" version="0" id="O120">
      <attribute name="obj_pos">
        <point val="13.841,12.7197"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.9321,12.441;13.841,12.791"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[2].NYUGAI-TBL[0].HKN-TBL[2].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="13.841,12.7197"/>
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
    <object type="Embed - Text" version="0" id="O121">
      <attribute name="obj_pos">
        <point val="15.216,12.7263"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.1555,12.4476;15.216,12.7976"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[2].NYUGAI-TBL[0].HKN-TBL[3].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="15.216,12.7263"/>
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
    <object type="Embed - Text" version="0" id="O122">
      <attribute name="obj_pos">
        <point val="17.391,12.7197"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.4821,12.441;17.391,12.791"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[2].NYUGAI-TBL[0].HKN-TBL[3].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.391,12.7197"/>
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
    <object type="Embed - Text" version="0" id="O123">
      <attribute name="obj_pos">
        <point val="4.7205,13.6595"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.66,13.3808;4.7205,13.7308"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[2].NYUGAI-TBL[1].HKN-TBL[0].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="4.7205,13.6595"/>
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
    <object type="Embed - Text" version="0" id="O124">
      <attribute name="obj_pos">
        <point val="6.8955,13.6529"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.9866,13.3742;6.8955,13.7242"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[2].NYUGAI-TBL[1].HKN-TBL[0].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="6.8955,13.6529"/>
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
    <object type="Embed - Text" version="0" id="O125">
      <attribute name="obj_pos">
        <point val="8.191,13.6513"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.1305,13.3726;8.191,13.7226"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[2].NYUGAI-TBL[1].HKN-TBL[1].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="8.191,13.6513"/>
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
    <object type="Embed - Text" version="0" id="O126">
      <attribute name="obj_pos">
        <point val="10.366,13.6447"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.4571,13.366;10.366,13.716"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[2].NYUGAI-TBL[1].HKN-TBL[1].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="10.366,13.6447"/>
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
    <object type="Embed - Text" version="0" id="O127">
      <attribute name="obj_pos">
        <point val="11.666,13.6763"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.6055,13.3976;11.666,13.7476"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[2].NYUGAI-TBL[1].HKN-TBL[2].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="11.666,13.6763"/>
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
    <object type="Embed - Text" version="0" id="O128">
      <attribute name="obj_pos">
        <point val="13.841,13.6697"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.9321,13.391;13.841,13.741"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[2].NYUGAI-TBL[1].HKN-TBL[2].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="13.841,13.6697"/>
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
    <object type="Embed - Text" version="0" id="O129">
      <attribute name="obj_pos">
        <point val="15.216,13.6763"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.1555,13.3976;15.216,13.7476"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[2].NYUGAI-TBL[1].HKN-TBL[3].KENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="15.216,13.6763"/>
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
    <object type="Embed - Text" version="0" id="O130">
      <attribute name="obj_pos">
        <point val="17.391,13.6697"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.4821,13.391;17.391,13.741"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#SYUKEI-TBL[2].NYUGAI-TBL[1].HKN-TBL[3].TENSU#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1,234,567#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.391,13.6697"/>
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
    <object type="Embed - Text" version="0" id="O131">
      <attribute name="obj_pos">
        <point val="8.82758,1.03905"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.82758,0.720527;10.8476,1.12053"/>
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
            <point val="8.82758,1.03905"/>
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
