"
I'm in charge to style  the editor for  a ""haltOnCount:"". Clicking on it resets the counter.
"
Class {
	#name : #HaltOnCountIconStyler,
	#superclass : #HaltIconStyler,
	#category : #Reflectivity-Tools-Breakpoints,
	#timestamp : 'MarcusDenker 6/18/2016 08:12'
}

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
HaltOnCountIconStyler>>iconBlock: aNode [
	^[ aNode removeProperty: #haltCount ifAbsent: []]
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
HaltOnCountIconStyler>>iconLabelBlock: aNode [
	^ [(aNode hasProperty: #haltCount) 
		ifTrue: [(aNode propertyAt: #haltCount) asString, ' ,click to reset']
		ifFalse: ['count: 0' ]]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
HaltOnCountIconStyler>>shouldStyleNode: aNode [
	^aNode isMessage and: [ aNode selector = #haltOnCount:]
]
