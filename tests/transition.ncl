<?xml version="1.0" encoding="UTF-8"?>
<ncl>
  <head>
    <regionBase>
      <region id="rg1" left="10%" top="10%" width="40%" height="20%"/>
    </regionBase>
    <transitionBase>
      <transition id="fade" type="fade" dur="1s"/>
    </transitionBase>
    <descriptorBase>
      <descriptor id="ds1" region="rg1" transIn="fade" transOut="fade"
        explicitDur="5s"/>
    </descriptorBase>
  </head>
  <body>
    <port id="p1" component="m1"/>
    <media id="m1" src="media/image.png" descriptor="ds1"/>
  </body>
</ncl>
