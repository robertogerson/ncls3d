<?xml version="1.0" encoding="UTF-8"?>
<ncl>
  <head>
    <regionBase>
      <region id="regions_left" left="0%" top="0%" width="50%" height="100%">
        <region id="rg1" left="10%" top="10%" width="40%" height="20%"/>
      </region>
      <region id="regions_right" left="50%" top="0%" width="50%" height="100%">
        <region id="rg1_right" left="10%" top="10%" width="40%" height="20%"/>
      </region>
    </regionBase>
    <transitionBase>
      <transition id="fade" type="fade" dur="1s"/>
    </transitionBase>
    <descriptorBase>
      <descriptor id="ds1" region="rg1" transIn="fade" transOut="fade" explicitDur="5s"/>
      <descriptor id="ds1_right" region="rg1_right" transIn="fade" transOut="fade" explicitDur="5s"/>
    </descriptorBase>
  </head>
  <body>
    <port id="p1" component="m1"/>
    <media id="m1" src="media/image.png" descriptor="ds1"/>
    <port id="p1_right" component="m1_right"/>
    <media id="m1_right" src="ncl-mirror://m1" descriptor="ds1_right"/>
  </body>
</ncl>
