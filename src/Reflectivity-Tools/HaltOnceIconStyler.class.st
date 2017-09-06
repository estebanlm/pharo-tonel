"
I'm in charge to style  the editor for  a ""haltOnce"". Clicking on it re-enables the haltOnce.
"
Class {
	#name : #HaltOnceIconStyler,
	#superclass : #HaltIconStyler,
	#category : #Reflectivity-Tools-Breakpoints,
	#timestamp : 'MarcusDenker 6/18/2016 08:12'
}

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
HaltOnceIconStyler>>iconBlock: aNode [
	^[	aNode removeProperty: #Once ifAbsent: [aNode propertyAt: #Once put: true ]]
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
HaltOnceIconStyler>>iconLabelBlock: aNode [
	^ [(aNode hasProperty: #Once) 
		ifTrue: ['inactive, click to turn on']
		ifFalse: ['active, click to turn off' ]]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
HaltOnceIconStyler>>shouldStyleNode: aNode [
	^aNode isMessage and: [ aNode selector = #haltOnce]
]
