"
I am a wrapper for the layout of widget.

Each framework can then adapt me as it wants in its adapters
"
Class {
	#name : #SpecLayoutFrame,
	#superclass : #Object,
	#instVars : [
		'bottomFraction',
		'bottomOffset',
		'layout',
		'leftFraction',
		'leftOffset',
		'rightFraction',
		'rightOffset',
		'topFraction',
		'topOffset'
	],
	#category : #Spec-Core-Support,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>bottomFraction [
	
	^ bottomFraction
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>bottomFraction: anObject [
	
	bottomFraction := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>bottomOffset [
	
	^ bottomOffset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>bottomOffset: anObject [
	
	bottomOffset := anObject
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>initialize [

	super initialize.

	bottomFraction := 1.
	bottomOffset := 0.
	leftFraction := 0.
	leftOffset := 0.
	rightFraction := 1.
	rightOffset := 0.
	topFraction := 0.
	topOffset := 0.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>leftFraction [
	
	^ leftFraction
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>leftFraction: anObject [
	
	leftFraction := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>leftOffset [
	
	^ leftOffset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>leftOffset: anObject [
	
	leftOffset := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>rightFraction [
	
	^ rightFraction
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>rightFraction: anObject [
	
	rightFraction := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>rightOffset [
	
	^ rightOffset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>rightOffset: anObject [
	
	rightOffset := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>topFraction [
	
	^ topFraction
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>topFraction: anObject [
	
	topFraction := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>topOffset [
	
	^ topOffset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutFrame>>topOffset: anObject [
	
	topOffset := anObject
]
