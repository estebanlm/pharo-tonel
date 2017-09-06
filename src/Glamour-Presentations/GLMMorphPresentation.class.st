"
This presentation offers a means to embed a Morph. It makes sense only for the Morph Renderer.
"
Class {
	#name : #GLMMorphPresentation,
	#superclass : #GLMPresentation,
	#instVars : [
		'morphBuilder'
	],
	#category : #Glamour-Presentations,
	#timestamp : 'TudorGirba 2/4/2011 21:13'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMMorphPresentation>>initialize [
	super initialize.
	morphBuilder := [ :thisPresentation :theDisplayValue | theDisplayValue asMorph ]
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMMorphPresentation>>morph [
	^ morphBuilder glamourValue: 
			(self asGlamorousMultiValue, 
			self displayValue asGlamorousMultiValue)
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMMorphPresentation>>morph: aBlock [
	morphBuilder := aBlock
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMMorphPresentation>>renderGlamorouslyOn: aRenderer  [
	self registerAnnouncements.
	^ aRenderer renderMorphPresentation: self
]
