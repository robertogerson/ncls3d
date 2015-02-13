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
    <media id="pinterest" src="../media/circle.png">
      <property name="bounds" value="10%,25%,40%,40%"/>
      <property name="depth" value="1"/>
      <property name="explicitDur" value="8s"/>
      <area id="timer1" begin="2s"/>
      <area id="timer2" begin="4s"/>
      <area id="timer3" begin="6s"/>
    </media>  
    <link id="link1" xconnector="onBeginSet_var">
      <bind component="pinterest" interface="timer1" role="onBegin"/>
      <bind component="pinterest" interface="depth" role="set">
        <bindParam name="var" value="-1"/>
      </bind>
    </link>
    <link id="link2" xconnector="onBeginSet_var">
      <bind component="pinterest" interface="timer2" role="onBegin"/>
      <bind component="pinterest" interface="depth" role="set">
        <bindParam name="var" value="0"/>
      </bind>
    </link>
    <link id="link3" xconnector="onBeginSet_var">
      <bind component="pinterest" interface="timer3" role="onBegin"/>
      <bind component="pinterest" interface="depth" role="set">
        <bindParam name="var" value="1"/>
      </bind>
    </link>
  </body>
</ncl>

