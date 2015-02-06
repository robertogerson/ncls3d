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
				<region id="rgTwitter" left="13%" top="30.00%" width="10.00%" height="20.00%" zIndex="5"/>
				<region id="rgFacebook" left="13%" top="50.00%" width="10.00%" height="20.00%" zIndex="4"/>
				<region id="rgGPlus" left="13%" top="70.00%" width="10.00%" height="20.00%" zIndex="3"/>
			</region>
			<region id="regions_right" left="50%" top="0%" width="50%" height="100%">
				<region id="rgPinterest_right" left="13%" top="10.00%" width="10.00%" height="20.00%" zIndex="6"/>
				<region id="rgTwitter_right" left="13%" top="30.00%" width="10.00%" height="20.00%" zIndex="5"/>
				<region id="rgFacebook_right" left="13%" top="50.00%" width="10.00%" height="20.00%" zIndex="4"/>
				<region id="rgGPlus_right" left="13%" top="70.00%" width="10.00%" height="20.00%" zIndex="3"/>
			</region>
		</regionBase>
		<descriptorBase id="descriptorBase1">
			<descriptor focusIndex="0" id="dPinterest" moveDown="1" moveUp="3" region="rgPinterest"/>
			<descriptor focusIndex="1" id="dTwitter" moveDown="2" moveUp="0" region="rgTwitter"/>
			<descriptor focusIndex="2" id="dFacebook" moveDown="3" moveUp="1" region="rgFacebook"/>
			<descriptor focusIndex="3" id="dGPlus" moveDown="0" moveUp="2" region="rgGPlus"/>
			<descriptor focusIndex="0" id="dPinterest_right" moveDown="1" moveUp="3" region="rgPinterest_right"/>
			<descriptor focusIndex="1" id="dTwitter_right" moveDown="2" moveUp="0" region="rgTwitter_right"/>
			<descriptor focusIndex="2" id="dFacebook_right" moveDown="3" moveUp="1" region="rgFacebook_right"/>
			<descriptor focusIndex="3" id="dGPlus_right" moveDown="0" moveUp="2" region="rgGPlus_right"/>
		</descriptorBase>
		<connectorBase id="connBaseId">
			<causalConnector id="onSelectionSet_var">
				<connectorParam name="var"/>
				<simpleCondition role="onSelection"/>
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
		<port id="p1" component="g_plus"/>
		<port id="p3" component="pinterest"/>
		<port id="p4" component="faceboook"/>
		<port id="p5" component="twitter"/>
		<media id="pinterest" src="media/pinterest-big.png" descriptor="dPinterest">
			<property name="bounds"/>
		</media>
		<media id="twitter" src="media/twitter-big.png" descriptor="dTwitter">
			<property name="bounds"/>
		</media>
		<media id="faceboook" src="media/facebook-big.png" descriptor="dFacebook">
			<property name="bounds"/>
		</media>
		<media id="g_plus" src="media/g-plus-big.png" descriptor="dGPlus">
			<property name="bounds"/>
		</media>
		<link id="link1" xconnector="onSelectionSet_var">
			<bind component="pinterest" role="onSelection"/>
			<bind component="pinterest" interface="bounds" role="set">
				<bindParam name="var" value="15%,5%,15%,30%"/>
			</bind>
			<bind component="twitter" interface="bounds" role="set">
				<bindParam name="var" value="13%,30%,10%,20%"/>
			</bind>
			<bind component="faceboook" interface="bounds" role="set">
				<bindParam name="var" value="13%,50%,10%,20%"/>
			</bind>
			<bind component="g_plus" interface="bounds" role="set">
				<bindParam name="var" value="13%,70%,10%,20%"/>
			</bind>
			<!-- bind component="pinterest_right" interface="bounds" role="set">
				<bindParam name="var" value="15%,5%,15%,30%"/>
			</bind -->
			<bind component="twitter_right" interface="bounds" role="set">
				<bindParam name="var" value="13%,30%,10%,20%"/>
			</bind>
			<bind component="faceboook_right" interface="bounds" role="set">
				<bindParam name="var" value="13%,50%,10%,20%"/>
			</bind>
			<bind component="g_plus_right" interface="bounds" role="set">
				<bindParam name="var" value="13%,70%,10%,20%"/>
			</bind>
		</link>
		<link id="link2" xconnector="onSelectionSet_var">
			<bind component="twitter" role="onSelection"/>
			<bind component="pinterest" interface="bounds" role="set">
				<bindParam name="var" value="13%,10%,10%,20%"/>
			</bind>
			<bind component="twitter" interface="bounds" role="set">
				<bindParam name="var" value="15%,30%,15%,30%"/>
			</bind>
			<bind component="faceboook" interface="bounds" role="set">
				<bindParam name="var" value="13%,50%,10%,20%"/>
			</bind>
			<bind component="g_plus" interface="bounds" role="set">
				<bindParam name="var" value="13%,70%,10%,20%"/>
			</bind>
			<bind component="pinterest_right" interface="bounds" role="set">
				<bindParam name="var" value="13%,10%,10%,20%"/>
			</bind>
			<bind component="twitter_right" interface="bounds" role="set">
				<bindParam name="var" value="15%,30%,15%,30%"/>
			</bind>
			<bind component="faceboook_right" interface="bounds" role="set">
				<bindParam name="var" value="13%,50%,10%,20%"/>
			</bind>
			<bind component="g_plus_right" interface="bounds" role="set">
				<bindParam name="var" value="13%,70%,10%,20%"/>
			</bind>
		</link>
		<link id="link3" xconnector="onSelectionSet_var">
			<bind component="faceboook" role="onSelection"/>
			<bind component="pinterest" interface="bounds" role="set">
				<bindParam name="var" value="13%,10%,10%,20%"/>
			</bind>
			<bind component="twitter" interface="bounds" role="set">
				<bindParam name="var" value="13%,30%,10%,20%"/>
			</bind>
			<bind component="faceboook" interface="bounds" role="set">
				<bindParam name="var" value="15%,50%,15%,30%"/>
			</bind>
			<bind component="g_plus" interface="bounds" role="set">
				<bindParam name="var" value="13%,70%,10%,20%"/>
			</bind>
			<bind component="pinterest_right" interface="bounds" role="set">
				<bindParam name="var" value="13%,10%,10%,20%"/>
			</bind>
			<bind component="twitter_right" interface="bounds" role="set">
				<bindParam name="var" value="13%,30%,10%,20%"/>
			</bind>
			<bind component="faceboook_right" interface="bounds" role="set">
				<bindParam name="var" value="15%,50%,15%,30%"/>
			</bind>
			<bind component="g_plus_right" interface="bounds" role="set">
				<bindParam name="var" value="13%,70%,10%,20%"/>
			</bind>
		</link>
		<link id="link4" xconnector="onSelectionSet_var">
			<bind component="g_plus" role="onSelection"/>
			<bind component="pinterest" interface="bounds" role="set">
				<bindParam name="var" value="13%,10%,10%,20%"/>
			</bind>
			<bind component="twitter" interface="bounds" role="set">
				<bindParam name="var" value="13%,30%,10%,20%"/>
			</bind>
			<bind component="faceboook" interface="bounds" role="set">
				<bindParam name="var" value="13%,50%,10%,20%"/>
			</bind>
			<bind component="g_plus" interface="bounds" role="set">
				<bindParam name="var" value="15%,70%,15%,30%"/>
			</bind>
			<bind component="pinterest_right" interface="bounds" role="set">
				<bindParam name="var" value="13%,10%,10%,20%"/>
			</bind>
			<bind component="twitter_right" interface="bounds" role="set">
				<bindParam name="var" value="13%,30%,10%,20%"/>
			</bind>
			<bind component="faceboook_right" interface="bounds" role="set">
				<bindParam name="var" value="13%,50%,10%,20%"/>
			</bind>
			<bind component="g_plus_right" interface="bounds" role="set">
				<bindParam name="var" value="15%,70%,15%,30%"/>
			</bind>
		</link>
		<port id="p1_right" component="g_plus_right"/>
		<port id="p3_right" component="pinterest_right"/>
		<port id="p4_right" component="faceboook_right"/>
		<port id="p5_right" component="twitter_right"/>
		<media id="pinterest_right" src="ncl-mirror://pinterest" descriptor="dPinterest_right">
			<property name="bounds"/>
		</media>
		<media id="twitter_right" src="ncl-mirror://twitter" descriptor="dTwitter_right">
			<property name="bounds"/>
		</media>
		<media id="faceboook_right" src="ncl-mirror://faceboook" descriptor="dFacebook_right">
			<property name="bounds"/>
		</media>
		<media id="g_plus_right" src="ncl-mirror://g_plus" descriptor="dGPlus_right">
			<property name="bounds"/>
		</media>
		
		
		<!-- Must be generated -->
		<media id="pinterest_depth_control" src="depth_control.lua">
			<property name="width" value="100%"/>
			<property name="height" value="100%"/>
			
			<!-- property name="user_scale_disparity" value="1.0"/ -->
			<property name="orig_depth" value=""/>
			<property name="orig_left" value=""/>
			<property name="orig_width" value=""/>
			<property name="orig_bounds" value=""/>
			
			<property name="final_bounds" value=""/>
			<property name="update_user_scale_disparity_by" value="0.0"/>
		</media>
		
		<!-- We also should add to left -->
		<link id="update_orig_left" xconnector="onEndAttributionSet_var">
			<bind role="onEndAttribution" component="pinterest" interface="bounds"/>
			<bind role="get" component="pinterest" interface="bounds"/>
			<bind role="set" component="pinterest_depth_control" interface="orig_bounds">
				<bindParam name="var" value="$get"/>
			</bind>
		</link>
		
		<link id="update_dest_left" xconnector="onEndAttributionSet_var">
			<bind role="onEndAttribution" component="pinterest_depth_control" interface="final_bounds"/>
			<bind role="get" component="pinterest_depth_control" interface="final_bounds"/>
			<bind role="set" component="pinterest_right" interface="bounds">
				<bindParam name="var" value="$get"/>
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
