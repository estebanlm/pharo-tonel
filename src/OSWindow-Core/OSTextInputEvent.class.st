"
i am delivered when user enters some text
"
Class {
	#name : #OSTextInputEvent,
	#superclass : #OSEvent,
	#instVars : [
		'text',
		'modifiers',
		'position'
	],
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:24'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTextInputEvent>>accept: aVisitor [
	^ aVisitor visitTextInputEvent: self
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTextInputEvent>>initialize [
	super initialize.
	modifiers := OSStateModifiers new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTextInputEvent>>modifiers [
	
	^ modifiers
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTextInputEvent>>modifiers: anObject [
	
	modifiers := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTextInputEvent>>position [
	
	^ position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTextInputEvent>>position: anObject [
	
	position := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTextInputEvent>>text [
	
	^ text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSTextInputEvent>>text: anObject [
	
	text := anObject
]
