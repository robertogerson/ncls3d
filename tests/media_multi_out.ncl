<?xml version="1.0" encoding="UTF-8"?>
<ncl id="test1">
  <body>
    <port id="p1" component="m1"/>
    <port id="p2" component="m2"/>
    <port id="p3" component="m3"/>
    <port id="p4" component="m4"/>
    <media id="m1" src="../media/circle.png">
      <property name="depth" value="-1.0"/>
      <property name="left" value="5%"/>
      <property name="top" value="10%"/>
      <property name="width" value="15%"/>
      <property name="height" value="30%"/>
    </media>
    <media id="m2" src="../media/square.png">
      <property name="left" value="22.5%"/>
      <property name="top" value="10%"/>
      <property name="width" value="15%"/>
      <property name="height" value="30%"/>
    </media>
    <media id="m3" src="../media/text.txt">
      <property name="depth" value="0.5"/>
      <property name="fontSize" value="40"/>
      <property name="left" value="5%"/>
      <property name="top" value="45%"/>
      <property name="width" value="15%"/>
      <property name="height" value="30%"/>
    </media>
    <media id="m4" src="../media/triangle.png">
      <property name="depth" value="1.0"/>
      <property name="left" value="22.5%"/>
      <property name="top" value="45%"/>
      <property name="width" value="15%"/>
      <property name="height" value="30%"/>
    </media>
    <port id="p1_right" component="m1_right"/>
    <port id="p2_right" component="m2_right"/>
    <port id="p3_right" component="m3_right"/>
    <port id="p4_right" component="m4_right"/>
    <media id="m1_right" src="ncl-mirror://m1">
      <property name="depth" value="-1.0"/>
      <property name="left" value="57%"/>
      <property name="top" value="10%"/>
      <property name="width" value="15%"/>
      <property name="height" value="30%"/>
    </media>
    <media id="m2_right" src="ncl-mirror://m2">
      <property name="left" value="72.5%"/>
      <property name="top" value="10%"/>
      <property name="width" value="15%"/>
      <property name="height" value="30%"/>
    </media>
    <media id="m3_right" src="ncl-mirror://m3">
      <property name="depth" value="0.5"/>
      <property name="fontSize" value="40"/>
      <property name="left" value="54.5%"/>
      <property name="top" value="45%"/>
      <property name="width" value="15%"/>
      <property name="height" value="30%"/>
    </media>
    <media id="m4_right" src="ncl-mirror://m4">
      <property name="depth" value="1.0"/>
      <property name="left" value="71.5%"/>
      <property name="top" value="45%"/>
      <property name="width" value="15%"/>
      <property name="height" value="30%"/>
    </media>
  </body>
</ncl>
