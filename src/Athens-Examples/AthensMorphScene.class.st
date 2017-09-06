"
Allows to render a morph as a scene in athens
"
Class {
	#name : #AthensMorphScene,
	#superclass : #Object,
	#instVars : [
		'morph'
	],
	#category : #Athens-Examples,
	#timestamp : 'TorstenBergmann 2/12/2014 22:01'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensMorphScene>>morph [
	
	^ morph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensMorphScene>>morph: anObject [
	
	morph := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensMorphScene>>renderOn:aCanvas [
	morph fullDrawOnAthensCanvas: aCanvas
]
