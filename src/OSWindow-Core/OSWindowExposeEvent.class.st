"
I am delivered when part (or whole) window are exposed on the desktop and needs refreshing.
"
Class {
	#name : #OSWindowExposeEvent,
	#superclass : #OSWindowEvent,
	#instVars : [
		'timestamp'
	],
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:32'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowExposeEvent>>accept: aVisitor [
	^ aVisitor visitWindowExposeEvent: self
]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowExposeEvent>>defaultAction [
	window renderer ifNotNil: [ window renderer exposed: timestamp ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowExposeEvent>>timestamp [
	^ timestamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowExposeEvent>>timestamp: anObject [
	timestamp := anObject
]
