<?xml version="1.0" encoding="UTF-8"?>
<ncl id="myNCLDocID" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
  <head>
    <connectorBase id="connBaseId">
      <causalConnector id="onBeginSet_var">
        <connectorParam name="var"/>
        <simpleCondition role="onBegin"/>
        <simpleAction role="set" value="$var" max="unbounded"/>
      </causalConnector>
      <importBase alias="ncls3dbase" documentURI="../media/connBase.ncl"/>
    </connectorBase>
  </head>
  <body id="myBodyID">
    <port id="p1" component="pinterest"/>
    <media id="pinterest" src="../media/triangle.png">
      <property name="bounds" value="13%,10%,10%,20%"/>
      <property name="depth" value="1"/>
      <property name="explicitDur" value="8s"/>
      <area id="timer" begin="3s"/>
    </media>
    <link id="link1" xconnector="onBeginSet_var">
      <bind component="pinterest" interface="timer" role="onBegin"/>
      <bind component="pinterest_depth_control" interface="orig_bounds" role="set">
        <bindParam name="var" value="15%,5%,15%,30%"/>
      </bind>
    </link>
    <port id="p1_right" component="pinterest_right"/>
    <media id="pinterest_right" src="ncl-mirror://pinterest">
      <property name="bounds" value="13%,10%,10%,20%"/>
      <property name="depth" value="1"/>
      <property name="explicitDur" value="8s"/>
      <area id="timer_right" begin="3s"/>
    </media>
    <port id="pinterest_depth_control_port" component="pinterest_depth_control"/>
    <media id="pinterest_depth_control" src="../media/depth_control.lua">
      <property name="width" value="100%"/>
      <property name="height" value="100%"/>
      <property name="orig_depth" value=""/>
      <property name="orig_left" value=""/>
      <property name="orig_width" value=""/>
      <property name="orig_bounds" value=""/>
      <property name="final_bounds_left" value=""/>
      <property name="final_bounds_right" value=""/>
      <property name="update_user_scale_disparity_by" value="0.0"/>
    </media>
    <link id="pinterest_update_bounds_left" xconnector="ncls3dbase#onBeginAttributionSet_var">
      <bind role="onBeginAttribution" component="pinterest_depth_control" interface="final_bounds_left"/>
      <bind role="get" component="pinterest_depth_control" interface="final_bounds_left"/>
      <bind role="set" component="pinterest" interface="bounds">
        <bindParam name="var" value="$get"/>
      </bind>
    </link>
    <link id="pinterest_update_bounds_right" xconnector="ncls3dbase#onBeginAttributionSet_var">
      <bind role="onBeginAttribution" component="pinterest_depth_control" interface="final_bounds_right"/>
      <bind role="get" component="pinterest_depth_control" interface="final_bounds_right"/>
      <bind role="set" component="pinterest_right" interface="bounds">
        <bindParam name="var" value="$get"/>
      </bind>
    </link>
    <link id="pinterest_depth_control_stop" xconnector="ncls3dbase#onEndStop">
      <bind role="onEnd" component="pinterest_right"/>
      <bind role="stop" component="pinterest_depth_control"/>
    </link>
    <link id="pinterest_depth_control_set_defaults" xconnector="ncls3dbase#onBeginSet_var">
      <bind role="onBegin" component="pinterest_depth_control"/>
      <bind role="set" component="pinterest_depth_control" interface="orig_depth">
        <bindParam name="var" value="1"/>
      </bind>
      <bind role="set" component="pinterest_depth_control" interface="orig_bounds">
        <bindParam name="var" value="13%,10%,10%,20%"/>
      </bind>
    </link>
  </body>
</ncl>
