<?xml version="1.0" encoding="UTF-8"?>
<ncl id="myNCLDocID" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
  <head>
    <regionBase id="regionBase0">
      <region id="rgPinterest" left="13%" top="10.00%" width="10.00%" height="20.00%" zIndex="6"/>
    </regionBase>
    <descriptorBase id="descriptorBase1">
      <descriptor focusIndex="0" id="dPinterest" moveDown="1" moveUp="3" region="rgPinterest"/>
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
    <port id="p1" component="pinterest" />
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

