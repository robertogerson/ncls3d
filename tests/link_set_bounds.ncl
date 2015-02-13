<?xml version="1.0" encoding="UTF-8"?>
<ncl id="myNCLDocID" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
  <head>
    <connectorBase id="connBaseId">
      <causalConnector id="onBeginSet_var">
        <connectorParam name="var"/>
        <simpleCondition role="onBegin"/>
        <simpleAction role="set" value="$var" max="unbounded" />
      </causalConnector>
    </connectorBase>
  </head>
  <body id="myBodyID">
    <port id="p1" component="pinterest" />
    <media id="pinterest" src="../media/triangle.png">
      <property name="bounds" value="13%,10%,10%,20%"/>
      <property name="depth" value="1"/>
      <property name="explicitDur" value="8s"/>
      <area id="timer" begin="3s"/>
    </media>  
    <link id="link1" xconnector="onBeginSet_var">
      <bind component="pinterest" interface="timer" role="onBegin"/>
      <bind component="pinterest" interface="bounds" role="set">
        <bindParam name="var" value="15%,5%,15%,30%"/>
      </bind>
    </link>
  </body>
</ncl>

