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
      <region id="rgPinterest" left="13%" top="10.00%" width="10.00%" height="20.00%" zIndex="6"/>
      <region id="rgTwitter"   left="13%" top="30.00%" width="10.00%" height="20.00%" zIndex="5"/>
      <region id="rgFacebook"  left="13%" top="50.00%" width="10.00%" height="20.00%" zIndex="4"/>
      <region id="rgGPlus"     left="13%" top="70.00%" width="10.00%" height="20.00%" zIndex="3"/>
    </regionBase>
    <descriptorBase id="descriptorBase1">
      <descriptor focusIndex="0" id="dPinterest" moveDown="1" moveUp="3" region="rgPinterest"/>
      <descriptor focusIndex="1" id="dTwitter" moveDown="2" moveUp="0" region="rgTwitter"/>
      <descriptor focusIndex="2" id="dFacebook" moveDown="3" moveUp="1" region="rgFacebook"/>
      <descriptor focusIndex="3" id="dGPlus" moveDown="0" moveUp="2" region="rgGPlus"/>
    </descriptorBase>
    <connectorBase id="connBaseId">
      <causalConnector id="onSelectionSet_var">
        <connectorParam name="var"/>
        <simpleCondition role="onSelection"/>
        <simpleAction role="set" value="$var" max="unbounded" />
      </causalConnector>
    </connectorBase>
  </head>
  <body id="myBodyID">
    <port id="p1" component="g_plus" />
    
    <media id="pinterest" src="media/pinterest-big.png" descriptor="dPinterest">
      <property name="bounds"/>
    </media>  
    
    <link id="link1" xconnector="onSelectionSet_var">
      <bind component="pinterest" role="onSelection"/>
      <bind component="pinterest" interface="bounds" role="set">
        <bindParam name="var" value="15%,5%,15%,30%"/>
      </bind>
    </link>
  </body>
</ncl>

