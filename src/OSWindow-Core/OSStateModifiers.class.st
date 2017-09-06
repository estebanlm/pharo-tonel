"
i holding a collection of various key/button modifier flags, usually carried by certain events and accessible through #modifiers message.
"
Class {
	#name : #OSStateModifiers,
	#superclass : #Object,
	#instVars : [
		'leftShift',
		'rightShift',
		'leftAlt',
		'rightAlt',
		'leftCtrl',
		'rightCtrl',
		'leftCmd',
		'rightCmd',
		'capsLock',
		'numLock',
		'buttons'
	],
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:42'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>alt [
	^ leftAlt or: [  rightAlt ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>buttons [
	^ buttons
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>capsLock [
	
	^ capsLock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>capsLock: anObject [
	
	capsLock := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>cmd [
	^ leftCmd or: [  rightCmd ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>ctrl [
	^ leftCtrl or: [  rightCtrl ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>initialize [
	leftAlt := leftCmd := leftCtrl := leftShift := rightAlt := rightCmd := rightCtrl := rightShift :=
	capsLock := numLock := false.
	buttons := OSButtonState new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>leftAlt [
	
	^ leftAlt
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>leftAlt: anObject [
	
	leftAlt := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>leftCmd [
	
	^ leftCmd
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>leftCmd: anObject [
	
	leftCmd := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>leftCtrl [
	
	^ leftCtrl
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>leftCtrl: anObject [
	
	leftCtrl := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>leftShift [
	
	^ leftShift
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>leftShift: anObject [
	
	leftShift := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>numLock [
	
	^ numLock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>numLock: anObject [
	
	numLock := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>printOn: aStream [
	aStream nextPutAll: self class name; space; nextPut: $[.
	leftAlt ifTrue: [ aStream nextPutAll: 'leftAlt'; space ].
	leftCmd ifTrue: [ aStream nextPutAll: 'leftCmd'; space ].
	leftCtrl ifTrue: [ aStream nextPutAll: 'leftCtrl'; space ].
	leftShift ifTrue: [ aStream nextPutAll: 'leftShift'; space ].
	rightAlt ifTrue: [ aStream nextPutAll: 'rightAlt'; space ].
	rightCmd ifTrue: [ aStream nextPutAll: 'rightCmd'; space ].
	rightCtrl ifTrue: [ aStream nextPutAll: 'rightCtrl'; space ].
	rightShift ifTrue: [ aStream nextPutAll: 'rightShift'; space ].
	capsLock ifTrue: [ aStream nextPutAll: 'capsLock'; space ].
	numLock ifTrue: [ aStream nextPutAll: 'numLock'; space ].
	
	aStream nextPut: $]; space; print: buttons
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>rightAlt [
	
	^ rightAlt
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>rightAlt: anObject [
	
	rightAlt := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>rightCmd [
	
	^ rightCmd
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>rightCmd: anObject [
	
	rightCmd := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>rightCtrl [
	
	^ rightCtrl
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>rightCtrl: anObject [
	
	rightCtrl := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>rightShift [
	
	^ rightShift
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>rightShift: anObject [
	
	rightShift := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSStateModifiers>>shift [
	^ leftShift or: [  rightShift ]
]
