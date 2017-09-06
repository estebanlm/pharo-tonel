"
GLMDiffPresentation is meant to show the difference between two input text objects.

The convention is that the transformed entity should provide a collection with two elements.
"
Class {
	#name : #GLMDiffPresentation,
	#superclass : #GLMFormatedPresentation,
	#instVars : [
		'contextClass'
	],
	#category : #Glamour-Presentations,
	#timestamp : 'TudorGirba 7/14/2011 11:49'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDiffPresentation>>contextClass [
	^ contextClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDiffPresentation>>contextClass: aClassOrBlock [
	"the class of method which source is being diffed"

	contextClass := aClassOrBlock
]

{
	#category : #'accessing values',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDiffPresentation>>contextClassValue [
	^ self contextClass glamourValue: self entity
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDiffPresentation>>renderGlamorouslyOn: aRenderer  [
	self registerAnnouncements.
	^ aRenderer renderDiffPresentation: self
]
