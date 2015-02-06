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
<ncl id="test1">
  <head>
    <connectorBase>
      <causalConnector id="onEndAttributionSet">
        <connectorParam name="val"/>
        <connectorParam name="dur"/>
        <simpleCondition role="onEndAttribution"/>
        <simpleAction role="set" value="$val" duration="$dur" max="unbounded" qualifier="par"/>
      </causalConnector>
      
      <causalConnector id="onEndAttributionTestSet">
        <connectorParam name="val"/>
        <connectorParam name="dur"/>
        <connectorParam name="testval"/>
        <compoundCondition operator="and">
          <simpleCondition role="onEndAttribution"/>
          <assessmentStatement comparator="eq">
            <attributeAssessment role="test" eventType="attribution" attributeType="nodeProperty"/>
            <valueAssessment value="$testval"/>
          </assessmentStatement>  
        </compoundCondition>
        
        <simpleAction role="set" value="$val" duration="$dur" max="unbounded" qualifier="seq"/>
      </causalConnector>
      
      <causalConnector id="onKeySelectionSet">
        <connectorParam name="key"/>
        <connectorParam name="val"/>
        <connectorParam name="dur"/>
        <simpleCondition role="onSelection" key="$key"/>
        <simpleAction role="set" value="$val" duration="$dur" max="unbounded"/>
      </causalConnector>
    </connectorBase>
  </head>
  <body>
    <port id="p1" component="m1"/>
    <port id="p2" component="m1_right"/>
    <port id="p3" component="m1_depth_control"/>
    
    <media id="m1" src="media/image1.png">
      <property name="depth" value="1.0"/>
      <property name="left" value="5%"/>
      <property name="top" value="10%"/>
      <property name="width" value="25%"/>
      <property name="height" value="50%"/>
    </media>
    <media id="m1_right" src="media/image1.png">
      <property name="depth" value="1.0"/>
      <property name="left" value="52%"/>
      <property name="top" value="10%"/>
      <property name="width" value="25%"/>
      <property name="height" value="50%"/>
    </media>
    
    <media id="m1_depth_control" src="depth_control.lua">
      <property name="width" value="100%"/>
      <property name="height" value="100%"/>
      
      <!-- property name="user_scale_disparity" value="1.0"/ -->
      <property name="orig_depth" value="1.0"/>
      <property name="orig_left" value="0.53"/>
      <property name="final_left" value=""/>
      <property name="update_user_scale_disparity_by" value="0.0"/>
      
      <property name="cur_link"/>
    </media>
    
    <!-- For now, I think that the following heuristic will work!! -->
    <!-- original link: 
    <link id="link1" xconnector="onKeySelectionSet" >
      <bind role="onSelection" component="m1">
        <bindParam name="key" value="YELLOW"/>
      </bind>
      <bind role="set" component="m1" interface="left">
        <bindParam name="val" value="0.3"/>
        <bindParam name="dur" value="5s"/>
      </bind>
    </link> -->
    <!-- What about more than one attribution to left or depth in the same link? -->
    
    <!-- will be break into -->
    <!-- First part -->
    <link id="link1" xconnector="onKeySelectionSet" >
      <bind role="onSelection" component="m1">
        <bindParam name="key" value="YELLOW"/>
      </bind>
      <!-- set the current link -->
      <bind role="set" component="m1_depth_control" interface="cur_link">
        <bindParam name="val" value="link1"/> <!-- sounds like a gambi -->
      </bind>
      <bind role="set" component="m1_depth_control" interface="orig_left">
        <bindParam name="val" value="0.3"/>
      </bind>
    </link>
    
    <!-- Second part -->
    <!-- This link guarantee the left- and right-side synchronization -->
    <link id="update_left_and_right" xconnector="onEndAttributionTestSet">
      <!-- Warning! This will always perform the animation -->
      <bind role="onEndAttribution" component="m1_depth_control" interface="final_left"/>
      
      <!-- This solves the problem mentioned above -->
      <bind role="test" component="m1_depth_control" interface="cur_link">
        <bindParam name="testval" value="link1"/>
      </bind>

      <bind role="getOrigLeft" component="m1_depth_control" interface="orig_left"/>
      <bind role="getFinalLeft" component="m1_depth_control" interface="final_left"/>

      <bind role="set" component="m1" interface="left">
        <bindParam name="val" value="$getOrigLeft"/>
        <bindParam name="dur" value="5s"/>
      </bind>
      
      <bind role="set" component="m1_right" interface="left">
        <bindParam name="val" value="$getFinalLeft"/>
        <bindParam name="dur" value="5s"/>
      </bind>
      
      <bind role="set" component="m1_depth_control" interface="cur_link">
        <bindParam name="val" value=""/>
      </bind>
    </link>
    <!-- End synchronization -->
    
    <link xconnector="onKeySelectionSet" >
      <bind role="onSelection" component="m1">
        <bindParam name="key" value="GREEN"/>
      </bind>
      <bind role="set" component="m1" interface="depth">
        <bindParam name="val" value="0"/>
      </bind>
    </link>
    
    <!-- The following would work if there aren't animations -->
    <!-- link id="update_orig_depth" xconnector="onEndAttributionSet">
      <bind role="onEndAttribution" component="m1" interface="depth"/>
      <bind role="get" component="m1" interface="depth"/>
      <bind role="set" component="m1_depth_control" interface="orig_depth">
        <bindParam name="val" value="$get"/>
      </bind>
    </link>
    
    <link id="update_orig_left" xconnector="onEndAttributionSet">
      <bind role="onEndAttribution" component="m1" interface="left"/>
      <bind role="get" component="m1" interface="left"/>
      <bind role="set" component="m1_depth_control" interface="orig_left">
        <bindParam name="val" value="$get"/>
      </bind>
    </link>
    
    <link id="update_dest_left" xconnector="onEndAttributionSet">
      <bind role="onEndAttribution" component="m1_depth_control" interface="final_left"/>
      <bind role="get" component="m1_depth_control" interface="final_left"/>
      <bind role="set" component="m1_right" interface="left">
        <bindParam name="val" value="$get"/>
      </bind>
    </link -->
    <!-- end -->
    
    <link id="sub_user_scale_disparity" xconnector="onKeySelectionSet">
      <bind role="onSelection" component="m1">
        <bindParam name="key" value="RED"/>
      </bind>
      <bind role="set" component="m1_depth_control" interface="update_user_scale_disparity_by">
        <bindParam name="val" value="-0.05"/>
      </bind>
    </link>
    
    <link id="add_user_scale_disparity" xconnector="onKeySelectionSet">
      <bind role="onSelection" component="m1">
        <bindParam name="key" value="BLUE"/>
      </bind>
      <bind role="set" component="m1_depth_control" interface="update_user_scale_disparity_by">
        <bindParam name="val" value="0.05"/>
      </bind>
    </link>  
  </body>
</ncl>
