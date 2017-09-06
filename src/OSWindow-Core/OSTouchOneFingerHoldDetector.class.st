"
I am the detector of the hold with one finger.
I send these event back to my handler: 
	- OSTouchOneFingerHoldEvent
"
Class {
	#name : #OSTouchOneFingerHoldDetector,
	#superclass : #OSTouchHoldDetector,
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 7/22/2015 16:25'
}

{
	#category : #creation,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchOneFingerHoldDetector>>createHoldEvent [
	^ OSTouchOneFingerHoldEvent new 
		position: self centerOfAllFingers;
		timestamp: eventHandler lastUpdateTimestamp ;
		deviceId: deviceId;
		yourself
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchOneFingerHoldDetector>>necessaryFingers [
	^ 1
]
