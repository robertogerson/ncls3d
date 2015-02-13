<?xml version="1.0" encoding="UTF-8"?>
<ncl id="test1">
  <head>
    <regionBase>
      <region id="rg1" left="25%" top="25%" width="60%" height="50%"/>
    </regionBase>
    <descriptorBase>
      <descriptor id="ds1" region="rg1"/>
    </descriptorBase>
  </head>
  <body>
    <port id="p1" component="m1"/>
    <media id="m1" src="../media/circle.lua" descriptor="ds1"/>
  </body>
</ncl>
