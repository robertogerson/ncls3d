<?xml version="1.0" encoding="UTF-8"?>
<ncl id="test1">
	<head>
		<connectorBase>
			<causalConnector id="onEndAttributionSet_var">
				<connectorParam name="var"/>
        <connectorParam name="dur"/>
				<simpleCondition role="onEndAttribution"/>
				<simpleAction role="set" value="$var" duration="$dur" max="unbounded" qualifier="par"/>
			</causalConnector>
			<causalConnector id="onEndAttributionTestSet">
				<connectorParam name="val"/>
				<connectorParam name="dur"/>
				<connectorParam name="testval"/>
				<compoundCondition operator="and">
					<simpleCondition role="onEndAttribution"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="test" eventType="attribution" attributeType="nodeProperty"/>
						<valueAssessment value="$testval"/>
					</assessmentStatement>
				</compoundCondition>
				<simpleAction role="set" value="$val" duration="$dur" max="unbounded" qualifier="seq"/>
			</causalConnector>
			<causalConnector id="onKeySelectionSet">
				<connectorParam name="key"/>
				<connectorParam name="val"/>
				<connectorParam name="dur"/>
				<simpleCondition role="onSelection" key="$key"/>
				<simpleAction role="set" value="$val" duration="$dur" max="unbounded"/>
			</causalConnector>
		</connectorBase>
	</head>
	<body>
		<port id="p1" component="m1"/>
    <port id="p1_right" component="m1_right"/>
    
		<media id="m1" src="media/image1.png">
			<property name="depth" value="1.0"/>
			<property name="left" value="2.5%"/>
      <property name="top" value="10%"/>
			<property name="width" value="12.5%"/>
			<property name="height" value="50%"/>
      
      <property name="bounds"/>
		</media>
    
    <media id="m1_right" src="media/image1.png">
			<property name="depth" value="1.0"/>
			<property name="left" value="51.5%"/>
      <property name="top" value="10%"/>
			<property name="width" value="12.5%"/>
			<property name="height" value="50%"/>
      
      <property name="bounds"/>
		</media> 
  
    <link id="link1" xconnector="onKeySelectionSet">
			<bind role="onSelection" component="m1">
				<bindParam name="key" value="RED"/>
			</bind>
			<bind role="set" component="m1_depth_control" interface="orig_depth">
				<bindParam name="val" value="1"/>
			</bind>
		</link>
    
    <link id="link2" xconnector="onKeySelectionSet">
			<bind role="onSelection" component="m1">
				<bindParam name="key" value="BLUE"/>
			</bind>
			<bind role="set" component="m1_depth_control" interface="orig_depth">
				<bindParam name="val" value="0"/>
			</bind>
		</link>
    
    <link id="link3" xconnector="onKeySelectionSet">
			<bind role="onSelection" component="m1">
				<bindParam name="key" value="YELLOW"/>
			</bind>
			<bind role="set" component="m1_depth_control" interface="orig_depth">
				<bindParam name="val" value="-1"/>
			</bind>
		</link>
    
    <port id="p1_m1_depth_control" component="m1_depth_control"/>
		<media id="m1_depth_control" src="media/depth_control.lua">
			<property name="width" value="100%"/>
			<property name="height" value="100%"/>
			
      <property name="orig_depth" value=""/>
			<property name="orig_left" value=""/>
			<property name="orig_width" value=""/>
      <!-- This is a problem! This is not notified to NCLua object -->
			<property name="orig_bounds" value="5%,10%,25%,50%"/>
      
			<property name="final_bounds_left" value=""/>
			<property name="final_bounds_right" value=""/>
			<property name="update_user_scale_disparity_by" value="0.0"/>
		</media>
    
    <!-- This following two links should be only one -->
		<!-- link id="m1_update_bounds_left" xconnector="onEndAttributionSet_var">
			<bind role="onEndAttribution" component="m1_depth_control" interface="final_bounds_left"/>
			<bind role="get" component="m1_depth_control" interface="final_bounds_left"/>
			<bind role="set" component="m1" interface="bounds">
				<bindParam name="var" value="$get"/>
        <bindParam name="dur" value="5s"/>
			</bind>
		</link -->
    
		<link id="m1_update_bounds_right" xconnector="onEndAttributionSet_var">
			<bind role="onEndAttribution" component="m1_depth_control" interface="final_bounds_right"/>
			<bind role="get" component="m1_depth_control" interface="final_bounds_right"/>
			<bind role="set" component="m1_right" interface="bounds">
				<bindParam name="var" value="$get"/>
        <bindParam name="dur" value="1.5s"/>
			</bind>
      <bind role="get2" component="m1_depth_control" interface="final_bounds_left"/>
			<bind role="set" component="m1" interface="bounds">
				<bindParam name="var" value="$get2"/>
        <bindParam name="dur" value="1.5s"/>
			</bind>
		</link>
	</body>
</ncl>


