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
  <body>
    <port id="p1" component="m1"/>
    <port id="p2" component="m2"/>
    <port id="p3" component="m3"/>
    <port id="p4" component="m4"/>
    
    <media id="m1" src="image1.png">
      <property name="stereo_disparity" value="-20%"/>

      <property name="left" value="10%"/>
      <property name="top" value="10%"/>
      <property name="width" value="30%"/>
      <property name="height" value="30%"/>
    </media>
    
    <media id="m2" src="image1.png">
      <!-- property name="stereo_disparity" value="-10%"/ -->  
      <property name="left" value="45%"/>
      <property name="top" value="10%"/>

      <property name="width" value="30%"/>
      <property name="height" value="30%"/>
    </media>
    
    <media id="m3" src="image1.png">
      <property name="stereo_disparity" value="10%"/>
      
      <property name="left" value="10%"/>
      <property name="top" value="45%"/>
      <property name="width" value="30%"/>
      <property name="height" value="30%"/>
    </media>
    
    <media id="m4" src="image1.png">
      <property name="stereo_disparity" value="20%"/>
      
      <property name="left" value="45%"/>
      <property name="top" value="45%"/>
      <property name="width" value="30%"/>
      <property name="height" value="30%"/>
    </media>
  </body>
</ncl>
