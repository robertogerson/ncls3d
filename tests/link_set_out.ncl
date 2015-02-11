<?xml version="1.0" encoding="UTF-8"?>
<ncl id="myNCLDocID" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
  <head>
    <regionBase id="regionBase0">
      <region id="regions_left" left="0%" top="0%" width="50%" height="100%">
        <region id="rgPinterest" left="13%" top="10.00%" width="10.00%" height="20.00%" zIndex="6"/>
      </region>
      <region id="regions_right" left="50%" top="0%" width="50%" height="100%">
        <region id="rgPinterest_right" left="13%" top="10.00%" width="10.00%" height="20.00%" zIndex="6"/>
      </region>
    </regionBase>
    <descriptorBase id="descriptorBase1">
      <descriptor focusIndex="0" id="dPinterest" moveDown="1" moveUp="3" region="rgPinterest"/>
      <descriptor focusIndex="0" id="dPinterest_right" moveDown="1" moveUp="3" region="rgPinterest_right"/>
    </descriptorBase>
    <connectorBase id="connBaseId">
      <causalConnector id="onSelectionSet_var">
        <connectorParam name="var"/>
        <simpleCondition role="onSelection"/>
        <simpleAction role="set" value="$var" max="unbounded"/>
      </causalConnector>
      <importBase alias="ncls3dbase" documentURI="../media/connBase.ncl"/>
    </connectorBase>
  </head>
  <body id="myBodyID">
    <port id="p1" component="pinterest"/>
    <media id="pinterest" src="media/pinterest-big.png" descriptor="dPinterest">
      <property name="bounds"/>
    </media>
    <link id="link1" xconnector="onSelectionSet_var">
      <bind component="pinterest" role="onSelection"/>
      <bind component="pinterest_depth_control" interface="orig_bounds" role="set">
        <bindParam name="var" value="15%,5%,15%,30%"/>
      </bind>
    </link>
    <port id="p1_right" component="pinterest_right"/>
    <media id="pinterest_right" src="ncl-mirror://pinterest" descriptor="dPinterest_right">
      <property name="bounds"/>
    </media>
    <port id="pinterest_depth_control_port" component="pinterest_depth_control"/>
    <media id="pinterest_depth_control" src="media/depth_control.lua">
      <property name="orig_depth" value=""/>
      <property name="orig_left" value=""/>
      <property name="orig_width" value=""/>
      <property name="orig_bounds" value=""/>
      <property name="final_bounds_left" value=""/>
      <property name="final_bounds_right" value=""/>
      <property name="update_user_scale_disparity_by" value="0.0"/>
    </media>
    <link id="pinterest_update_bounds_left" xconnector="ncls3dbase#onEndAttributionSet_var">
      <bind role="onEndAttribution" component="pinterest_depth_control" interface="final_bounds_left"/>
      <bind role="get" component="pinterest_depth_control" interface="final_bounds_left"/>
      <bind role="set" component="pinterest" interface="bounds">
        <bindParam name="var" value="$get"/>
      </bind>
    </link>
    <link id="pinterest_update_bounds_right" xconnector="ncls3dbase#onEndAttributionSet_var">
      <bind role="onEndAttribution" component="pinterest_depth_control" interface="final_bounds_right"/>
      <bind role="get" component="pinterest_depth_control" interface="final_bounds_right"/>
      <bind role="set" component="pinterest_right" interface="bounds">
        <bindParam name="var" value="$get"/>
      </bind>
    </link>
  </body>
</ncl>
