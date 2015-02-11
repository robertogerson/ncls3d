<?xml version="1.0" encoding="UTF-8"?>
<ncl id="test1">
  <head>
    <regionBase>
      <region id="rg1" left="10%" top="10%" width="20%" height="20%"/>
    </regionBase>
    <descriptorBase>
      <descriptor id="ds1" region="rg1" focusIndex="1"/>
    </descriptorBase>
  </head>
  <body>
    <port id="p1" component="m1"/>
    
    <media id="m1" src="animGar.mp4" descriptor="ds1"/>
  </body>
</ncl>
