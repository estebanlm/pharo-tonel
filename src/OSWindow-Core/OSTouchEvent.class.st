"
i am the different touch events. As a lot of event should be raises at the same time I should be par of 

I have the same logic as the Android Event. For my realy first draw maybe I should be refined late, depending of the need.

I am design to manage:
	- Touch Event from mobile platform
	- Touch Event from Graphical Tools (graphical palette)
	
Developpement version Todo Work in progress

"
Class {
	#name : #OSTouchEvent,
	#superclass : #OSEvent,
	#instVars : [
		'deviceId',
		'timestamp'
	],
	#category : #OSWindow-Core-Events-Touch,
	#timestamp : 'jeanbaptistearnaud 2/26/2015 17:12'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchEvent>>deviceId [
	^ deviceId
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchEvent>>deviceId: anObject [
	deviceId := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchEvent>>timestamp [
	^timestamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchEvent>>timestamp: anObject [
	timestamp := anObject
]
