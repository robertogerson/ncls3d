<?xml version="1.0" encoding="UTF-8"?>
<ncl id="test1">
  <body>
    <port id="p1" component="m1"/>
    <media id="m1" src="../media/circle.png">
      <property name="depth" value="1.0"/>
      <property name="left" value="5%"/>
      <property name="top" value="10%"/>
      <property name="width" value="25%"/>
      <property name="height" value="50%"/>
      <property name="transparency" value="30%"/>
    </media>
    <port id="p1_right" component="m1_right"/>
    <media id="m1_right" src="ncl-mirror://m1">
      <property name="depth" value="1.0"/>
      <property name="left" value="54%"/>
      <property name="top" value="10%"/>
      <property name="width" value="25%"/>
      <property name="height" value="50%"/>
      <property name="transparency" value="30%"/>
    </media>
  </body>
</ncl>
