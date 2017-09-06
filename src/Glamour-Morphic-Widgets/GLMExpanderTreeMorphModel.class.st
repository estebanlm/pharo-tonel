"

"
Class {
	#name : #GLMExpanderTreeMorphModel,
	#superclass : #MorphTreeModel,
	#instVars : [
		'roots',
		'glamourExpander'
	],
	#category : #Glamour-Morphic-Widgets,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExpanderTreeMorphModel>>glamourExpander [
	^ glamourExpander
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExpanderTreeMorphModel>>glamourExpander: anObject [
	glamourExpander := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExpanderTreeMorphModel>>nodeModelFor: anObject [
	^ GLMExpanderLabelNodeModel with: anObject in: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExpanderTreeMorphModel>>roots [
"	| filtered |"
	roots ifNil: [ self roots: self glamourExpander panes ].
	^ roots
"	filtered := roots select: [ :each | each shouldBeDisplayed ].
	((self shouldFilterByAmount and: [
		self amountToFilterBy < filtered size]) and: [
			filtered notEmpty]) ifTrue: [
		filtered := filtered first: self amountToFilterBy ].
	^ filtered"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExpanderTreeMorphModel>>roots: anObjectOrCollection [
	roots := anObjectOrCollection isCollection 
		ifTrue: [ anObjectOrCollection collect: [:each | self nodeModelFor: each ] ]
		ifFalse: [ OrderedCollection with: (self nodeModelFor: anObjectOrCollection) ]
]
