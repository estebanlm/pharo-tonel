"
Help to debug 
"
Class {
	#name : #InputEventLog,
	#superclass : #InputEventHandler,
	#instVars : [
		'filterBlock'
	],
	#category : #System-VMEvents,
	#timestamp : 'FranckWarlouzet 6/10/2015 13:24'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventLog>>filter: aBlock [

	filterBlock := aBlock
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventLog>>handleEvent: anEvent [

	(filterBlock isNil or: [ filterBlock value: anEvent ])
		ifTrue: [ anEvent asString logCr ]
]
