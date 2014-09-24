<?xml version="1.0" encoding="UTF-8"?>
<ncl id="test1">
  <head>
    <regionBase>
      <region id="rg1" left="10%" top="10%" width="20%" height="20%"/>
      <region id="rg2" left="10%" top="30%" width="20%" height="20%"/>
    </regionBase>
    <descriptorBase>
      <descriptor id="ds1" region="rg1" focusIndex="1"/>
      <descriptor id="ds2" region="rg2"/>
    </descriptorBase>
  </head>
	<body>
		<port id="p1" component="m1"/>
    <port id="p1_mirror" component="m1_mirror"/>
    
		<media id="m1" src="animGar.mp4" descriptor="ds1"/>
    <media id="m1_mirror" src="image1.png" descriptor="ds2"/>
	</body>
</ncl>
