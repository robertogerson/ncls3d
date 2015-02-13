<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright (c) 2015 Roberto Azevedo

This file is part of ncls3d.

ncls3d is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

ncls3d is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with ncls3d. If not, see <http://www.gnu.org/licenses/>.
-->
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
      
      <causalConnector id="onKeySelectionSet_var">
        <connectorParam name="var"/>
        <connectorParam name="key"/>
        <simpleCondition role="onSelection" key="$key"/>
        <simpleAction role="set" value="$var" max="unbounded"/>
      </causalConnector>
      
      <!-- Must be generated -->
      <causalConnector id="onEndAttributionSet_var">
        <connectorParam name="var"/>
        <simpleCondition role="onEndAttribution"/>
        <simpleAction role="set" value="$var" max="unbounded"/>
      </causalConnector>
      <!-- end -->
    </connectorBase>
  </head>
  <body id="myBodyID">
    <port id="p1" component="pinterest"/>
    <media id="pinterest" src="media/pinterest-big.png" descriptor="dPinterest">
      <property name="bounds"/>
    </media>
    
    <link id="link1" xconnector="onSelectionSet_var">
      <bind component="pinterest" role="onSelection"/>
      <!-- binds for bounds should be redirected to lua control -->
      <bind component="pinterest_depth_control" interface="orig_bounds" role="set">
        <bindParam name="var" value="13%,5%,15%,30%"/>
      </bind>
    </link>
    
    <!-- Some links to control depth -->
    <link id="link2" xconnector="onKeySelectionSet_var">
      <bind component="pinterest" role="onSelection">
        <bindParam name="key" value="RED"/>        
      </bind>
        
      <!-- binds for depth should be redirected to lua control -->
      <bind component="pinterest_depth_control" interface="orig_depth" role="set">
        <bindParam name="var" value="1.0"/>
      </bind>
    </link>
    
    <link id="link3" xconnector="onKeySelectionSet_var">
      <bind component="pinterest" role="onSelection">
        <bindParam name="key" value="GREEN"/>        
      </bind>
        
      <!-- binds for depth should be redirected to lua control -->
      <bind component="pinterest_depth_control" interface="orig_depth" role="set">
        <bindParam name="var" value="0.0"/>
      </bind>
    </link>
    
    <link id="link4" xconnector="onKeySelectionSet_var">
      <bind component="pinterest" role="onSelection">
        <bindParam name="key" value="YELLOW"/>
      </bind>
        
      <!-- binds for depth should be redirected to lua control -->
      <bind component="pinterest_depth_control" interface="orig_depth" role="set">
        <bindParam name="var" value="-1.0"/>
      </bind>
    </link>
    <!-- end links to control depth -->
    
    <port id="p3_right" component="pinterest_right"/>
    <media id="pinterest_right" src="media/pinterest-big.png" descriptor="dPinterest_right">
      <property name="bounds"/>
    </media>
    
    <!-- Must be generated -->
    <port id="p3_depth_control" component="pinterest_depth_control"/>
    <media id="pinterest_depth_control" src="depth_control.lua">
      <property name="width" value="100%"/>
      <property name="height" value="100%"/>
      
      <!-- property name="user_scale_disparity" value="1.0"/ -->
      <property name="orig_depth" value=""/>
      <property name="orig_left" value=""/>
      <property name="orig_width" value=""/>
      <property name="orig_bounds" value=""/>
      
      <property name="final_bounds_left" value=""/>
      <property name="final_bounds_right" value=""/>
      <property name="update_user_scale_disparity_by" value="0.0"/>
    </media>
    
    <!-- We also should add to left -->  
    <link id="update_pinterest_left" xconnector="onEndAttributionSet_var">
      <bind role="onEndAttribution" component="pinterest_depth_control" interface="final_bounds_left"/>
      <bind role="get_left" component="pinterest_depth_control" interface="final_bounds_left"/>
      <bind role="set" component="pinterest" interface="bounds">
        <bindParam name="var" value="$get_left"/>
      </bind>
    </link>
    
    <link id="update_pinterest_right_left" xconnector="onEndAttributionSet_var">
      <bind role="onEndAttribution" component="pinterest_depth_control" interface="final_bounds_right"/>
      <bind role="get_right" component="pinterest_depth_control" interface="final_bounds_right"/>
      <bind role="set" component="pinterest_right" interface="bounds">
        <bindParam name="var" value="$get_right"/>
      </bind>
    </link>
    
    <!-- link id="update_orig_depth" xconnector="onEndAttributionSet">
      <bind role="onEndAttribution" component="pinterest" interface="depth"/>
      <bind role="get" component="m1" interface="depth"/>
      <bind role="set" component="m1_depth_control" interface="orig_depth">
        <bindParam name="val" value="$get"/>
      </bind>
    </link -->
    <!-- end -->
  </body>
</ncl>
