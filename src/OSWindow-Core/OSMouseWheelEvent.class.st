"
i am delivered when user scrolling the mouse wheel
"
Class {
	#name : #OSMouseWheelEvent,
	#superclass : #OSMouseEvent,
	#instVars : [
		'scrollHorizontal',
		'scrollVertical'
	],
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:23'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseWheelEvent>>accept: aVisitor [
	^ aVisitor visitMouseWheelEvent: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseWheelEvent>>scrollHorizontal [
	
	^ scrollHorizontal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseWheelEvent>>scrollHorizontal: anObject [
	
	scrollHorizontal := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseWheelEvent>>scrollVertical [
	
	^ scrollVertical
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseWheelEvent>>scrollVertical: anObject [
	
	scrollVertical := anObject
]
