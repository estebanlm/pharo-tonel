"
I'am a komit object representing a change in a class definition. 
I wrap MCModification instances.

Notes from a maintainer: It may be interesting to see if my behavior cannot be simply merged into the MC hierarchy instead of somehow duplicating. 
"
Class {
	#name : #KomitDefinition,
	#superclass : #KomitObject,
	#instVars : [
		'definition',
		'operation'
	],
	#classInstVars : [
		'definitions'
	],
	#category : #Komitter-Models,
	#timestamp : 'StephaneDucasse 11/24/2015 18:57'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitDefinition class>>definition: definition [

	^ self new
		definition: definition;
		yourself
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitDefinition class>>initialize [

	definitions := Dictionary new
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitDefinition>><= aKomitObject  [

	^ self definition <= aKomitObject definition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitDefinition>>definition [
	^ definition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitDefinition>>definition: anObject [
	
	definition := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitDefinition>>isCommitable [

	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitDefinition>>isDefinition [

	^ true
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitDefinition>>koDestinationText [
	
	^ self operation koDestinationText
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitDefinition>>koSourceText [

	^ self operation koSourceText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitDefinition>>operation [
	^ operation
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitDefinition>>operation: anOperation [
 
	operation := anOperation
]
