"
STONStreamWriter helps in streaming writing STON representations.
This is an abstract class.
"
Class {
	#name : #STONStreamWriter,
	#superclass : #Object,
	#instVars : [
		'writer',
		'first'
	],
	#category : #STON-Core,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:27'
}
STONStreamWriter class>>on: stonWriter [
	^ self new
		on: stonWriter;
		yourself
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:27'
}
STONStreamWriter>>initialize [
	super initialize.
	first := true
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:27'
}
STONStreamWriter>>on: stonWriter [
	writer := stonWriter
]
