"
I am a special because I announce changes only if the new value set is different from the current value.
"
Class {
	#name : #IdentityNewValueHolder,
	#superclass : #NewValueHolder,
	#category : #NewValueHolder,
	#timestamp : 'BenjaminVanRyseghem 1/23/2014 15:19'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
IdentityNewValueHolder>>value: anObject [

	self value == anObject ifTrue: [ ^ anObject ].
	super value: anObject
]
