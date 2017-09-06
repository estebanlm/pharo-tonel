"
A MorphWrapper is used to wrap a morph with a layout in the goal to be easily added to another morph
"
Class {
	#name : #MorphWrapper,
	#superclass : #Object,
	#instVars : [
		'layout',
		'morph'
	],
	#category : #Spec-Core-Widgets-Support,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphWrapper class>>morph: morph layout: aLayout  [

	^ self new
		layout: aLayout;
		morph: morph;
		yourself
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphWrapper>>addIn: aContainer [
		
	aContainer
		addMorph: morph
		fullFrame: layout
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphWrapper>>frame: rectangle [
	
	layout := rectangle asLayoutFrame
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphWrapper>>fullFrame: anObject [
	
	layout := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphWrapper>>morph: anObject [
	
	morph := anObject
]
