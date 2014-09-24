<?xml version="1.0" encoding="ISO-8859-1"?>
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
