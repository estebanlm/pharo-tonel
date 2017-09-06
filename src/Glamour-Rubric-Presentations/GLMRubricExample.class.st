"

"
Class {
	#name : #GLMRubricExample,
	#superclass : #Model,
	#category : #Glamour-Rubric-Presentations-Examples,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricExample>>iconProvider [
	" For 2.0/3.0 compatibility "
	^ (Smalltalk respondsTo: #ui)
		ifTrue: [ (Smalltalk perform: #ui) icons]
		ifFalse: [ UITheme current ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricExample>>loremIpsum [
	^ String loremIpsum: 81233
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricExample>>open [
	self presentation openOn: self loremIpsum 
]
