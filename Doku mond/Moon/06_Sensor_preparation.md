---
layout: default
title: Sensor preparation
grand_parent: SensorModules
parent: Moon
nav_order: 6
---



## 2. Sensor preparation

### 2.1 Lux-Microclimate-Sensor-Tower (LMST)

- 1x Temperature sensor
- 1x Lux-sensor
- 1x Slide 25x25mm
- 1x Radiation shield top
- 2x Radiation shield middle 
- 1x Radiation shield bottom
- 1x Jumper-cables female/female in blue, yellow, violet 
- 1x Jumper-cables male/female in blue, yellow, violet 
- 2x Jumper-cables male/female in white, brown, black, red

First the jumper-cables need to be lengthened. Therefore connect the jumper-cables of  each color with female to male.

Alternatively the jumper-cables can be connected by soldering to improve durability. Here heat-shrink tubings are recommended to seal the cables form wetness. 

Connect the lengthened jumper-cables to the Lux- and Temperature-sensor.

Insert the Lux-Sensor in the mount of the Radiation shield top and paste the slide on the mounted Lux-sensor. Ensure that the glue (glue-gun) is sealing the space between the slide and the mount. Cut some grooves in the cooled off glue to ensure that water can drain.

Connect the Radiation shield middle parts to the Radiation shield top part and lead the jumper cables through the holes.

Paste the Temperature-sensor on the inner side of the mount plate in the Radiation shield bottom part and connect it to the Radiation shield while leading the cables trough the holes.



![LMST]({{site.url}}{{site.baseurl}}/assets/img/moon/lmst_CS.png)



### 2.2 Camera (CAM)

- 1x Raspberry Pie camera module v1.2
- 1x 30cm camera-cable
- 1x Camera-mount
- 1x Slide 25x25mm
- 1x Spherical head

First connect the 30cm camera-cable to the Raspberry Pie camera module and put it into the Camera-mount. Then close the cap on the backside and paste the slide on the front. Ensure that the glue (glue-gun) is sealing the space between the slide and the Camera-mount. Finally cut some grooves in the cooled off glue to ensure that water can drain if the camera is adjusted horizontally. Connect the camera mount to the spherical head.

![CS]({{site.url}}{{site.baseurl}}/assets/img/moon/CS.png)

### 2.3 Real-time-clock (RTC)

- 1x Real-time-clock
- 1x Jumper-cables female/female in red, black, yellow, blue
- 1x Pin-header with 2 pins

Solder the Pin-header to the Real-time-clock and connect the jumper-cables.

![RTC_rdy]({{site.url}}{{site.baseurl}}/assets/img/moon/RTC_rdy.png)

### 2.4 Hall-sensors set

- 2x Hall-sensor

- 2x Jumper-cable male/female red, black

- 1x Jumper-cable female/female orange, green

Connect the jumper-cables and adjust the sensitivity by turning the adjusting-screw on top of the sensors. Use a magnet to test the reaction: The Hall-sensor's lamp should glow if it senses a magnetic field.

![Hall_rdy]({{site.url}}{{site.baseurl}}/assets/img/moon/hall_rdy.png)

### 2.5 Microphone-Tower (MPT)

### 2.5.1 Expensiv Microphone-Tower (EMPT)

- 1x Microphone expensive version
- 1x Soundcard
- 1x Audio splitter-cable
- 1x Microtower expensive version

First construct a carrier for the acoustic cloth from the metal wire on top of the Mircotower. Attach the acoustic cloth to this carrier. The acoustic cloth should be flat to avoid water to drain trough it. Therefore the rain-exposed Top should have less folds. Than insert the mircophone expensive version in the Microtower and fix it with some glue.

Connect the Audio splitter-cable to the soundcard and than attach it to the Raspberry Pi.

![CS]({{site.url}}{{site.baseurl}}/assets/img/moon/CS.png)

### 2.5.2 Cheap Microphone-Tower (CMPT)

- 1x Microphone cheap version
- 1x Microtower cheap version

First construct a carrier for the acoustic cloth from the metal wire on top of the Mircotower. Attach the acoustic cloth to this carrier. The acoustic cloth should be flat to avoid water to drain trough it. Therefore the rain-exposed Top should have less folds. Than insert the mircophone cheap version in the Microtower and fix it with some glue.

![CS]({{site.url}}{{site.baseurl}}/assets/img/moon/CS.png)