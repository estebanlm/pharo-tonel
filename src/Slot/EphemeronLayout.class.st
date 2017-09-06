"
A layout for ephemeron objects
"
Class {
	#name : #EphemeronLayout,
	#superclass : #PointerLayout,
	#category : #Slot-Layout,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:35'
}
EphemeronLayout class>>extending: superLayout scope: aScope host: aClass  [
	
	^ (superLayout extendEphemeron: aScope)
		host: aClass;
		yourself
]

{
	#category : #format,
	#timestamp : ' 8/31/2017 07:16:35'
}
EphemeronLayout>>instanceSpecification [
	^ 5
]
