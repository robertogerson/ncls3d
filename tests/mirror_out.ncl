<?xml version="1.0" encoding="UTF-8"?>
<ncl id="test1">
  <head>
    <regionBase>
      <region id="regions_left" left="0%" top="0%" width="50%" height="100%">
        <region id="rg1" left="10%" top="10%" width="20%" height="20%"/>
      </region>
      <region id="regions_right" left="50%" top="0%" width="50%" height="100%">
        <region id="rg1_right" left="10%" top="10%" width="20%" height="20%"/>
      </region>
    </regionBase>
    <descriptorBase>
      <descriptor id="ds1" region="rg1" focusIndex="1"/>
      <descriptor id="ds1_right" region="rg1_right" focusIndex="1"/>
    </descriptorBase>
  </head>
  <body>
    <port id="p1" component="m1"/>
    <media id="m1" src="animGar.mp4" descriptor="ds1"/>
    <port id="p1_right" component="m1_right"/>
    <media id="m1_right" src="ncl-mirror://m1" descriptor="ds1_right"/>
  </body>
</ncl>
