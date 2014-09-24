<ncl id="myNCLDocID" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<connectorBase id="connBaseId">
			<importBase alias="conn" documentURI="defaultConnBase.ncl">
			</importBase>
			<causalConnector id="onEndAttributionTestVarSet_var">
				<connectorParam name="var_test">
				</connectorParam>
				<connectorParam name="var_set">
				</connectorParam>
				<compoundCondition operator="and">
					<simpleCondition role="onEndAttribution">
					</simpleCondition>
					<assessmentStatement comparator="eq">
						<attributeAssessment eventType="attribution" role="var">
						</attributeAssessment>
						<valueAssessment value="$var_test">
						</valueAssessment>
					</assessmentStatement>
				</compoundCondition>
				<simpleAction duration="0.5s" max="unbounded" role="set" value="$var_set">
				</simpleAction>
			</causalConnector>
		</connectorBase>
		<regionBase id="regionBase0">
			<region height="10.00%" id="region2" left="4.00%" top="10.00%" width="5.00%" zIndex="3">
			</region>
			<region height="15.00%" id="rgPinterest_left" left="6.50%" top="10.00%" width="5.00%" zIndex="6">
			</region>
			<region height="15.00%" id="rgTwitter_left" left="6.50%" top="30.00%" width="5.00%" zIndex="5">
			</region>
			<region height="15.00%" id="rgFacebook_left" left="6.50%" top="50.00%" width="5.00%" zIndex="4">
			</region>
			<region height="15.00%" id="rgGPlus_left" left="6.50%" top="70.00%" width="5.00%" zIndex="3">
			</region>
			<region height="15.00%" id="rgPinterest_right" left="57.00%" top="10.00%" width="5.00%" zIndex="6">
			</region>
			<region height="15.00%" id="rgTwitter_right" left="57.00%" top="30.00%" width="5.00%" zIndex="5">
			</region>
			<region height="15.00%" id="rgFacebook_right" left="57.00%" top="50.00%" width="5.00%" zIndex="4">
			</region>
			<region height="15.00%" id="rgGPlus_right" left="57.00%" top="70.00%" width="5.00%" zIndex="3">
			</region>
			<region height="100.00%" id="region4" left="0.00%" top="0.00%" width="100.00%" zIndex="0">
			</region>
		</regionBase>
		<descriptorBase id="descriptorBase1">
			<descriptor id="descriptor1" region="region2">
			</descriptor>
			<descriptor id="descriptor3" region="region4">
			</descriptor>
			<descriptor focusIndex="0" id="dPinterest_left" moveDown="1" moveUp="3" region="rgPinterest_left" focusBorderWidth="0">
			</descriptor>
			<descriptor focusIndex="1" id="dTwitter_left" moveDown="2" moveUp="0" region="rgTwitter_left" focusBorderWidth="0">
			</descriptor>
			<descriptor focusIndex="2" id="dFacebook_left" moveDown="3" moveUp="1" region="rgFacebook_left" focusBorderWidth="0">
			</descriptor>
			<descriptor focusIndex="3" id="dGPlus_left" moveDown="0" moveUp="2" region="rgGPlus_left" focusBorderWidth="0">
			</descriptor>
			<descriptor id="dPinterest_right" region="rgPinterest_right">
			</descriptor>
			<descriptor id="dTwitter_right" region="rgTwitter_right">
			</descriptor>
			<descriptor id="dFacebook_right" region="rgFacebook_right">
			</descriptor>
			<descriptor id="dGPlus_right" region="rgGPlus_right">
			</descriptor>
		</descriptorBase>
	</head>
	<body id="myBodyID">
		<!-- media descriptor="descriptor3" id="lg_3d_demo">
		</media>
		<port component="lg_3d_demo" id="p2">
		</port>
		<link id="link0" xconnector="conn#onKeySelectionStart">
			<bind component="lg_3d_demo" role="onSelection">
				<bindParam name="keyCode" value="RED">
				</bindParam>
			</bind>
			<bind component="menu" role="start">
			</bind>
		</link>
		<context id="menu" -->
			<port component="left" id="p0">
			</port>
			<context id="left">
				<port component="g_plus_left" id="p1">
				</port>
				<port component="pinterest_left" id="p3">
				</port>
				<port component="faceboook_left" id="p4">
				</port>
				<port component="twitter_left" id="p5">
				</port>
				<media id="settings" type="application/x-ginga-settings">
					<property name="service.currentFocus">
					</property>
				</media>
				<media descriptor="dPinterest_left" id="pinterest_left" src="pinterest-big.png">
					<property name="bounds">
					</property>
				</media>
				<media descriptor="dTwitter_left" id="twitter_left" src="twitter-big.png">
					<property name="bounds">
					</property>
				</media>
				<media descriptor="dFacebook_left" id="faceboook_left" src="faceboook-big.png">
					<property name="bounds">
					</property>
				</media>
				<media descriptor="dGPlus_left" id="g_plus_left" src="g-plus-big.png">
					<property name="bounds">
					</property>
				</media>
				<link id="link1" xconnector="conn#onSelectionSet_var">
					<bind component="pinterest_left" role="onSelection">
					</bind>
					<bind component="pinterest_left" interface="bounds" role="set">
						<bindParam name="var_set" value="8%,5%,10%,30%">
						</bindParam>
					</bind>
					<bind component="twitter_left" interface="bounds" role="set">
						<bindParam name="var_set" value="6.5%,30%,5%,15%">
						</bindParam>
					</bind>
					<bind component="faceboook_left" interface="bounds" role="set">
						<bindParam name="var_set" value="6.5%,50%,5%,15%">
						</bindParam>
					</bind>
					<bind component="g_plus_left" interface="bounds" role="set">
						<bindParam name="var_set" value="6.5%,70%,5%,15%">
						</bindParam>
					</bind>
					<bind component="pinterest_right" interface="bounds" role="set">
						<bindParam name="var_set" value="57%,5%,10%,30%">
						</bindParam>
					</bind>
					<bind component="twitter_right" interface="bounds" role="set">
						<bindParam name="var_set" value="57%,30%,5%,15%">
						</bindParam>
					</bind>
					<bind component="faceboook_right" interface="bounds" role="set">
						<bindParam name="var_set" value="57%,50%,5%,15%">
						</bindParam>
					</bind>
					<bind component="g_plus_right" interface="bounds" role="set">
						<bindParam name="var_set" value="57%,70%,5%,15%">
						</bindParam>
					</bind>
				</link>
				<link id="link2" xconnector="conn#onSelectionSet_var">
					<bind component="twitter_left" role="onSelection">
					</bind>
					<bind component="pinterest_left" interface="bounds" role="set">
						<bindParam name="var_set" value="6.5%,10%,5%,15%">
						</bindParam>
					</bind>
					<bind component="twitter_left" interface="bounds" role="set">
						<bindParam name="var_set" value="8%,30%,10%,30%">
						</bindParam>
					</bind>
					<bind component="faceboook_left" interface="bounds" role="set">
						<bindParam name="var_set" value="6.5%,50%,5%,15%">
						</bindParam>
					</bind>
					<bind component="g_plus_left" interface="bounds" role="set">
						<bindParam name="var_set" value="6.5%,70%,5%,15%">
						</bindParam>
					</bind>
					<bind component="pinterest_right" interface="bounds" role="set">
						<bindParam name="var_set" value="57%,10%,5%,15%">
						</bindParam>
					</bind>
					<bind component="twitter_right" interface="bounds" role="set">
						<bindParam name="var_set" value="57%,30%,10%,30%">
						</bindParam>
					</bind>
					<bind component="faceboook_right" interface="bounds" role="set">
						<bindParam name="var_set" value="57%,50%,5%,15%">
						</bindParam>
					</bind>
					<bind component="g_plus_right" interface="bounds" role="set">
						<bindParam name="var_set" value="57%,70%,5%,15%">
						</bindParam>
					</bind>
				</link>
				<link id="link3" xconnector="conn#onSelectionSet_var">
					<bind component="faceboook_left" role="onSelection">
					</bind>
					<bind component="pinterest_left" interface="bounds" role="set">
						<bindParam name="var_set" value="6.5%,10%,5%,15%">
						</bindParam>
					</bind>
					<bind component="twitter_left" interface="bounds" role="set">
						<bindParam name="var_set" value="6.5%,30%,5%,15%">
						</bindParam>
					</bind>
					<bind component="faceboook_left" interface="bounds" role="set">
						<bindParam name="var_set" value="8%,50%,10%,30%">
						</bindParam>
					</bind>
					<bind component="g_plus_left" interface="bounds" role="set">
						<bindParam name="var_set" value="6.5%,70%,5%,15%">
						</bindParam>
					</bind>
					<bind component="pinterest_right" interface="bounds" role="set">
						<bindParam name="var_set" value="57%,10%,5%,15%">
						</bindParam>
					</bind>
					<bind component="twitter_right" interface="bounds" role="set">
						<bindParam name="var_set" value="57%,30%,5%,15%">
						</bindParam>
					</bind>
					<bind component="faceboook_right" interface="bounds" role="set">
						<bindParam name="var_set" value="57%,50%,10%,30%">
						</bindParam>
					</bind>
					<bind component="g_plus_right" interface="bounds" role="set">
						<bindParam name="var_set" value="57%,70%,5%,15%">
						</bindParam>
					</bind>
				</link>
				<link id="link4" xconnector="conn#onSelectionSet_var">
					<bind component="g_plus_left" role="onSelection">
					</bind>
					<bind component="pinterest_left" interface="bounds" role="set">
						<bindParam name="var_set" value="6.5%,10%,5%,15%">
						</bindParam>
					</bind>
					<bind component="twitter_left" interface="bounds" role="set">
						<bindParam name="var_set" value="6.5%,30%,5%,15%">
						</bindParam>
					</bind>
					<bind component="faceboook_left" interface="bounds" role="set">
						<bindParam name="var_set" value="6.5%,50%,5%,15%">
						</bindParam>
					</bind>
					<bind component="g_plus_left" interface="bounds" role="set">
						<bindParam name="var_set" value="8%,70%,10%,30%">
						</bindParam>
					</bind>
					<bind component="pinterest_right" interface="bounds" role="set">
						<bindParam name="var_set" value="57%,10%,5%,15%">
						</bindParam>
					</bind>
					<bind component="twitter_right" interface="bounds" role="set">
						<bindParam name="var_set" value="57%,30%,5%,15%">
						</bindParam>
					</bind>
					<bind component="faceboook_right" interface="bounds" role="set">
						<bindParam name="var_set" value="57%,50%,5%,15%">
						</bindParam>
					</bind>
					<bind component="g_plus_right" interface="bounds" role="set">
						<bindParam name="var_set" value="57%,70%,10%,30%">
						</bindParam>
					</bind>
				</link>
				<port component="pinterest_right" id="p6">
				</port>
				<port component="g_plus_right" id="p7">
				</port>
				<port component="faceboook_right" id="p8">
				</port>
				<port component="twitter_right" id="p9">
				</port>
				<media id="settings2" instance="instSame" refer="settings">
				</media>
				<media descriptor="dPinterest_right" id="pinterest_right" src="pinterest-big.png">
					<property name="bounds">
					</property>
				</media>
				<media descriptor="dTwitter_right" id="twitter_right" src="twitter-big.png">
					<property name="bounds">
					</property>
				</media>
				<media descriptor="dFacebook_right" id="faceboook_right" src="faceboook-big.png">
					<property name="bounds">
					</property>
				</media>
				<media descriptor="dGPlus_right" id="g_plus_right" src="g-plus-big.png">
					<property name="bounds">
					</property>
				</media>
			<!-- /context -->
		</context>
	</body>
</ncl>
