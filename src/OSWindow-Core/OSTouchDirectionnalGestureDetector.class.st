"
I detect gestures which needs all fingers to go on a certain direction (creating a delta distance)
"
Class {
	#name : #OSTouchDirectionnalGestureDetector,
	#superclass : #OSTouchGestureNeedingThresholdDetector,
	#category : #OSWindow-Core-Gestures,
	#timestamp : 'MerwanOuddane 7/22/2015 16:13'
}

{
	#category : #'event field',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTouchDirectionnalGestureDetector>>dDist [
	^ self subclassResponsibility
]
