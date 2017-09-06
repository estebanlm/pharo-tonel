"
I am a gesture detector for gestures who has to travel a certain distance before being detected
"
Class {
	#name : #OSTouchGestureNeedingThresholdDetector,
	#superclass : #OSTouchStateGestureDetector,
	#instVars : [
		'minDistBeforeDetection'
	],
	#classVars : [
		'MinDistanceBeforeDetection'
	],
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 7/22/2015 16:11'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureNeedingThresholdDetector class>>initialize [
	super initialize.
	MinDistanceBeforeDetection := 0.05
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureNeedingThresholdDetector class>>minDistanceBeforeDetection [
	"I am the minimum percentage of the touch device that the user have to travel before the beginning of the event"

	^ MinDistanceBeforeDetection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureNeedingThresholdDetector class>>minDistanceBeforeDetection: anObject [
	MinDistanceBeforeDetection := anObject
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureNeedingThresholdDetector>>beginConditions [
	^ super beginConditions and: [ self eachFingersHadTravelledEnough ]
]

{
	#category : #calculating,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureNeedingThresholdDetector>>distanceTravelledForEachFingers [
	^ self activeFingers
			collect: [ :finger | finger distanceTravelled ]
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureNeedingThresholdDetector>>eachFingersHadTravelledEnough [
	^ self distanceTravelledForEachFingers allSatisfy: [ :each | each > minDistBeforeDetection ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchGestureNeedingThresholdDetector>>initialize [
	super initialize.
	minDistBeforeDetection := self class minDistanceBeforeDetection.
]
