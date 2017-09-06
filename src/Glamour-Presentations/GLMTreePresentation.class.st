"
A GLMTreePresentation  shows the given elements within a tree. The #children block is used to compute the children of an elements. It does not guard against infinite recursion.


Instance Variables
	allExpanded:		<Object>
	children:		<Object>
	expandLevel:		<Object>
	rootsExpanded:		<Object>
	tagsBlock:		<Object>
	tagsFilterBlock:		<Object>

allExpanded
	- xxxxx

children
	- xxxxx

expandLevel
	- xxxxx

rootsExpanded
	- xxxxx

tagsBlock
	- xxxxx

tagsFilterBlock
	- xxxxx

"
Class {
	#name : #GLMTreePresentation,
	#superclass : #GLMListingPresentation,
	#traits : 'GLMTBlockTags',
	#classTraits : 'GLMTBlockTags classTrait',
	#instVars : [
		'children',
		'rootsExpanded',
		'allExpanded',
		'expandLevel',
		'tagsBlock',
		'tagsFilterBlock'
	],
	#category : #Glamour-Presentations,
	#timestamp : 'AndreiChis 10/3/2014 18:34'
}

{
	#category : #validation,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>allDisplayedDo: aBlock [
	self displayValue do: [ :eachRoot | 
		self withChildrenOf: eachRoot do: aBlock ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>allExpanded [
	self shouldAllExpand: true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>children  [
	 
	^children
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>children: anObject  [
	 
	children := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>childrenValueOf: anObject [
	^ self children glamourValue: (anObject asGlamorousMultiValue, self entity asGlamorousMultiValue)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>childrenValueOf: anObject atLevel: anInteger [
	^ self children glamourValue: (
		anObject asGlamorousMultiValue, 
		self entity asGlamorousMultiValue,
		anInteger asGlamorousMultiValue,
		self asGlamorousMultiValue)
]

{
	#category : #validation,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>defaultValidate: anObject on: aPort [
	"we only allow objects that are in the display value"
	(aPort name == #selection) ifFalse: [ ^ true ].
	self entity isNil ifTrue: [ ^ false ].
	self allDisplayedDo: [:each | each = anObject ifTrue: [ ^ true ] ].
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>expandLevel [
	^ expandLevel
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>renderGlamorouslyOn: aRenderer	 [
	self registerAnnouncements.
	^ aRenderer renderTreePresentation: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>rootsExpanded [
	self shouldRootsExpand: true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>shouldAllExpand [
	^ allExpanded ifNil: [false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>shouldAllExpand: anObject [
	allExpanded := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>shouldExpandToLevel [
	^ expandLevel isNil not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>shouldExpandToLevel: level [
	^ expandLevel := level
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>shouldRootsExpand [
	^ rootsExpanded ifNil: [false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>shouldRootsExpand: anObject [
	rootsExpanded := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>tagsBlock [
	^ tagsBlock
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>tagsBlock: anObject [
	tagsBlock := anObject
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>tagsFilter: aBlock [
	tagsFilterBlock := aBlock 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>tagsFilterBlock [
	^ tagsFilterBlock
]

{
	#category : #validation,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTreePresentation>>withChildrenOf: anObject do: aBlock [
	aBlock value: anObject.
	(self childrenValueOf: anObject) do: [ :each |
		self withChildrenOf: each do: aBlock ]
]
