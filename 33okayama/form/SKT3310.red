<?xml version="1.0"?>
<diagram xmlns:dia="http://www.lysator.liu.se/~alla/dia/">
  <dictionarydata>
    <element name="SRYYM" occurs="1">
      <appinfo>
        <embed object="string" length="16"/>
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
    <element name="HKNJANAME" occurs="1">
      <appinfo>
        <embed object="string" length="26"/>
      </appinfo>
    </element>
    <element name="SEIYMD" occurs="1">
      <appinfo>
        <embed object="string" length="22"/>
      </appinfo>
    </element>
    <element name="HKNJANUM" occurs="1">
      <appinfo>
        <embed object="string" length="12"/>
      </appinfo>
    </element>
    <element name="HOSPCD" occurs="1">
      <appinfo>
        <embed object="string" length="14"/>
      </appinfo>
    </element>
    <element name="NO" occurs="1">
      <appinfo>
        <embed object="string" length="4"/>
      </appinfo>
    </element>
    <element name="HKN-TBL" occurs="1">
      <element name="PAN-TBL" occurs="9">
        <element name="NYUGAI-TBL" occurs="2">
          <element name="KENSU" occurs="1">
            <appinfo>
              <embed object="string" length="5"/>
            </appinfo>
          </element>
          <element name="NISSU" occurs="1">
            <appinfo>
              <embed object="string" length="5"/>
            </appinfo>
          </element>
          <element name="TENSU" occurs="1">
            <appinfo>
              <embed object="string" length="9"/>
            </appinfo>
          </element>
          <element name="ITBFTN" occurs="1">
            <appinfo>
              <embed object="string" length="9"/>
            </appinfo>
          </element>
        </element>
        <element name="SKENSU" occurs="1">
          <appinfo>
            <embed object="string" length="5"/>
          </appinfo>
        </element>
        <element name="SNISSU" occurs="1">
          <appinfo>
            <embed object="string" length="5"/>
          </appinfo>
        </element>
        <element name="SKINGK" occurs="1">
          <appinfo>
            <embed object="string" length="9"/>
          </appinfo>
        </element>
        <element name="SFTNGK" occurs="1">
          <appinfo>
            <embed object="string" length="9"/>
          </appinfo>
        </element>
      </element>
    </element>
    <element name="ZAITAKU-TBL" occurs="4">
      <element name="ZKENSU" occurs="1">
        <appinfo>
          <embed object="string" length="5"/>
        </appinfo>
      </element>
      <element name="ZNISSU" occurs="1">
        <appinfo>
          <embed object="string" length="5"/>
        </appinfo>
      </element>
      <element name="ZTENSU" occurs="1">
        <appinfo>
          <embed object="string" length="9"/>
        </appinfo>
      </element>
      <element name="ZITBFTN" occurs="1">
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
  <layer name="&#199;&#216;&#183;&#202;" visible="true">
    <object type="Standard - Line" version="0" id="O0">
      <attribute name="obj_pos">
        <point val="1.6,21.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.595,21.345;20.005,21.355"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.6,21.35"/>
        <point val="20,21.35"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O10" connection="5"/>
        <connection handle="1" to="O10" connection="7"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O1">
      <attribute name="obj_pos">
        <point val="1.6,19"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.595,18.995;20.005,19.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.6,19"/>
        <point val="20,19"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O11" connection="5"/>
        <connection handle="1" to="O11" connection="7"/>
      </connections>
    </object>
    <object type="Standard - Box" version="0" id="O2">
      <attribute name="obj_pos">
        <point val="1,4.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.99,4.89;20.01,27.26"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="1,4.9"/>
      </attribute>
      <attribute name="elem_width">
        <real val="19"/>
      </attribute>
      <attribute name="elem_height">
        <real val="22.35"/>
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
        <point val="1.6,15.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.58,15.38;20.02,16.62"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="1.6,15.4"/>
      </attribute>
      <attribute name="elem_width">
        <real val="18.4"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1.2"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O4">
      <attribute name="obj_pos">
        <point val="1.6,16.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.595,16.595;20.005,16.605"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.6,16.6"/>
        <point val="20,16.6"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O3" connection="5"/>
        <connection handle="1" to="O3" connection="7"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O5">
      <attribute name="obj_pos">
        <point val="1,15.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.995,15.395;20.005,15.405"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,15.4"/>
        <point val="20,15.4"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="1" to="O3" connection="2"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O6">
      <attribute name="obj_pos">
        <point val="1.6,14.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.595,14.195;20.005,14.205"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.6,14.2"/>
        <point val="20,14.2"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O12" connection="5"/>
        <connection handle="1" to="O12" connection="7"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O7">
      <attribute name="obj_pos">
        <point val="1,13"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.995,12.995;20.005,13.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,13"/>
        <point val="20,13"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="1" to="O12" connection="2"/>
      </connections>
    </object>
    <object type="Standard - Box" version="0" id="O8">
      <attribute name="obj_pos">
        <point val="1.6,24.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.58,24.93;20.02,26.12"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="1.6,24.95"/>
      </attribute>
      <attribute name="elem_width">
        <real val="18.4"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1.15"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O9">
      <attribute name="obj_pos">
        <point val="1.6,22.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.58,22.53;20.02,23.72"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="1.6,22.55"/>
      </attribute>
      <attribute name="elem_width">
        <real val="18.4"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1.15"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O10">
      <attribute name="obj_pos">
        <point val="1.6,20.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.58,20.13;20.02,21.37"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="1.6,20.15"/>
      </attribute>
      <attribute name="elem_width">
        <real val="18.4"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1.2"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O11">
      <attribute name="obj_pos">
        <point val="1.6,17.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.58,17.78;20.02,19.02"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="1.6,17.8"/>
      </attribute>
      <attribute name="elem_width">
        <real val="18.4"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1.2"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O12">
      <attribute name="obj_pos">
        <point val="1.6,13"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.58,12.98;20.02,14.22"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="1.6,13"/>
      </attribute>
      <attribute name="elem_width">
        <real val="18.4"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1.2"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O13">
      <attribute name="obj_pos">
        <point val="1.6,10.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.58,10.63;20.02,11.87"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="1.6,10.65"/>
      </attribute>
      <attribute name="elem_width">
        <real val="18.4"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1.2"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O14">
      <attribute name="obj_pos">
        <point val="1.6,8.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.58,8.28;20.02,9.52"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="1.6,8.3"/>
      </attribute>
      <attribute name="elem_width">
        <real val="18.4"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1.2"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O15">
      <attribute name="obj_pos">
        <point val="1.6,5.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.58,5.88;20.02,7.12"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="1.6,5.9"/>
      </attribute>
      <attribute name="elem_width">
        <real val="18.4"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1.2"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.04"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Ellipse" version="0" id="O16">
      <attribute name="obj_pos">
        <point val="19.5557,2.83748"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="19.5507,2.83248;19.9857,3.23571"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="19.5557,2.83748"/>
      </attribute>
      <attribute name="elem_width">
        <real val="0.425"/>
      </attribute>
      <attribute name="elem_height">
        <real val="0.39323"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.01"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O17">
      <attribute name="obj_pos">
        <point val="5.7,27.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.695,27.245;18.105,27.255"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.7,27.25"/>
        <point val="18.1,27.25"/>
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
        <point val="1.60968,26.0963"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.60468,26.0913;20.005,26.105"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.60968,26.0963"/>
        <point val="20,26.1"/>
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
        <point val="2.35,25.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.345,25.495;20.0325,25.5059"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,25.5"/>
        <point val="20.0275,25.5009"/>
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
        <point val="1,24.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.995,24.945;20.005,24.955"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,24.95"/>
        <point val="20,24.95"/>
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
    <object type="Standard - Line" version="0" id="O21">
      <attribute name="obj_pos">
        <point val="2.35,24.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.345,24.295;20.005,24.305"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,24.3"/>
        <point val="20,24.3"/>
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
        <point val="1.6,23.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.595,23.695;20.005,23.705"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.6,23.7"/>
        <point val="20,23.7"/>
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
        <point val="2.35,23.125"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.345,23.12;20.005,23.13"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,23.125"/>
        <point val="20,23.125"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="1" to="O9" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O24">
      <attribute name="obj_pos">
        <point val="1,22.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.995,22.545;20.005,22.555"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,22.55"/>
        <point val="20,22.55"/>
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
        <point val="2.35,21.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.345,21.945;20.005,21.955"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,21.95"/>
        <point val="20,21.95"/>
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
        <point val="2.35,20.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.345,20.745;20.005,20.755"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,20.75"/>
        <point val="20,20.75"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="1" to="O10" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O27">
      <attribute name="obj_pos">
        <point val="1,20.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.995,20.145;20.005,20.155"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,20.15"/>
        <point val="20,20.15"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="1" to="O10" connection="2"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O28">
      <attribute name="obj_pos">
        <point val="2.35,19.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.345,19.545;20.005,19.555"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,19.55"/>
        <point val="20,19.55"/>
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
        <point val="2.35,18.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.345,18.395;20.005,18.405"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,18.4"/>
        <point val="20,18.4"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="1" to="O11" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O30">
      <attribute name="obj_pos">
        <point val="1,17.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.995,17.795;20.005,17.805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,17.8"/>
        <point val="20,17.8"/>
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
        <point val="2.35,16"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.345,15.995;20.005,16.005"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,16"/>
        <point val="20,16"/>
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
        <point val="2.35,14.8"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.345,14.795;20.005,14.805"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,14.8"/>
        <point val="20,14.8"/>
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
        <point val="2.35,13.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.345,13.595;20.005,13.605"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,13.6"/>
        <point val="20,13.6"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="1" to="O12" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O34">
      <attribute name="obj_pos">
        <point val="2.35,12.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.345,12.395;20.005,12.405"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,12.4"/>
        <point val="20,12.4"/>
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
        <point val="1.6,11.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.595,11.845;20.005,11.855"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.6,11.85"/>
        <point val="20,11.85"/>
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
        <point val="2.35,11.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.345,11.245;20.005,11.255"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,11.25"/>
        <point val="20,11.25"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="1" to="O13" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O37">
      <attribute name="obj_pos">
        <point val="1,10.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.995,10.645;20.005,10.655"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,10.65"/>
        <point val="20,10.65"/>
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
        <point val="2.35,10.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.345,10.045;20.005,10.055"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,10.05"/>
        <point val="20,10.05"/>
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
        <point val="1.6,9.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.595,9.495;20.005,9.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.6,9.5"/>
        <point val="20,9.5"/>
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
        <point val="2.35,8.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.345,8.895;20.005,8.905"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,8.9"/>
        <point val="20,8.9"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="1" to="O14" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O41">
      <attribute name="obj_pos">
        <point val="1,8.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.995,8.295;20.005,8.305"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,8.3"/>
        <point val="20,8.3"/>
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
        <point val="2.35,7.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.345,7.695;20.005,7.705"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,7.7"/>
        <point val="20,7.7"/>
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
        <point val="2.35,6.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.345,6.495;20.005,6.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,6.5"/>
        <point val="20,6.5"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="1" to="O15" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O44">
      <attribute name="obj_pos">
        <point val="1,5.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="0.995,5.895;20.005,5.905"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1,5.9"/>
        <point val="20,5.9"/>
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
        <point val="3.55,5.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.545,5.295;20.005,5.305"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.55,5.3"/>
        <point val="20,5.3"/>
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
        <point val="2.35,26.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.345,26.695;20.005,26.705"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,26.7"/>
        <point val="20,26.7"/>
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
        <point val="3.55,4.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.545,4.895;3.555,27.255"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="3.55,4.9"/>
        <point val="3.55,27.25"/>
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
        <point val="10,5.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.995,5.295;10.005,27.255"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10,5.3"/>
        <point val="10,27.25"/>
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
        <point val="12.7,4.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.695,4.895;12.705,27.255"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.7,4.9"/>
        <point val="12.7,27.25"/>
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
        <point val="4.75,5.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.745,5.295;4.755,27.255"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="4.75,5.3"/>
        <point val="4.75,27.25"/>
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
        <point val="5.95,5.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="5.945,5.295;5.955,27.255"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="5.95,5.3"/>
        <point val="5.95,27.25"/>
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
        <point val="2.35,5.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.34274,5.945;2.355,27.2785"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35,5.95"/>
        <point val="2.34774,27.2735"/>
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
        <point val="1.6,5.9"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.595,5.895;1.605,27.255"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.6,5.9"/>
        <point val="1.6,27.25"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
      <connections>
        <connection handle="0" to="O15" connection="0"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O54">
      <attribute name="obj_pos">
        <point val="2.35226,17.1991"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.34726,17.1941;20.0248,17.2078"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="2.35226,17.1991"/>
        <point val="20.0198,17.2028"/>
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
        <point val="1.6,7.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.595,7.095;20.005,7.105"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.6,7.1"/>
        <point val="20,7.1"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Arc" version="0" id="O56">
      <attribute name="obj_pos">
        <point val="1.4,6.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.12979,6.55595;1.405,6.655"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.4,6.65"/>
        <point val="1.13479,6.65"/>
      </attribute>
      <attribute name="curve_distance">
        <real val="0.089047"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Arc" version="0" id="O57">
      <attribute name="obj_pos">
        <point val="1.40845,8.19106"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.13824,8.18606;1.41345,8.27368"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.40845,8.19106"/>
        <point val="1.14324,8.19106"/>
      </attribute>
      <attribute name="curve_distance">
        <real val="-0.0776224"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Arc" version="0" id="O58">
      <attribute name="obj_pos">
        <point val="1.4,9.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.12979,8.95595;1.405,9.055"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.4,9.05"/>
        <point val="1.13479,9.05"/>
      </attribute>
      <attribute name="curve_distance">
        <real val="0.089047"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Arc" version="0" id="O59">
      <attribute name="obj_pos">
        <point val="1.40845,10.5575"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.13824,10.5525;1.41345,10.6401"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.40845,10.5575"/>
        <point val="1.14324,10.5575"/>
      </attribute>
      <attribute name="curve_distance">
        <real val="-0.0776224"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Arc" version="0" id="O60">
      <attribute name="obj_pos">
        <point val="1.4,15.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.12979,15.045;1.405,15.1326"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.4,15.05"/>
        <point val="1.13479,15.05"/>
      </attribute>
      <attribute name="curve_distance">
        <real val="-0.0776224"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Arc" version="0" id="O61">
      <attribute name="obj_pos">
        <point val="1.4,14.0411"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.12979,13.9471;1.405,14.0461"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.4,14.0411"/>
        <point val="1.13479,14.0411"/>
      </attribute>
      <attribute name="curve_distance">
        <real val="0.089047"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Arc" version="0" id="O62">
      <attribute name="obj_pos">
        <point val="1.4,16.727"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.12979,16.633;1.405,16.732"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.4,16.727"/>
        <point val="1.13479,16.727"/>
      </attribute>
      <attribute name="curve_distance">
        <real val="0.089047"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Arc" version="0" id="O63">
      <attribute name="obj_pos">
        <point val="1.4,17.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.12979,17.245;1.405,17.3326"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.4,17.25"/>
        <point val="1.13479,17.25"/>
      </attribute>
      <attribute name="curve_distance">
        <real val="-0.0776224"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Arc" version="0" id="O64">
      <attribute name="obj_pos">
        <point val="1.40845,20.0391"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.13824,20.0341;1.41345,20.1217"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.40845,20.0391"/>
        <point val="1.14324,20.0391"/>
      </attribute>
      <attribute name="curve_distance">
        <real val="-0.0776224"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Arc" version="0" id="O65">
      <attribute name="obj_pos">
        <point val="1.40845,18.5782"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.13824,18.4842;1.41345,18.5832"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.40845,18.5782"/>
        <point val="1.14324,18.5782"/>
      </attribute>
      <attribute name="curve_distance">
        <real val="0.089047"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Arc" version="0" id="O66">
      <attribute name="obj_pos">
        <point val="1.40845,20.96"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.13824,20.866;1.41345,20.965"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.40845,20.96"/>
        <point val="1.14324,20.96"/>
      </attribute>
      <attribute name="curve_distance">
        <real val="0.089047"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Arc" version="0" id="O67">
      <attribute name="obj_pos">
        <point val="1.40845,23.6225"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.13824,23.5285;1.41345,23.6275"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.40845,23.6225"/>
        <point val="1.14324,23.6225"/>
      </attribute>
      <attribute name="curve_distance">
        <real val="0.089047"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Arc" version="0" id="O68">
      <attribute name="obj_pos">
        <point val="1.40845,25.9769"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.13824,25.8829;1.41345,25.9819"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.40845,25.9769"/>
        <point val="1.14324,25.9769"/>
      </attribute>
      <attribute name="curve_distance">
        <real val="0.089047"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Arc" version="0" id="O69">
      <attribute name="obj_pos">
        <point val="1.40845,22.4003"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.13824,22.3953;1.41345,22.4829"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.40845,22.4003"/>
        <point val="1.14324,22.4003"/>
      </attribute>
      <attribute name="curve_distance">
        <real val="-0.0776224"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Arc" version="0" id="O70">
      <attribute name="obj_pos">
        <point val="1.40845,24.6128"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.13824,24.6078;1.41345,24.6954"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.40845,24.6128"/>
        <point val="1.14324,24.6128"/>
      </attribute>
      <attribute name="curve_distance">
        <real val="-0.0776224"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Arc" version="0" id="O71">
      <attribute name="obj_pos">
        <point val="1.40845,26.9503"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.13824,26.9453;1.41345,27.0329"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="1.40845,26.9503"/>
        <point val="1.14324,26.9503"/>
      </attribute>
      <attribute name="curve_distance">
        <real val="-0.0776224"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O72">
      <attribute name="obj_pos">
        <point val="13.9,6.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.895,5.295;13.905,6.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.9,6.5"/>
        <point val="13.9,5.3"/>
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
        <point val="15.1,6.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.095,5.295;15.105,6.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.1,6.5"/>
        <point val="15.1,5.3"/>
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
        <point val="17.6,6.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.595,5.295;17.605,6.505"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.6,6.5"/>
        <point val="17.6,5.3"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O75">
      <attribute name="obj_pos">
        <point val="13.9008,8.90625"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.895,7.095;13.9058,8.91125"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.9008,8.90625"/>
        <point val="13.9,7.1"/>
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
        <point val="15.1008,8.90625"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.095,7.095;15.1058,8.91125"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.1008,8.90625"/>
        <point val="15.1,7.1"/>
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
        <point val="17.6008,8.90625"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.595,7.095;17.6058,8.91125"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.6008,8.90625"/>
        <point val="17.6,7.1"/>
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
        <point val="13.9008,18.4057"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.895,9.495;13.9058,18.4107"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.9008,18.4057"/>
        <point val="13.9,9.5"/>
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
        <point val="15.1008,18.4307"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.095,9.495;15.1058,18.4357"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.1008,18.4307"/>
        <point val="15.1,9.5"/>
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
        <point val="17.6008,18.4057"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.595,9.495;17.6058,18.4107"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.6008,18.4057"/>
        <point val="17.6,9.5"/>
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
        <point val="13.9008,20.7412"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.895,18.995;13.9058,20.7462"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.9008,20.7412"/>
        <point val="13.9,19"/>
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
        <point val="15.1008,20.7412"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.095,18.995;15.1058,20.7462"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.1008,20.7412"/>
        <point val="15.1,19"/>
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
        <point val="17.6008,20.7412"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.595,18.995;17.6058,20.7462"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.6008,20.7412"/>
        <point val="17.6,19"/>
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
        <point val="13.9008,27.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.895,21.345;13.9058,27.255"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.9008,27.25"/>
        <point val="13.9,21.35"/>
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
        <point val="15.1008,27.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.095,21.345;15.1058,27.255"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.1008,27.25"/>
        <point val="15.1,21.35"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O86">
      <attribute name="obj_pos">
        <point val="17.6008,27.275"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.595,21.345;17.6058,27.28"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="17.6008,27.275"/>
        <point val="17.6,21.35"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.01"/>
      </attribute>
    </object>
    <object type="Standard - Box" version="0" id="O87">
      <attribute name="obj_pos">
        <point val="7.2,3.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.19,3.09;17.017,4.76"/>
      </attribute>
      <attribute name="elem_corner">
        <point val="7.2,3.1"/>
      </attribute>
      <attribute name="elem_width">
        <real val="9.80701"/>
      </attribute>
      <attribute name="elem_height">
        <real val="1.65"/>
      </attribute>
      <attribute name="border_width">
        <real val="0.02"/>
      </attribute>
      <attribute name="show_background">
        <boolean val="false"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O88">
      <attribute name="obj_pos">
        <point val="7.2,3.925"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.19,3.915;17.017,3.935"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="7.2,3.925"/>
        <point val="17.007,3.925"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
      <connections>
        <connection handle="0" to="O87" connection="3"/>
        <connection handle="1" to="O87" connection="4"/>
      </connections>
    </object>
    <object type="Standard - Line" version="0" id="O89">
      <attribute name="obj_pos">
        <point val="7.8,3.925"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.79,3.915;7.81,4.76"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="7.8,3.925"/>
        <point val="7.8,4.75"/>
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
        <real val="0.5"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O90">
      <attribute name="obj_pos">
        <point val="8.35,3.925"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.34,3.915;8.36,4.76"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="8.35,3.925"/>
        <point val="8.35,4.75"/>
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
        <real val="0.5"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O91">
      <attribute name="obj_pos">
        <point val="8.95,3.925"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.94,3.915;8.96,4.76"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="8.95,3.925"/>
        <point val="8.95,4.75"/>
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
        <real val="0.5"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O92">
      <attribute name="obj_pos">
        <point val="9.5,3.925"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.49,3.915;9.51,4.76"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="9.5,3.925"/>
        <point val="9.5,4.75"/>
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
        <real val="0.5"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O93">
      <attribute name="obj_pos">
        <point val="10.65,3.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.64,3.09;10.66,4.76"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.65,3.1"/>
        <point val="10.65,4.75"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O94">
      <attribute name="obj_pos">
        <point val="11.8,3.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.79,3.09;11.81,4.76"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="11.8,3.1"/>
        <point val="11.8,4.75"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O95">
      <attribute name="obj_pos">
        <point val="15.85,3.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.84,3.09;15.86,4.76"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.85,3.1"/>
        <point val="15.85,4.75"/>
      </attribute>
      <attribute name="numcp">
        <int val="1"/>
      </attribute>
      <attribute name="line_width">
        <real val="0.02"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O96">
      <attribute name="obj_pos">
        <point val="11.25,3.925"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.24,3.915;11.26,4.76"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="11.25,3.925"/>
        <point val="11.25,4.75"/>
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
        <real val="0.5"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O97">
      <attribute name="obj_pos">
        <point val="12.4,3.925"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.39,3.915;12.41,4.76"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.4,3.925"/>
        <point val="12.4,4.75"/>
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
        <real val="0.5"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O98">
      <attribute name="obj_pos">
        <point val="12.95,3.925"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.94,3.915;12.96,4.76"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="12.95,3.925"/>
        <point val="12.95,4.75"/>
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
        <real val="0.5"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O99">
      <attribute name="obj_pos">
        <point val="13.55,3.925"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.54,3.915;13.56,4.76"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="13.55,3.925"/>
        <point val="13.55,4.75"/>
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
        <real val="0.5"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O100">
      <attribute name="obj_pos">
        <point val="14.1,3.925"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.09,3.915;14.11,4.76"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.1,3.925"/>
        <point val="14.1,4.75"/>
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
        <real val="0.5"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O101">
      <attribute name="obj_pos">
        <point val="14.7,3.925"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.69,3.915;14.71,4.76"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="14.7,3.925"/>
        <point val="14.7,4.75"/>
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
        <real val="0.5"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O102">
      <attribute name="obj_pos">
        <point val="15.25,3.925"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.24,3.915;15.26,4.76"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="15.25,3.925"/>
        <point val="15.25,4.75"/>
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
        <real val="0.5"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O103">
      <attribute name="obj_pos">
        <point val="16.4,3.925"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.39,3.915;16.41,4.76"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="16.4,3.925"/>
        <point val="16.4,4.75"/>
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
        <real val="0.5"/>
      </attribute>
    </object>
    <object type="Standard - Line" version="0" id="O104">
      <attribute name="obj_pos">
        <point val="10.1,3.925"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.09,3.915;10.11,4.76"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="10.1,3.925"/>
        <point val="10.1,4.75"/>
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
        <real val="0.5"/>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O105">
      <attribute name="obj_pos">
        <point val="1.21696,27.5616"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.21696,27.373;1.72196,27.623"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#200;&#247;&#185;&#205;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="1.21696,27.5616"/>
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
    <object type="Standard - Text" version="0" id="O106">
      <attribute name="obj_pos">
        <point val="2.04212,27.5412"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.04212,27.3526;8.0592,27.6026"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#177;. &#164;&#179;&#164;&#206;&#205;&#209;&#187;&#230;&#164;&#207;A&#206;&#243;&#163;&#180;&#200;&#214;&#165;&#175;&#165;&#234;&#161;&#188;&#165;&#224;&#191;&#167;&#185;&#245;&#191;&#167;&#186;&#254;&#164;&#234;&#164;&#200;&#164;&#185;&#164;&#235;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="2.04212,27.5412"/>
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
    <object type="Standard - Text" version="0" id="O107">
      <attribute name="obj_pos">
        <point val="2.04212,27.9066"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.04212,27.718;6.13767,27.968"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#178;. &#162;&#168;&#176;&#245;&#164;&#206;&#205;&#243;&#164;&#207;&#161;&#162;&#181;&#173;&#198;&#254;&#164;&#183;&#164;&#202;&#164;&#164;&#164;&#179;&#164;&#200;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="2.04212,27.9066"/>
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
    <object type="Standard - Text" version="0" id="O108">
      <attribute name="obj_pos">
        <point val="2.04269,28.2776"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.04269,28.089;19.2682,28.339"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#179;. &#185;&#226;&#206;&#240;&#188;&#245;&#181;&#235;&#188;&#212;&#164;&#203;&#164;&#196;&#164;&#164;&#164;&#198;&#186;&#223;&#194;&#240;&#187;&#254;&#176;&#229;&#179;&#216;&#193;&#237;&#185;&#231;&#180;&#201;&#205;&#253;&#206;&#193;&#203;&#244;&#164;&#207;&#186;&#223;&#194;&#240;&#203;&#246;&#180;&#252;&#176;&#229;&#206;&#197;&#193;&#237;&#185;&#231;&#191;&#199;&#206;&#197;&#206;&#193;&#164;&#242;&#187;&#187;&#196;&#234;&#164;&#183;&#164;&#191;&#191;&#199;&#206;&#197;&#202;&#243;&#189;&#183;&#204;&#192;&#186;&#217;&#189;&#241;&#164;&#206;&#189;&#184;&#183;&#215;&#164;&#207;&#161;&#162;&#191;&#169;&#187;&#246;&#206;&#197;&#205;&#220;&#205;&#243;&#164;&#203;&#202;&#204;&#183;&#199;&#164;&#200;&#164;&#183;&#164;&#198;&#164;&#162;&#164;&#178;&#164;&#235;&#164;&#179;&#164;&#200;&#161;&#163;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="2.04269,28.2776"/>
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
    <object type="Standard - Line" version="0" id="O109">
      <attribute name="obj_pos">
        <point val="16.35,28.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.345,28.345;16.905,28.355"/>
      </attribute>
      <attribute name="conn_endpoints">
        <point val="16.35,28.35"/>
        <point val="16.9,28.35"/>
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
    <object type="Standard - Text" version="0" id="O110">
      <attribute name="obj_pos">
        <point val="9.04201,1.35304"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="9.04201,1.01357;13.687,1.46357"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#191;&#199;&#206;&#197;&#202;&#243;&#189;&#183;&#192;&#193;&#181;&#225;&#189;&#241;(&#176;&#229;&#178;&#202;)#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="9.04201,1.35304"/>
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
    <object type="Standard - Text" version="0" id="O111">
      <attribute name="obj_pos">
        <point val="8.07864,1.38202"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="8.07864,1.04255;8.53314,1.49255"/>
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
            <point val="8.07864,1.38202"/>
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
    <object type="Standard - Text" version="0" id="O112">
      <attribute name="obj_pos">
        <point val="1.58279,2.34802"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.58279,2.1217;3.23111,2.4217"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;  &#184;&#177;  &#188;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.58279,2.34802"/>
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
    <object type="Standard - Text" version="0" id="O113">
      <attribute name="obj_pos">
        <point val="1.53248,4.81985"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.53248,4.59353;3.35048,4.89353"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.53248,4.81985"/>
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
    <object type="Standard - Text" version="0" id="O114">
      <attribute name="obj_pos">
        <point val="1.54941,3.90126"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.54941,3.67494;6.24288,3.97494"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#178;&#188; &#181;&#173; &#164;&#206; &#164;&#200; &#164;&#170; &#164;&#234; &#192;&#193; &#181;&#225; &#164;&#185; &#164;&#235;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.54941,3.90126"/>
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
    <object type="Standard - Text" version="0" id="O115">
      <attribute name="obj_pos">
        <point val="19.6293,3.15014"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="19.6293,2.92382;19.9323,3.22382"/>
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
            <point val="19.6293,3.15014"/>
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
    <object type="Standard - Text" version="0" id="O116">
      <attribute name="obj_pos">
        <point val="1.80953,6.32722"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.80953,6.1009;2.11253,7.0009"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.80953,6.32722"/>
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
    <object type="Standard - Text" version="0" id="O117">
      <attribute name="obj_pos">
        <point val="2.50792,6.30222"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.50792,6.0759;3.29875,6.3759"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.50792,6.30222"/>
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
    <object type="Standard - Text" version="0" id="O118">
      <attribute name="obj_pos">
        <point val="6.77075,5.18724"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="6.77075,4.99864;9.88155,5.24864"/>
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
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="6.77075,5.18724"/>
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
    <object type="Standard - Text" version="0" id="O119">
      <attribute name="obj_pos">
        <point val="3.74541,5.69904"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.74541,5.51044;4.40444,5.76044"/>
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
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="3.74541,5.69904"/>
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
    <object type="Standard - Text" version="0" id="O120">
      <attribute name="obj_pos">
        <point val="7.41092,5.68366"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.41092,5.49506;8.68605,5.74506"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#192;     &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="7.41092,5.68366"/>
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
    <object type="Standard - Text" version="0" id="O121">
      <attribute name="obj_pos">
        <point val="14.8671,5.18354"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.8671,4.99494;18.0637,5.24494"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#191;&#169; &#187;&#246; &#206;&#197; &#205;&#220;&#161;&#166;&#192;&#184; &#179;&#232; &#206;&#197; &#205;&#220;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="14.8671,5.18354"/>
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
    <object type="Standard - Text" version="0" id="O122">
      <attribute name="obj_pos">
        <point val="2.50792,6.89869"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.50792,6.67237;3.41692,6.97237"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.50792,6.89869"/>
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
    <object type="Standard - Text" version="0" id="O123">
      <attribute name="obj_pos">
        <point val="1.80953,7.47697"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.80953,7.25065;2.11253,8.15065"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.80953,7.47697"/>
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
    <object type="Standard - Text" version="0" id="O124">
      <attribute name="obj_pos">
        <point val="1.15,6.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.15,5.9114;1.4025,8.1614"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#236;
&#200;&#204;

&#188;&#183;
&#161;&#251;
&#176;&#202;
&#190;&#229;
&#182;&#229;
&#179;&#228;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="1.15,6.1"/>
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
    <object type="Standard - Text" version="0" id="O125">
      <attribute name="obj_pos">
        <point val="2.50792,7.50411"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.50792,7.27779;3.29875,7.57779"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.50792,7.50411"/>
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
    <object type="Standard - Text" version="0" id="O126">
      <attribute name="obj_pos">
        <point val="2.50792,8.10524"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.50792,7.87892;3.41692,8.17892"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.50792,8.10524"/>
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
    <object type="Standard - Text" version="0" id="O127">
      <attribute name="obj_pos">
        <point val="1.15,8.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.15,8.3114;1.4025,10.5614"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#236;
&#200;&#204;

&#188;&#183;
&#161;&#251;
&#176;&#202;
&#190;&#229;
&#188;&#183;
&#179;&#228;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="1.15,8.5"/>
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
    <object type="Standard - Text" version="0" id="O128">
      <attribute name="obj_pos">
        <point val="1.15,11.25"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.15,11.0614;1.4025,12.5614"/>
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
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="1.15,11.25"/>
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
    <object type="Standard - Text" version="0" id="O129">
      <attribute name="obj_pos">
        <point val="1.15,13.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.15,13.3114;1.4025,15.0614"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#236;
&#200;&#204;

&#187;&#176;
&#186;&#208;
&#204;&#164;
&#203;&#254;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="1.15,13.5"/>
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
    <object type="Standard - Text" version="0" id="O130">
      <attribute name="obj_pos">
        <point val="1.15,16.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.15,15.9614;1.4025,17.2114"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#194;&#224;
&#191;&#166;

&#203;&#220;
&#191;&#205;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="1.15,16.15"/>
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
    <object type="Standard - Text" version="0" id="O131">
      <attribute name="obj_pos">
        <point val="1.15,18.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.15,17.8614;1.4025,20.1114"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#194;&#224;
&#191;&#166;

&#188;&#183;
&#161;&#251;
&#176;&#202;
&#190;&#229;
&#182;&#229;
&#179;&#228;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="1.15,18.05"/>
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
    <object type="Standard - Text" version="0" id="O132">
      <attribute name="obj_pos">
        <point val="1.15,20.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.15,20.2114;1.4025,22.4614"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#194;&#224;
&#191;&#166;

&#188;&#183;
&#161;&#251;
&#176;&#202;
&#190;&#229;
&#188;&#183;
&#179;&#228;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="1.15,20.4"/>
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
    <object type="Standard - Text" version="0" id="O133">
      <attribute name="obj_pos">
        <point val="1.15,23.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.15,22.8614;1.4025,24.6114"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#194;&#224;
&#191;&#166;

&#200;&#239;
&#201;&#222;
&#205;&#220;
&#188;&#212;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="1.15,23.05"/>
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
    <object type="Standard - Text" version="0" id="O134">
      <attribute name="obj_pos">
        <point val="1.15,25.4"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.15,25.2114;1.4025,26.9614"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#194;&#224;
&#191;&#166;

&#187;&#176;
&#186;&#208;
&#204;&#164;
&#203;&#254;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="1.15,25.4"/>
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
    <object type="Standard - Text" version="0" id="O135">
      <attribute name="obj_pos">
        <point val="1.81733,8.7204"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.81733,8.49408;2.12033,9.39408"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.81733,8.7204"/>
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
    <object type="Standard - Text" version="0" id="O136">
      <attribute name="obj_pos">
        <point val="2.51572,8.6954"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.51572,8.46908;3.30655,8.76908"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.51572,8.6954"/>
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
    <object type="Standard - Text" version="0" id="O137">
      <attribute name="obj_pos">
        <point val="2.51572,9.29185"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.51572,9.06553;3.42472,9.36553"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.51572,9.29185"/>
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
    <object type="Standard - Text" version="0" id="O138">
      <attribute name="obj_pos">
        <point val="1.81733,9.87015"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.81733,9.64383;2.12033,10.5438"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.81733,9.87015"/>
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
    <object type="Standard - Text" version="0" id="O139">
      <attribute name="obj_pos">
        <point val="2.51572,9.89725"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.51572,9.67093;3.30655,9.97093"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.51572,9.89725"/>
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
    <object type="Standard - Text" version="0" id="O140">
      <attribute name="obj_pos">
        <point val="2.51572,10.4985"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.51572,10.2722;3.42472,10.5722"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.51572,10.4985"/>
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
    <object type="Standard - Text" version="0" id="O141">
      <attribute name="obj_pos">
        <point val="1.81733,11.1013"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.81733,10.875;2.12033,11.775"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.81733,11.1013"/>
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
        <point val="2.51572,11.0763"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.51572,10.85;3.30655,11.15"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.51572,11.0763"/>
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
        <point val="2.51572,11.6728"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.51572,11.4465;3.42472,11.7465"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.51572,11.6728"/>
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
        <point val="1.81733,12.2511"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.81733,12.0248;2.12033,12.9248"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.81733,12.2511"/>
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
    <object type="Standard - Text" version="0" id="O145">
      <attribute name="obj_pos">
        <point val="2.51572,12.2782"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.51572,12.0519;3.30655,12.3519"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.51572,12.2782"/>
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
    <object type="Standard - Text" version="0" id="O146">
      <attribute name="obj_pos">
        <point val="2.51572,12.8793"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.51572,12.653;3.42472,12.953"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.51572,12.8793"/>
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
    <object type="Standard - Text" version="0" id="O147">
      <attribute name="obj_pos">
        <point val="1.79233,13.4643"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.79233,13.238;2.09533,14.138"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.79233,13.4643"/>
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
    <object type="Standard - Text" version="0" id="O148">
      <attribute name="obj_pos">
        <point val="2.49072,13.4393"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49072,13.213;3.28155,13.513"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.49072,13.4393"/>
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
    <object type="Standard - Text" version="0" id="O149">
      <attribute name="obj_pos">
        <point val="2.49072,14.0358"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49072,13.8095;3.39972,14.1095"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.49072,14.0358"/>
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
    <object type="Standard - Text" version="0" id="O150">
      <attribute name="obj_pos">
        <point val="1.79233,14.6141"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.79233,14.3878;2.09533,15.2878"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.79233,14.6141"/>
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
        <point val="2.49072,14.6412"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49072,14.4149;3.28155,14.7149"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.49072,14.6412"/>
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
    <object type="Standard - Text" version="0" id="O152">
      <attribute name="obj_pos">
        <point val="2.49072,15.2424"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49072,15.0161;3.39972,15.3161"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.49072,15.2424"/>
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
    <object type="Standard - Text" version="0" id="O153">
      <attribute name="obj_pos">
        <point val="1.81733,15.8532"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.81733,15.6269;2.12033,16.5269"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.81733,15.8532"/>
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
    <object type="Standard - Text" version="0" id="O154">
      <attribute name="obj_pos">
        <point val="2.51572,15.8282"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.51572,15.6019;3.30655,15.9019"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.51572,15.8282"/>
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
    <object type="Standard - Text" version="0" id="O155">
      <attribute name="obj_pos">
        <point val="2.51572,16.4246"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.51572,16.1983;3.42472,16.4983"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.51572,16.4246"/>
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
    <object type="Standard - Text" version="0" id="O156">
      <attribute name="obj_pos">
        <point val="1.81733,17.0029"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.81733,16.7766;2.12033,17.6766"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.81733,17.0029"/>
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
        <point val="2.51572,17.0301"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.51572,16.8038;3.30655,17.1038"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.51572,17.0301"/>
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
    <object type="Standard - Text" version="0" id="O158">
      <attribute name="obj_pos">
        <point val="2.51572,17.6312"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.51572,17.4049;3.42472,17.7049"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.51572,17.6312"/>
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
    <object type="Standard - Text" version="0" id="O159">
      <attribute name="obj_pos">
        <point val="1.81733,18.2053"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.81733,17.979;2.12033,18.879"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.81733,18.2053"/>
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
        <point val="2.51572,18.1803"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.51572,17.954;3.30655,18.254"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.51572,18.1803"/>
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
        <point val="2.51572,18.7768"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.51572,18.5505;3.42472,18.8505"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.51572,18.7768"/>
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
        <point val="1.81733,19.3551"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.81733,19.1288;2.12033,20.0288"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.81733,19.3551"/>
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
        <point val="2.51572,19.3822"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.51572,19.1559;3.30655,19.4559"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.51572,19.3822"/>
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
        <point val="2.51572,19.9833"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.51572,19.757;3.42472,20.057"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.51572,19.9833"/>
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
    <object type="Standard - Text" version="0" id="O165">
      <attribute name="obj_pos">
        <point val="1.79233,20.5803"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.79233,20.354;2.09533,21.254"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.79233,20.5803"/>
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
    <object type="Standard - Text" version="0" id="O166">
      <attribute name="obj_pos">
        <point val="2.49072,20.5553"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49072,20.329;3.28155,20.629"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.49072,20.5553"/>
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
    <object type="Standard - Text" version="0" id="O167">
      <attribute name="obj_pos">
        <point val="2.49072,21.1518"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49072,20.9255;3.39972,21.2255"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.49072,21.1518"/>
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
        <point val="1.79233,21.7301"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.79233,21.5038;2.09533,22.4038"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.79233,21.7301"/>
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
    <object type="Standard - Text" version="0" id="O169">
      <attribute name="obj_pos">
        <point val="2.49072,21.7572"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49072,21.5309;3.28155,21.8309"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.49072,21.7572"/>
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
    <object type="Standard - Text" version="0" id="O170">
      <attribute name="obj_pos">
        <point val="2.49072,22.3583"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49072,22.132;3.39972,22.432"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.49072,22.3583"/>
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
    <object type="Standard - Text" version="0" id="O171">
      <attribute name="obj_pos">
        <point val="1.79233,22.9553"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.79233,22.729;2.09533,23.629"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.79233,22.9553"/>
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
    <object type="Standard - Text" version="0" id="O172">
      <attribute name="obj_pos">
        <point val="2.49072,22.9303"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49072,22.704;3.28155,23.004"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.49072,22.9303"/>
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
    <object type="Standard - Text" version="0" id="O173">
      <attribute name="obj_pos">
        <point val="2.49072,23.5268"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49072,23.3005;3.39972,23.6005"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.49072,23.5268"/>
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
    <object type="Standard - Text" version="0" id="O174">
      <attribute name="obj_pos">
        <point val="1.79233,24.1051"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.79233,23.8788;2.09533,24.7788"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.79233,24.1051"/>
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
    <object type="Standard - Text" version="0" id="O175">
      <attribute name="obj_pos">
        <point val="2.49072,24.1322"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49072,23.9059;3.28155,24.2059"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.49072,24.1322"/>
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
        <point val="2.49072,24.7333"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49072,24.507;3.39972,24.807"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.49072,24.7333"/>
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
        <point val="1.79233,25.3303"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.79233,25.104;2.09533,26.004"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.79233,25.3303"/>
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
        <point val="2.49072,25.3053"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49072,25.079;3.28155,25.379"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.49072,25.3053"/>
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
    <object type="Standard - Text" version="0" id="O179">
      <attribute name="obj_pos">
        <point val="2.49072,25.9018"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49072,25.6755;3.39972,25.9755"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.49072,25.9018"/>
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
        <point val="1.79233,26.4801"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.79233,26.2538;2.09533,27.1538"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.79233,26.4801"/>
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
    <object type="Standard - Text" version="0" id="O181">
      <attribute name="obj_pos">
        <point val="2.49072,26.5072"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49072,26.2809;3.28155,26.5809"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.49072,26.5072"/>
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
    <object type="Standard - Text" version="0" id="O182">
      <attribute name="obj_pos">
        <point val="2.49072,27.1083"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="2.49072,26.882;3.39972,27.182"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="2.49072,27.1083"/>
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
    <object type="Standard - Text" version="0" id="O183">
      <attribute name="obj_pos">
        <point val="19.8,6.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="19.8,6.29912;20.002,6.49912"/>
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
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="19.8,6.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O184">
      <attribute name="obj_pos">
        <point val="17.4,6.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.4,6.29912;17.602,6.49912"/>
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
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="17.4,6.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O185">
      <attribute name="obj_pos">
        <point val="12.4652,6.4742"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.4652,6.32332;12.6672,6.52332"/>
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
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="12.4652,6.4742"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O186">
      <attribute name="obj_pos">
        <point val="4.88625,5.68699"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.88625,5.53611;5.89625,5.73611"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#191;&#199;&#206;&#197;&#188;&#194;&#198;&#252;&#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="4.88625,5.68699"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O187">
      <attribute name="obj_pos">
        <point val="10.8177,5.70884"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.8177,5.52024;12.0802,5.77024"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#236;&#201;&#244;&#201;&#233;&#195;&#180;&#182;&#226;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="10.8177,5.70884"/>
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
    <object type="Standard - Text" version="0" id="O188">
      <attribute name="obj_pos">
        <point val="12.9505,5.70552"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.9505,5.51692;13.6095,5.76692"/>
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
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="12.9505,5.70552"/>
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
    <object type="Standard - Text" version="0" id="O189">
      <attribute name="obj_pos">
        <point val="14.1744,5.68384"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="14.1744,5.49524;14.8334,5.74524"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#178;&#243; &#191;&#244;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="14.1744,5.68384"/>
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
    <object type="Standard - Text" version="0" id="O190">
      <attribute name="obj_pos">
        <point val="15.8122,5.68384"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.8122,5.49524;16.9333,5.74524"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#182;&#226;    &#179;&#219;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="15.8122,5.68384"/>
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
    <object type="Standard - Text" version="0" id="O191">
      <attribute name="obj_pos">
        <point val="18.1625,5.69634"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.1625,5.50774;19.425,5.75774"/>
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
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="18.1625,5.69634"/>
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
    <object type="Standard - Text" version="0" id="O192">
      <attribute name="obj_pos">
        <point val="12.65,6.675"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.65,6.52412;13.3004,6.72412"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#(&#186;&#223;&#194;&#240;)#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="12.65,6.675"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O193">
      <attribute name="obj_pos">
        <point val="13.787,7.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.787,6.89912;13.989,7.09912"/>
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
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="13.787,7.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O194">
      <attribute name="obj_pos">
        <point val="15.0372,7.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.0372,6.89912;15.2392,7.09912"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#252;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="15.0372,7.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O195">
      <attribute name="obj_pos">
        <point val="17.45,7.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.45,6.89912;17.652,7.09912"/>
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
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="17.45,7.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O196">
      <attribute name="obj_pos">
        <point val="19.8129,7.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="19.8129,6.89912;20.0149,7.09912"/>
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
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="19.8129,7.05"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O197">
      <attribute name="obj_pos">
        <point val="12.6579,9.07236"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.6579,8.92148;13.3083,9.12148"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#(&#186;&#223;&#194;&#240;)#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="12.6579,9.07236"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O198">
      <attribute name="obj_pos">
        <point val="13.8223,9.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.8223,9.29912;14.0243,9.49912"/>
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
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="13.8223,9.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O199">
      <attribute name="obj_pos">
        <point val="15.0371,9.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.0371,9.29912;15.2391,9.49912"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#252;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="15.0371,9.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O200">
      <attribute name="obj_pos">
        <point val="17.45,9.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.45,9.29912;17.652,9.49912"/>
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
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="17.45,9.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O201">
      <attribute name="obj_pos">
        <point val="19.8128,9.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="19.8128,9.29912;20.0148,9.49912"/>
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
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="19.8128,9.45"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O202">
      <attribute name="obj_pos">
        <point val="12.6711,18.5738"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.6711,18.4229;13.3215,18.6229"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#(&#186;&#223;&#194;&#240;)#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="12.6711,18.5738"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O203">
      <attribute name="obj_pos">
        <point val="13.8,18.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.8,18.7991;14.002,18.9991"/>
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
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="13.8,18.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O204">
      <attribute name="obj_pos">
        <point val="15.0325,18.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.0325,18.7991;15.2345,18.9991"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#252;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="15.0325,18.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O205">
      <attribute name="obj_pos">
        <point val="17.4454,18.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.4454,18.7991;17.6474,18.9991"/>
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
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="17.4454,18.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O206">
      <attribute name="obj_pos">
        <point val="19.8,18.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="19.8,18.7991;20.002,18.9991"/>
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
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="19.8,18.95"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O207">
      <attribute name="obj_pos">
        <point val="12.65,20.925"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.65,20.7741;13.3004,20.9741"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#(&#186;&#223;&#194;&#240;)#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="12.65,20.925"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O208">
      <attribute name="obj_pos">
        <point val="13.787,21.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.787,21.1491;13.989,21.3491"/>
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
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="13.787,21.3"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O209">
      <attribute name="obj_pos">
        <point val="15.0371,21.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.0371,21.1491;15.2391,21.3491"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#198;&#252;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="15.0371,21.3"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O210">
      <attribute name="obj_pos">
        <point val="17.45,21.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.45,21.1491;17.652,21.3491"/>
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
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="17.45,21.3"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O211">
      <attribute name="obj_pos">
        <point val="19.8,21.3"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="19.8,21.1491;20.002,21.3491"/>
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
            <real val="0.2"/>
          </attribute>
          <attribute name="pos">
            <point val="19.8,21.3"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.12322"/>
          </attribute>
          <attribute name="multi">
            <real val="0.101"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O212">
      <attribute name="obj_pos">
        <point val="10.7036,1.74547"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.7036,1.51915;12.8246,1.81915"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221;&#184;&#177;&#176;&#229;&#206;&#197;&#181;&#161;&#180;&#216;&#164;&#206;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.7036,1.74547"/>
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
    <object type="Standard - Text" version="0" id="O213">
      <attribute name="obj_pos">
        <point val="10.6859,2.18089"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.6859,1.95457;12.8069,2.25457"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#189;&#234;&#186;&#223;&#195;&#207;&#181;&#218;&#164;&#211;&#204;&#190;&#190;&#206;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.6859,2.18089"/>
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
    <object type="Standard - Text" version="0" id="O214">
      <attribute name="obj_pos">
        <point val="10.6984,2.659"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.6984,2.43268;13.0194,2.73268"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#197;&#197;  &#207;&#195;  &#200;&#214;  &#185;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.6984,2.659"/>
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
    <object type="Standard - Text" version="0" id="O215">
      <attribute name="obj_pos">
        <point val="10.7161,2.99352"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.7161,2.7672;12.9704,3.0672"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#179;&#171; &#192;&#223; &#188;&#212; &#187;&#225; &#204;&#190;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.7161,2.99352"/>
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
    <object type="Standard - Text" version="0" id="O216">
      <attribute name="obj_pos">
        <point val="1.75377,5.48818"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.75377,5.26186;2.91426,5.56186"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="1.75377,5.48818"/>
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
    <object type="Standard - Text" version="0" id="O217">
      <attribute name="obj_pos">
        <point val="7.8304,3.6754"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.8304,3.44908;10.0847,3.74908"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#202;&#221; &#184;&#177; &#188;&#212; &#200;&#214; &#185;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="7.8304,3.6754"/>
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
    <object type="Standard - Text" version="0" id="O218">
      <attribute name="obj_pos">
        <point val="10.8434,3.6754"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.8434,3.44908;11.7524,3.74908"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#184;&#169;&#200;&#214;&#185;&#230;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="10.8434,3.6754"/>
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
    <object type="Standard - Text" version="0" id="O219">
      <attribute name="obj_pos">
        <point val="12.2934,3.6754"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.2934,3.44908;15.5234,3.74908"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#229; &#206;&#197; &#181;&#161; &#180;&#216; &#165;&#179; &#161;&#188; &#165;&#201;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="12.2934,3.6754"/>
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
    <object type="Standard - Text" version="0" id="O220">
      <attribute name="obj_pos">
        <point val="16.0596,3.67998"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.0596,3.45366;16.8504,3.75366"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#201;&#189; &#202;&#204;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="16.0596,3.67998"/>
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
    <object type="Standard - Text" version="0" id="O221">
      <attribute name="obj_pos">
        <point val="16.0096,4.33486"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.0096,4.14626;16.2621,4.64626"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#176;&#229;
&#178;&#202;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.25"/>
          </attribute>
          <attribute name="pos">
            <point val="16.0096,4.33486"/>
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
    <object type="Standard - Text" version="0" id="O222">
      <attribute name="obj_pos">
        <point val="16.5971,4.49483"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5971,4.26851;16.9001,4.56851"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="16.5971,4.49483"/>
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
    <object type="Standard - Text" version="0" id="O223">
      <attribute name="obj_pos">
        <point val="10.7,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.7,4.17;11.8514,4.74"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#179;&#163;&#179;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.57"/>
          </attribute>
          <attribute name="pos">
            <point val="10.7,4.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.351177"/>
          </attribute>
          <attribute name="multi">
            <real val="0.28785"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Standard - Text" version="0" id="O224">
      <attribute name="obj_pos">
        <point val="16.5322,4.52811"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="16.5322,4.22636;16.9362,4.62636"/>
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
            <point val="16.5322,4.52811"/>
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
  </layer>
  <layer name="&#186;&#185;&#164;&#183;&#185;&#254;&#164;&#223;" visible="true">
    <object type="Embed - Text" version="0" id="O225">
      <attribute name="obj_pos">
        <point val="4.45597,1.39688"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.45597,1.05741;8.09197,1.50741"/>
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
            <real val="0.45"/>
          </attribute>
          <attribute name="pos">
            <point val="4.45597,1.39688"/>
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
    <object type="Embed - Text" version="0" id="O226">
      <attribute name="obj_pos">
        <point val="1.85005,3.35122"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.85005,3.06455;6.83945,3.44455"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKNJANAME#</string>
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
            <real val="0.38"/>
          </attribute>
          <attribute name="pos">
            <point val="1.85005,3.35122"/>
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
    <object type="Embed - Text" version="0" id="O227">
      <attribute name="obj_pos">
        <point val="7.23115,4.60169"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.23115,4.17169;10.6853,4.74169"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKNJANUM#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#&#163;&#185;&#163;&#185;&#163;&#185;&#163;&#185;&#163;&#185;&#163;&#185;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.57"/>
          </attribute>
          <attribute name="pos">
            <point val="7.23115,4.60169"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.351177"/>
          </attribute>
          <attribute name="multi">
            <real val="0.28785"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O228">
      <attribute name="obj_pos">
        <point val="1.52036,4.36434"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="1.52036,4.1003;5.40886,4.4503"/>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="1.52036,4.36434"/>
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
    <object type="Embed - Text" version="0" id="O229">
      <attribute name="obj_pos">
        <point val="11.85,4.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="11.85,4.17;15.8799,4.74"/>
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
            <string>#&#163;&#177;&#163;&#178;&#163;&#179;&#163;&#180;&#163;&#181;&#163;&#182;&#163;&#183;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.57"/>
          </attribute>
          <attribute name="pos">
            <point val="11.85,4.6"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.351177"/>
          </attribute>
          <attribute name="multi">
            <real val="0.28785"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O230">
      <attribute name="obj_pos">
        <point val="13.1,1.65"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1,1.44632;19.9175,1.98632"/>
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
            <real val="0.27"/>
          </attribute>
          <attribute name="pos">
            <point val="13.1,1.65"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.166347"/>
          </attribute>
          <attribute name="multi">
            <real val="0.13635"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O231">
      <attribute name="obj_pos">
        <point val="13.1,2.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1,1.99632;18.554,2.53632"/>
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
&#164;&#162;&#164;&#162;#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.27"/>
          </attribute>
          <attribute name="pos">
            <point val="13.1,2.2"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="0"/>
          </attribute>
          <attribute name="single">
            <real val="0.166347"/>
          </attribute>
          <attribute name="multi">
            <real val="0.13635"/>
          </attribute>
        </composite>
      </attribute>
    </object>
    <object type="Embed - Text" version="0" id="O232">
      <attribute name="obj_pos">
        <point val="13.1,3.05"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1,2.82368;19.16,3.12368"/>
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
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="13.1,3.05"/>
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
    <object type="Embed - Text" version="0" id="O233">
      <attribute name="obj_pos">
        <point val="13.1,2.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.1,2.48596;15.6876,2.83596"/>
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
            <string>#999-999-9999#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="13.1,2.75"/>
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
    <object type="Embed - Text" version="0" id="O234">
      <attribute name="obj_pos">
        <point val="4.65,6.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,6.08596;4.65,6.43596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[0].NYUGAI-TBL[0].KENSU#</string>
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
            <point val="4.65,6.35"/>
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
    <object type="Embed - Text" version="0" id="O235">
      <attribute name="obj_pos">
        <point val="4.65,6.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,6.68596;4.65,7.03596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[0].NYUGAI-TBL[1].KENSU#</string>
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
            <point val="4.65,6.95"/>
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
    <object type="Embed - Text" version="0" id="O236">
      <attribute name="obj_pos">
        <point val="5.85,6.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,6.08596;5.85,6.43596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[0].NYUGAI-TBL[0].NISSU#</string>
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
            <point val="5.85,6.35"/>
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
    <object type="Embed - Text" version="0" id="O237">
      <attribute name="obj_pos">
        <point val="5.85,6.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,6.68596;5.85,7.03596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[0].NYUGAI-TBL[1].NISSU#</string>
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
            <point val="5.85,6.95"/>
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
    <object type="Embed - Text" version="0" id="O238">
      <attribute name="obj_pos">
        <point val="9.45,6.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,6.08596;9.45,6.43596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[0].NYUGAI-TBL[0].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,6.35"/>
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
    <object type="Embed - Text" version="0" id="O239">
      <attribute name="obj_pos">
        <point val="9.45,6.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,6.68596;9.45,7.03596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[0].NYUGAI-TBL[1].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,6.95"/>
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
    <object type="Embed - Text" version="0" id="O240">
      <attribute name="obj_pos">
        <point val="12.3,6.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,6.08596;12.3,6.43596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[0].NYUGAI-TBL[0].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,6.35"/>
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
    <object type="Embed - Text" version="0" id="O241">
      <attribute name="obj_pos">
        <point val="12.3,6.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,6.68596;12.3,7.03596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[0].NYUGAI-TBL[1].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,6.95"/>
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
    <object type="Embed - Text" version="0" id="O242">
      <attribute name="obj_pos">
        <point val="13.8,6.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.7218,6.08596;13.8,6.43596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[0].SKENSU#</string>
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
            <point val="13.8,6.35"/>
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
    <object type="Embed - Text" version="0" id="O243">
      <attribute name="obj_pos">
        <point val="15,6.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.9218,6.08596;15,6.43596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[0].SNISSU#</string>
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
            <point val="15,6.35"/>
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
    <object type="Embed - Text" version="0" id="O244">
      <attribute name="obj_pos">
        <point val="17.2,6.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2593,6.08596;17.2,6.43596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[0].SKINGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.2,6.35"/>
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
    <object type="Embed - Text" version="0" id="O245">
      <attribute name="obj_pos">
        <point val="19.7,6.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.7593,6.08596;19.7,6.43596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[0].SFTNGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="19.7,6.35"/>
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
    <object type="Embed - Text" version="0" id="O246">
      <attribute name="obj_pos">
        <point val="13.8,6.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.7218,6.68596;13.8,7.03596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAITAKU-TBL[0].ZKENSU#</string>
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
            <point val="13.8,6.95"/>
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
    <object type="Embed - Text" version="0" id="O247">
      <attribute name="obj_pos">
        <point val="15,6.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.9218,6.68596;15,7.03596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAITAKU-TBL[0].ZNISSU#</string>
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
            <point val="15,6.95"/>
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
    <object type="Embed - Text" version="0" id="O248">
      <attribute name="obj_pos">
        <point val="17.2,6.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2593,6.68596;17.2,7.03596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAITAKU-TBL[0].ZTENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.2,6.95"/>
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
    <object type="Embed - Text" version="0" id="O249">
      <attribute name="obj_pos">
        <point val="19.7,6.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.7593,6.68596;19.7,7.03596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAITAKU-TBL[0].ZITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="19.7,6.95"/>
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
    <object type="Embed - Text" version="0" id="O250">
      <attribute name="obj_pos">
        <point val="4.65,8.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,8.48596;4.65,8.83596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[1].NYUGAI-TBL[0].KENSU#</string>
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
            <point val="4.65,8.75"/>
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
    <object type="Embed - Text" version="0" id="O251">
      <attribute name="obj_pos">
        <point val="4.65,9.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,9.08596;4.65,9.43596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[1].NYUGAI-TBL[1].KENSU#</string>
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
            <point val="4.65,9.35"/>
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
    <object type="Embed - Text" version="0" id="O252">
      <attribute name="obj_pos">
        <point val="5.85,8.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,8.48596;5.85,8.83596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[1].NYUGAI-TBL[0].NISSU#</string>
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
            <point val="5.85,8.75"/>
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
    <object type="Embed - Text" version="0" id="O253">
      <attribute name="obj_pos">
        <point val="5.85,9.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,9.08596;5.85,9.43596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[1].NYUGAI-TBL[1].NISSU#</string>
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
            <point val="5.85,9.35"/>
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
    <object type="Embed - Text" version="0" id="O254">
      <attribute name="obj_pos">
        <point val="9.45,8.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,8.48596;9.45,8.83596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[1].NYUGAI-TBL[0].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,8.75"/>
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
    <object type="Embed - Text" version="0" id="O255">
      <attribute name="obj_pos">
        <point val="9.45,9.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,9.08596;9.45,9.43596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[1].NYUGAI-TBL[1].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,9.35"/>
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
    <object type="Embed - Text" version="0" id="O256">
      <attribute name="obj_pos">
        <point val="12.3,8.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,8.48596;12.3,8.83596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[1].NYUGAI-TBL[0].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,8.75"/>
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
    <object type="Embed - Text" version="0" id="O257">
      <attribute name="obj_pos">
        <point val="12.3,9.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,9.08596;12.3,9.43596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[1].NYUGAI-TBL[1].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,9.35"/>
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
    <object type="Embed - Text" version="0" id="O258">
      <attribute name="obj_pos">
        <point val="13.8,8.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.7218,8.48596;13.8,8.83596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[1].SKENSU#</string>
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
            <point val="13.8,8.75"/>
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
    <object type="Embed - Text" version="0" id="O259">
      <attribute name="obj_pos">
        <point val="15,8.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.9218,8.48596;15,8.83596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[1].SNISSU#</string>
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
            <point val="15,8.75"/>
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
    <object type="Embed - Text" version="0" id="O260">
      <attribute name="obj_pos">
        <point val="17.2,8.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2593,8.48596;17.2,8.83596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[1].SKINGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.2,8.75"/>
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
    <object type="Embed - Text" version="0" id="O261">
      <attribute name="obj_pos">
        <point val="19.7,8.75"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.7593,8.48596;19.7,8.83596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[1].SFTNGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="19.7,8.75"/>
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
    <object type="Embed - Text" version="0" id="O262">
      <attribute name="obj_pos">
        <point val="13.8,9.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.7218,9.08596;13.8,9.43596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAITAKU-TBL[1].ZKENSU#</string>
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
            <point val="13.8,9.35"/>
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
    <object type="Embed - Text" version="0" id="O263">
      <attribute name="obj_pos">
        <point val="15,9.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.9218,9.08596;15,9.43596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAITAKU-TBL[1].ZNISSU#</string>
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
            <point val="15,9.35"/>
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
    <object type="Embed - Text" version="0" id="O264">
      <attribute name="obj_pos">
        <point val="17.2,9.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2593,9.08596;17.2,9.43596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAITAKU-TBL[1].ZTENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.2,9.35"/>
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
    <object type="Embed - Text" version="0" id="O265">
      <attribute name="obj_pos">
        <point val="19.7,9.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.7593,9.08596;19.7,9.43596"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAITAKU-TBL[1].ZITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="19.7,9.35"/>
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
    <object type="Embed - Text" version="0" id="O266">
      <attribute name="obj_pos">
        <point val="4.65,11.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,10.836;4.65,11.186"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[2].NYUGAI-TBL[0].KENSU#</string>
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
            <point val="4.65,11.1"/>
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
    <object type="Embed - Text" version="0" id="O267">
      <attribute name="obj_pos">
        <point val="4.65,11.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,11.436;4.65,11.786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[2].NYUGAI-TBL[1].KENSU#</string>
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
            <point val="4.65,11.7"/>
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
    <object type="Embed - Text" version="0" id="O268">
      <attribute name="obj_pos">
        <point val="5.85,11.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,10.836;5.85,11.186"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[2].NYUGAI-TBL[0].NISSU#</string>
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
            <point val="5.85,11.1"/>
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
    <object type="Embed - Text" version="0" id="O269">
      <attribute name="obj_pos">
        <point val="5.85,11.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,11.436;5.85,11.786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[2].NYUGAI-TBL[1].NISSU#</string>
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
            <point val="5.85,11.7"/>
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
    <object type="Embed - Text" version="0" id="O270">
      <attribute name="obj_pos">
        <point val="9.45,11.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,10.836;9.45,11.186"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[2].NYUGAI-TBL[0].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,11.1"/>
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
    <object type="Embed - Text" version="0" id="O271">
      <attribute name="obj_pos">
        <point val="9.45,11.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,11.436;9.45,11.786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[2].NYUGAI-TBL[1].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,11.7"/>
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
    <object type="Embed - Text" version="0" id="O272">
      <attribute name="obj_pos">
        <point val="12.3,11.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,10.836;12.3,11.186"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[2].NYUGAI-TBL[0].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,11.1"/>
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
    <object type="Embed - Text" version="0" id="O273">
      <attribute name="obj_pos">
        <point val="12.3,11.7"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,11.436;12.3,11.786"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[2].NYUGAI-TBL[1].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,11.7"/>
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
    <object type="Embed - Text" version="0" id="O274">
      <attribute name="obj_pos">
        <point val="13.8,11.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.7218,10.836;13.8,11.186"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[2].SKENSU#</string>
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
            <point val="13.8,11.1"/>
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
    <object type="Embed - Text" version="0" id="O275">
      <attribute name="obj_pos">
        <point val="15,11.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.9218,10.836;15,11.186"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[2].SNISSU#</string>
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
            <point val="15,11.1"/>
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
    <object type="Embed - Text" version="0" id="O276">
      <attribute name="obj_pos">
        <point val="17.2,11.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2593,10.836;17.2,11.186"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[2].SKINGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.2,11.1"/>
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
    <object type="Embed - Text" version="0" id="O277">
      <attribute name="obj_pos">
        <point val="19.7,11.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.7593,10.836;19.7,11.186"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[2].SFTNGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="19.7,11.1"/>
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
    <object type="Embed - Text" version="0" id="O278">
      <attribute name="obj_pos">
        <point val="4.65,13.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,13.236;4.65,13.586"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[3].NYUGAI-TBL[0].KENSU#</string>
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
            <point val="4.65,13.5"/>
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
    <object type="Embed - Text" version="0" id="O279">
      <attribute name="obj_pos">
        <point val="4.65,14.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,13.836;4.65,14.186"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[3].NYUGAI-TBL[1].KENSU#</string>
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
            <point val="4.65,14.1"/>
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
    <object type="Embed - Text" version="0" id="O280">
      <attribute name="obj_pos">
        <point val="5.85,13.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,13.236;5.85,13.586"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[3].NYUGAI-TBL[0].NISSU#</string>
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
            <point val="5.85,13.5"/>
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
    <object type="Embed - Text" version="0" id="O281">
      <attribute name="obj_pos">
        <point val="5.85,14.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,13.836;5.85,14.186"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[3].NYUGAI-TBL[1].NISSU#</string>
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
            <point val="5.85,14.1"/>
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
    <object type="Embed - Text" version="0" id="O282">
      <attribute name="obj_pos">
        <point val="9.45,13.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,13.236;9.45,13.586"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[3].NYUGAI-TBL[0].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,13.5"/>
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
    <object type="Embed - Text" version="0" id="O283">
      <attribute name="obj_pos">
        <point val="9.45,14.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,13.836;9.45,14.186"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[3].NYUGAI-TBL[1].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,14.1"/>
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
    <object type="Embed - Text" version="0" id="O284">
      <attribute name="obj_pos">
        <point val="12.3,13.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,13.236;12.3,13.586"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[3].NYUGAI-TBL[0].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,13.5"/>
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
    <object type="Embed - Text" version="0" id="O285">
      <attribute name="obj_pos">
        <point val="12.3,14.1"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,13.836;12.3,14.186"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[3].NYUGAI-TBL[1].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,14.1"/>
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
    <object type="Embed - Text" version="0" id="O286">
      <attribute name="obj_pos">
        <point val="13.8,13.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.7218,13.236;13.8,13.586"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[3].SKENSU#</string>
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
            <point val="13.8,13.5"/>
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
    <object type="Embed - Text" version="0" id="O287">
      <attribute name="obj_pos">
        <point val="15,13.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.9218,13.236;15,13.586"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[3].SNISSU#</string>
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
            <point val="15,13.5"/>
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
    <object type="Embed - Text" version="0" id="O288">
      <attribute name="obj_pos">
        <point val="17.2,13.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2593,13.236;17.2,13.586"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[3].SKINGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.2,13.5"/>
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
    <object type="Embed - Text" version="0" id="O289">
      <attribute name="obj_pos">
        <point val="19.7,13.5"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.7593,13.236;19.7,13.586"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[3].SFTNGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="19.7,13.5"/>
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
    <object type="Embed - Text" version="0" id="O290">
      <attribute name="obj_pos">
        <point val="4.65,15.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,15.586;4.65,15.936"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[4].NYUGAI-TBL[0].KENSU#</string>
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
            <point val="4.65,15.85"/>
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
    <object type="Embed - Text" version="0" id="O291">
      <attribute name="obj_pos">
        <point val="4.65,16.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,16.186;4.65,16.536"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[4].NYUGAI-TBL[1].KENSU#</string>
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
            <point val="4.65,16.45"/>
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
    <object type="Embed - Text" version="0" id="O292">
      <attribute name="obj_pos">
        <point val="5.85,15.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,15.586;5.85,15.936"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[4].NYUGAI-TBL[0].NISSU#</string>
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
            <point val="5.85,15.85"/>
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
    <object type="Embed - Text" version="0" id="O293">
      <attribute name="obj_pos">
        <point val="5.85,16.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,16.186;5.85,16.536"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[4].NYUGAI-TBL[1].NISSU#</string>
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
            <point val="5.85,16.45"/>
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
    <object type="Embed - Text" version="0" id="O294">
      <attribute name="obj_pos">
        <point val="9.45,15.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,15.586;9.45,15.936"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[4].NYUGAI-TBL[0].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,15.85"/>
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
    <object type="Embed - Text" version="0" id="O295">
      <attribute name="obj_pos">
        <point val="9.45,16.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,16.186;9.45,16.536"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[4].NYUGAI-TBL[1].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,16.45"/>
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
    <object type="Embed - Text" version="0" id="O296">
      <attribute name="obj_pos">
        <point val="12.3,15.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,15.586;12.3,15.936"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[4].NYUGAI-TBL[0].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,15.85"/>
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
    <object type="Embed - Text" version="0" id="O297">
      <attribute name="obj_pos">
        <point val="12.3,16.45"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,16.186;12.3,16.536"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[4].NYUGAI-TBL[1].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,16.45"/>
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
    <object type="Embed - Text" version="0" id="O298">
      <attribute name="obj_pos">
        <point val="13.8,15.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.7218,15.586;13.8,15.936"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[4].SKENSU#</string>
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
            <point val="13.8,15.85"/>
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
    <object type="Embed - Text" version="0" id="O299">
      <attribute name="obj_pos">
        <point val="15,15.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.9218,15.586;15,15.936"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[4].SNISSU#</string>
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
            <point val="15,15.85"/>
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
    <object type="Embed - Text" version="0" id="O300">
      <attribute name="obj_pos">
        <point val="17.2,15.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2593,15.586;17.2,15.936"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[4].SKINGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.2,15.85"/>
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
    <object type="Embed - Text" version="0" id="O301">
      <attribute name="obj_pos">
        <point val="19.7,15.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.7593,15.586;19.7,15.936"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[4].SFTNGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="19.7,15.85"/>
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
    <object type="Embed - Text" version="0" id="O302">
      <attribute name="obj_pos">
        <point val="4.65,18.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,17.936;4.65,18.286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[5].NYUGAI-TBL[0].KENSU#</string>
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
            <point val="4.65,18.2"/>
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
    <object type="Embed - Text" version="0" id="O303">
      <attribute name="obj_pos">
        <point val="4.65,18.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,18.586;4.65,18.936"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[5].NYUGAI-TBL[1].KENSU#</string>
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
            <point val="4.65,18.85"/>
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
    <object type="Embed - Text" version="0" id="O304">
      <attribute name="obj_pos">
        <point val="5.85,18.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,17.936;5.85,18.286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[5].NYUGAI-TBL[0].NISSU#</string>
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
            <point val="5.85,18.2"/>
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
    <object type="Embed - Text" version="0" id="O305">
      <attribute name="obj_pos">
        <point val="5.85,18.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,18.586;5.85,18.936"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[5].NYUGAI-TBL[1].NISSU#</string>
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
            <point val="5.85,18.85"/>
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
    <object type="Embed - Text" version="0" id="O306">
      <attribute name="obj_pos">
        <point val="9.45,18.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,17.936;9.45,18.286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[5].NYUGAI-TBL[0].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,18.2"/>
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
    <object type="Embed - Text" version="0" id="O307">
      <attribute name="obj_pos">
        <point val="9.45,18.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,18.586;9.45,18.936"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[5].NYUGAI-TBL[1].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,18.85"/>
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
    <object type="Embed - Text" version="0" id="O308">
      <attribute name="obj_pos">
        <point val="12.3,18.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,17.936;12.3,18.286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[5].NYUGAI-TBL[0].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,18.2"/>
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
    <object type="Embed - Text" version="0" id="O309">
      <attribute name="obj_pos">
        <point val="12.3,18.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,18.586;12.3,18.936"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[5].NYUGAI-TBL[1].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,18.85"/>
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
    <object type="Embed - Text" version="0" id="O310">
      <attribute name="obj_pos">
        <point val="13.8,18.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.7218,17.936;13.8,18.286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[5].SKENSU#</string>
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
            <point val="13.8,18.2"/>
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
    <object type="Embed - Text" version="0" id="O311">
      <attribute name="obj_pos">
        <point val="15,18.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.9218,17.936;15,18.286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[5].SNISSU#</string>
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
            <point val="15,18.2"/>
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
    <object type="Embed - Text" version="0" id="O312">
      <attribute name="obj_pos">
        <point val="17.2,18.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2593,17.936;17.2,18.286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[5].SKINGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.2,18.2"/>
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
    <object type="Embed - Text" version="0" id="O313">
      <attribute name="obj_pos">
        <point val="19.7,18.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.7593,17.936;19.7,18.286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[5].SFTNGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="19.7,18.2"/>
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
    <object type="Embed - Text" version="0" id="O314">
      <attribute name="obj_pos">
        <point val="13.8,18.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.7218,18.586;13.8,18.936"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAITAKU-TBL[2].ZKENSU#</string>
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
            <point val="13.8,18.85"/>
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
    <object type="Embed - Text" version="0" id="O315">
      <attribute name="obj_pos">
        <point val="15,18.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.9218,18.586;15,18.936"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAITAKU-TBL[2].ZNISSU#</string>
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
            <point val="15,18.85"/>
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
    <object type="Embed - Text" version="0" id="O316">
      <attribute name="obj_pos">
        <point val="17.2,18.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2593,18.586;17.2,18.936"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAITAKU-TBL[2].ZTENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.2,18.85"/>
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
    <object type="Embed - Text" version="0" id="O317">
      <attribute name="obj_pos">
        <point val="19.7,18.85"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.7593,18.586;19.7,18.936"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAITAKU-TBL[2].ZITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="19.7,18.85"/>
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
    <object type="Embed - Text" version="0" id="O318">
      <attribute name="obj_pos">
        <point val="4.65,20.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,20.336;4.65,20.686"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[6].NYUGAI-TBL[0].KENSU#</string>
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
            <point val="4.65,20.6"/>
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
    <object type="Embed - Text" version="0" id="O319">
      <attribute name="obj_pos">
        <point val="4.65,21.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,20.936;4.65,21.286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[6].NYUGAI-TBL[1].KENSU#</string>
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
            <point val="4.65,21.2"/>
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
    <object type="Embed - Text" version="0" id="O320">
      <attribute name="obj_pos">
        <point val="5.85,20.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,20.336;5.85,20.686"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[6].NYUGAI-TBL[0].NISSU#</string>
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
            <point val="5.85,20.6"/>
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
    <object type="Embed - Text" version="0" id="O321">
      <attribute name="obj_pos">
        <point val="5.85,21.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,20.936;5.85,21.286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[6].NYUGAI-TBL[1].NISSU#</string>
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
            <point val="5.85,21.2"/>
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
    <object type="Embed - Text" version="0" id="O322">
      <attribute name="obj_pos">
        <point val="9.45,20.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,20.336;9.45,20.686"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[6].NYUGAI-TBL[0].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,20.6"/>
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
    <object type="Embed - Text" version="0" id="O323">
      <attribute name="obj_pos">
        <point val="9.45,21.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,20.936;9.45,21.286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[6].NYUGAI-TBL[1].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,21.2"/>
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
    <object type="Embed - Text" version="0" id="O324">
      <attribute name="obj_pos">
        <point val="12.3,20.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,20.336;12.3,20.686"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[6].NYUGAI-TBL[0].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,20.6"/>
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
    <object type="Embed - Text" version="0" id="O325">
      <attribute name="obj_pos">
        <point val="12.3,21.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,20.936;12.3,21.286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[6].NYUGAI-TBL[1].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,21.2"/>
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
    <object type="Embed - Text" version="0" id="O326">
      <attribute name="obj_pos">
        <point val="13.8,20.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.7218,20.336;13.8,20.686"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[6].SKENSU#</string>
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
            <point val="13.8,20.6"/>
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
    <object type="Embed - Text" version="0" id="O327">
      <attribute name="obj_pos">
        <point val="15,20.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.9218,20.336;15,20.686"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[6].SNISSU#</string>
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
            <point val="15,20.6"/>
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
    <object type="Embed - Text" version="0" id="O328">
      <attribute name="obj_pos">
        <point val="17.2,20.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2593,20.336;17.2,20.686"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[6].SKINGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.2,20.6"/>
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
    <object type="Embed - Text" version="0" id="O329">
      <attribute name="obj_pos">
        <point val="19.7,20.6"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.7593,20.336;19.7,20.686"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[6].SFTNGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="19.7,20.6"/>
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
    <object type="Embed - Text" version="0" id="O330">
      <attribute name="obj_pos">
        <point val="13.8,21.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.7218,20.936;13.8,21.286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAITAKU-TBL[3].ZKENSU#</string>
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
            <point val="13.8,21.2"/>
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
    <object type="Embed - Text" version="0" id="O331">
      <attribute name="obj_pos">
        <point val="15,21.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.9218,20.936;15,21.286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAITAKU-TBL[3].ZNISSU#</string>
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
            <point val="15,21.2"/>
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
    <object type="Embed - Text" version="0" id="O332">
      <attribute name="obj_pos">
        <point val="17.2,21.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2593,20.936;17.2,21.286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAITAKU-TBL[3].ZTENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.2,21.2"/>
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
    <object type="Embed - Text" version="0" id="O333">
      <attribute name="obj_pos">
        <point val="19.7,21.2"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.7593,20.936;19.7,21.286"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#ZAITAKU-TBL[3].ZITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="19.7,21.2"/>
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
    <object type="Embed - Text" version="0" id="O334">
      <attribute name="obj_pos">
        <point val="4.65,22.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,22.686;4.65,23.036"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[7].NYUGAI-TBL[0].KENSU#</string>
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
            <point val="4.65,22.95"/>
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
    <object type="Embed - Text" version="0" id="O335">
      <attribute name="obj_pos">
        <point val="4.65,23.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,23.286;4.65,23.636"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[7].NYUGAI-TBL[1].KENSU#</string>
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
            <point val="4.65,23.55"/>
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
    <object type="Embed - Text" version="0" id="O336">
      <attribute name="obj_pos">
        <point val="5.85,22.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,22.686;5.85,23.036"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[7].NYUGAI-TBL[0].NISSU#</string>
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
            <point val="5.85,22.95"/>
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
    <object type="Embed - Text" version="0" id="O337">
      <attribute name="obj_pos">
        <point val="5.85,23.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,23.286;5.85,23.636"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[7].NYUGAI-TBL[1].NISSU#</string>
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
            <point val="5.85,23.55"/>
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
    <object type="Embed - Text" version="0" id="O338">
      <attribute name="obj_pos">
        <point val="9.45,22.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,22.686;9.45,23.036"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[7].NYUGAI-TBL[0].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,22.95"/>
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
    <object type="Embed - Text" version="0" id="O339">
      <attribute name="obj_pos">
        <point val="9.45,23.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,23.286;9.45,23.636"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[7].NYUGAI-TBL[1].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,23.55"/>
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
    <object type="Embed - Text" version="0" id="O340">
      <attribute name="obj_pos">
        <point val="12.3,22.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,22.686;12.3,23.036"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[7].NYUGAI-TBL[0].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,22.95"/>
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
    <object type="Embed - Text" version="0" id="O341">
      <attribute name="obj_pos">
        <point val="12.3,23.55"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,23.286;12.3,23.636"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[7].NYUGAI-TBL[1].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,23.55"/>
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
    <object type="Embed - Text" version="0" id="O342">
      <attribute name="obj_pos">
        <point val="13.8,22.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.7218,22.686;13.8,23.036"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[7].SKENSU#</string>
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
            <point val="13.8,22.95"/>
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
    <object type="Embed - Text" version="0" id="O343">
      <attribute name="obj_pos">
        <point val="15,22.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.9218,22.686;15,23.036"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[7].SNISSU#</string>
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
            <point val="15,22.95"/>
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
    <object type="Embed - Text" version="0" id="O344">
      <attribute name="obj_pos">
        <point val="17.2,22.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2593,22.686;17.2,23.036"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[7].SKINGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.2,22.95"/>
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
    <object type="Embed - Text" version="0" id="O345">
      <attribute name="obj_pos">
        <point val="19.7,22.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.7593,22.686;19.7,23.036"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[7].SFTNGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="19.7,22.95"/>
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
    <object type="Embed - Text" version="0" id="O346">
      <attribute name="obj_pos">
        <point val="4.65,25.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,25.086;4.65,25.436"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[8].NYUGAI-TBL[0].KENSU#</string>
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
            <point val="4.65,25.35"/>
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
    <object type="Embed - Text" version="0" id="O347">
      <attribute name="obj_pos">
        <point val="4.65,25.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="3.57183,25.686;4.65,26.036"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[8].NYUGAI-TBL[1].KENSU#</string>
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
            <point val="4.65,25.95"/>
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
    <object type="Embed - Text" version="0" id="O348">
      <attribute name="obj_pos">
        <point val="5.85,25.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,25.086;5.85,25.436"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[8].NYUGAI-TBL[0].NISSU#</string>
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
            <point val="5.85,25.35"/>
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
    <object type="Embed - Text" version="0" id="O349">
      <attribute name="obj_pos">
        <point val="5.85,25.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="4.77182,25.686;5.85,26.036"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[8].NYUGAI-TBL[1].NISSU#</string>
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
            <point val="5.85,25.95"/>
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
    <object type="Embed - Text" version="0" id="O350">
      <attribute name="obj_pos">
        <point val="9.45,25.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,25.086;9.45,25.436"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[8].NYUGAI-TBL[0].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,25.35"/>
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
    <object type="Embed - Text" version="0" id="O351">
      <attribute name="obj_pos">
        <point val="9.45,25.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="7.50928,25.686;9.45,26.036"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[8].NYUGAI-TBL[1].TENSU#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="9.45,25.95"/>
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
    <object type="Embed - Text" version="0" id="O352">
      <attribute name="obj_pos">
        <point val="12.3,25.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,25.086;12.3,25.436"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[8].NYUGAI-TBL[0].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,25.35"/>
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
    <object type="Embed - Text" version="0" id="O353">
      <attribute name="obj_pos">
        <point val="12.3,25.95"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="10.3593,25.686;12.3,26.036"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[8].NYUGAI-TBL[1].ITBFTN#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="12.3,25.95"/>
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
    <object type="Embed - Text" version="0" id="O354">
      <attribute name="obj_pos">
        <point val="13.8,25.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="12.7218,25.086;13.8,25.436"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[8].SKENSU#</string>
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
            <point val="13.8,25.35"/>
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
    <object type="Embed - Text" version="0" id="O355">
      <attribute name="obj_pos">
        <point val="15,25.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="13.9218,25.086;15,25.436"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[8].SNISSU#</string>
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
            <point val="15,25.35"/>
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
    <object type="Embed - Text" version="0" id="O356">
      <attribute name="obj_pos">
        <point val="17.2,25.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="15.2593,25.086;17.2,25.436"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[8].SKINGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="17.2,25.35"/>
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
    <object type="Embed - Text" version="0" id="O357">
      <attribute name="obj_pos">
        <point val="19.7,25.35"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="17.7593,25.086;19.7,25.436"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#HKN-TBL.PAN-TBL[8].SFTNGK#</string>
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
            <real val="0.35"/>
          </attribute>
          <attribute name="pos">
            <point val="19.7,25.35"/>
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
    <object type="Embed - Text" version="0" id="O358">
      <attribute name="obj_pos">
        <point val="19.7,1.15"/>
      </attribute>
      <attribute name="obj_bb">
        <rectangle val="18.9607,0.923684;19.7,1.22368"/>
      </attribute>
      <attribute name="dnode_path">
        <string>#NO#</string>
      </attribute>
      <attribute name="embed_text_string">
        <enum val="0"/>
      </attribute>
      <attribute name="text">
        <composite type="text">
          <attribute name="string">
            <string>#1234#</string>
          </attribute>
          <attribute name="font">
            <font name="Courier"/>
          </attribute>
          <attribute name="height">
            <real val="0.3"/>
          </attribute>
          <attribute name="pos">
            <point val="19.7,1.15"/>
          </attribute>
          <attribute name="color">
            <color val="#000000"/>
          </attribute>
          <attribute name="alignment">
            <enum val="2"/>
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
