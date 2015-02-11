<?xml version="1.0" encoding="UTF-8"?>
<ncl id="test1">
  <body>
    <port id="p1" component="m1"/>
    <port id="p2" component="m2"/>
    <port id="p3" component="m3"/>
    <port id="p4" component="m4"/>
    
    <media id="m1" src="../media/circle.png">
      <property name="depth" value="-1.0"/>

      <property name="left" value="10%"/>
      <property name="top" value="10%"/>
      <property name="width" value="30%"/>
      <property name="height" value="30%"/>
    </media>
    
    <media id="m2" src="../media/square.png">
      <property name="left" value="45%"/>
      <property name="top" value="10%"/>

      <property name="width" value="30%"/>
      <property name="height" value="30%"/>
    </media>
    
    <media id="m3" src="../media/text.txt">
      <property name="depth" value="0.5"/>
      
      <property name="fontSize" value="40"/>
      <property name="left" value="10%"/>
      <property name="top" value="45%"/>
      <property name="width" value="30%"/>
      <property name="height" value="30%"/>
    </media>
   
    <!-- This should be a video --> 
    <media id="m4" src="../media/triangle.png">
      <property name="depth" value="1.0"/>
      
      <property name="left" value="45%"/>
      <property name="top" value="45%"/>
      <property name="width" value="30%"/>
      <property name="height" value="30%"/>
    </media>
  </body>
</ncl>
