"

"
Class {
	#name : #GLMTestPane,
	#superclass : #GLMPane,
	#instVars : [
		'seenTransmissions'
	],
	#category : #Glamour-Tests-Core,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTestPane class>>new [

	^super new initialize
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTestPane class>>portClass  [
	 
	^GLMTestPort
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTestPane>>browser [
	browser isNil ifTrue: [ ^ GLMNoBrowser new ].
	^ browser
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTestPane>>browser: aBrowser  [
	browser := aBrowser
]
