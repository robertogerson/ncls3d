<?xml version="1.0" encoding="UTF-8"?>
<ncl id="test1">
	<body>
		<port id="p1" component="m1"/>
		<media id="m1" src="media/image1.png">
			<property name="depth" value="1.0"/>
			<property name="left" value="5%"/>
			<property name="top" value="10%"/>
			<property name="width" value="25%"/>
			<property name="height" value="50%"/>
		</media>
		<port id="p1_right" component="m1_right"/>
		<media id="m1_right" src="ncl-mirror://m1">
			<property name="depth" value="1.0"/>
			<property name="left" value="54%"/>
			<property name="top" value="10%"/>
			<property name="width" value="25%"/>
			<property name="height" value="50%"/>
		</media>
		<media id="m1_depth_control" src="media/depth_control.lua">
			<property name="width" value="100%"/>
			<property name="height" value="100%"/>
			<property name="orig_depth" value=""/>
			<property name="orig_left" value=""/>
			<property name="orig_width" value=""/>
			<property name="orig_bounds" value=""/>
			<property name="final_bounds_left" value=""/>
			<property name="final_bounds_right" value=""/>
			<property name="update_user_scale_disparity_by" value="0.0"/>
		</media>
		<link id="m1_update_bounds_left" xconnector="onEndAttributionSet_var">
			<bind role="onEndAttribution" component="m1_depth_control" interface="final_bounds_left"/>
			<bind role="get" component="m1_depth_control" interface="final_bounds_left"/>
			<bind role="set" component="m1" interface="bounds">
				<bindParam name="var" value="$get"/>
			</bind>
		</link>
		<link id="m1_update_bounds_right" xconnector="onEndAttributionSet_var">
			<bind role="onEndAttribution" component="m1_depth_control" interface="final_bounds_right"/>
			<bind role="get" component="m1_depth_control" interface="final_bounds_right"/>
			<bind role="set" component="m1_right" interface="bounds">
				<bindParam name="var" value="$get"/>
			</bind>
		</link>
	</body>
</ncl>
