"
A GLMListPresentation simply shows the given elements within a list.

Instance Variables
	tagsBlock:		<Object>
	tagsFilterBlock:		<Object>

tagsBlock
	- xxxxx

tagsFilterBlock
	- xxxxx

"
Class {
	#name : #GLMListPresentation,
	#superclass : #GLMListingPresentation,
	#traits : 'GLMTBlockTags',
	#classTraits : 'GLMTBlockTags classTrait',
	#instVars : [
		'tagsBlock',
		'tagsFilterBlock'
	],
	#category : #Glamour-Presentations,
	#timestamp : 'AndreiChis 10/3/2014 18:28'
}

{
	#category : #validation,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListPresentation>>defaultValidate: anObject on: aPort [
	"we only allow objects that are in the display value"

	(aPort name == #selection) ifFalse: [ ^ true ].
	self entity isNil ifTrue: [ ^ false ].
	^ self isMultiple
		ifTrue: [ anObject isCollection and: [
				anObject allSatisfy: [:each | self displayValue includes: each ] ]]
		ifFalse: [ self displayValue includes: anObject ]
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListPresentation>>renderGlamorouslyOn: aRenderer  [
	self registerAnnouncements.
	^ aRenderer renderListPresentation: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListPresentation>>tagsBlock [
	^ tagsBlock
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListPresentation>>tagsBlock: anObject [
	tagsBlock := anObject
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListPresentation>>tagsFilter: aBlock [
	tagsFilterBlock := aBlock 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMListPresentation>>tagsFilterBlock [
	^ tagsFilterBlock
]
