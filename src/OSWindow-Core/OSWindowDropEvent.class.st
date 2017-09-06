"
I am delivered when user drop something into the window (of course, if there's a drag and drop support by underlaying platform).
"
Class {
	#name : #OSWindowDropEvent,
	#superclass : #OSWindowEvent,
	#instVars : [
		'filePath',
		'timestamp'
	],
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:31'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowDropEvent>>accept: aVisitor [
	^ aVisitor visitWindowDropEvent: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowDropEvent>>filePath [
	^ filePath
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowDropEvent>>filePath: anObject [
	filePath := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowDropEvent>>printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' filePath: ''';
		nextPutAll: filePath;
		nextPut: $'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowDropEvent>>timestamp [
	^ timestamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowDropEvent>>timestamp: anObject [
	timestamp := anObject
]
