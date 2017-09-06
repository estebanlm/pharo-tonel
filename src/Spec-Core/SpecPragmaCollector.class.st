"
A SpecPragmaCollector is a specialized PragmaCollector.

Sonce we just want specs defined on class side, we do not have to check the whole system, then to restrain.
"
Class {
	#name : #SpecPragmaCollector,
	#superclass : #PragmaCollector,
	#instVars : [
		'behavior'
	],
	#classInstVars : [
		'behavior'
	],
	#category : #Spec-Core-Support,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPragmaCollector class>>behavior: aBehavior [

	^ self new
		behavior: aBehavior;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPragmaCollector>>allPragmas [

	^ self allPragmasIn: (self behavior ifNil: [ ^ #() ])
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPragmaCollector>>allPragmasIn: aClass [

	^ (Array
		streamContents: [:stream | Pragma
									withPragmasIn: aClass
									do: [:pragma | stream nextPut: pragma ]]) 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPragmaCollector>>behavior [
	^ behavior
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPragmaCollector>>behavior: anObject [
	behavior := anObject
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPragmaCollector>>installSystemNotifications [
	"We do not need to register anything for spec, and if we do it will make it really slow"
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPragmaCollector>>reset [
	"reinitialize current system settings"
	self
		noMoreAnnounceWhile: [self collected copy
				do: [:pragma | self removePragma: pragma].
			self allPragmas
				do: [:pragma | self addPragma: pragma]].
	self announce: (PragmaCollectorReset collector: self)
]
