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
  
    <media id="m1" src="media/image1.png">
      <property name="depth" value="1.0"/>
      <property name="left" value="5%"/>
      <property name="top" value="10%"/>
      <property name="width" value="25%"/>
      <property name="height" value="50%"/>
    </media>

    <link id="link1" xconnector="onKeySelectionSet">
      <bind role="onSelection" component="m1">
        <bindParam name="key" value="YELLOW"/>
      </bind>
      <bind role="set" component="m1" interface="left">
        <bindParam name="val" value="0.3"/>
      </bind>
    </link>
  </body>
</ncl>
