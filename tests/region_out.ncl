<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright (c) 2015 Roberto Azevedo

This file is part of ncls3d.

ncls3d is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

ncls3d is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with ncls3d. If not, see <http://www.gnu.org/licenses/>.
-->
<ncl id="test1">
  <head>
    <regionBase>
      <region id="regions_left" left="0%" top="0%" width="50%" height="100%">
        <region id="rg1" left="10%" top="10%" width="20%" height="20%">
        </region>
      </region>
      <region id="regions_right" left="50%" top="0%" width="50%" height="100%">
        <region id="rg1_right" left="10%" top="10%" width="20%" height="20%">
        </region>
      </region>
    </regionBase>
    <descriptorBase>
      <descriptor id="ds1" region="rg1">
      </descriptor>
      <descriptor id="ds1_right" region="rg1_right">
      </descriptor>
    </descriptorBase>
  </head>

  <body>
    <port id="p1" component="m1">
    </port>
    <media id="m1" src="image1.png" descriptor="ds1">
    </media>
    <port id="p1_right" component="m1_right">
    </port>
    <media id="m1_right" src="image1.png" descriptor="ds1_right">
    </media>
  </body>
</ncl>
