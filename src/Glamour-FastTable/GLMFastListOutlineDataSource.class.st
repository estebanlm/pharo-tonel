"
I'm a model datasource to handle glamour fast outline list presentations.

Description 
--------------------

My basics functionnalities works as in my superclass but I do not get my data at my creation. Instead I ask to my Glamour presentation to get them.

I work with a GLMFastListPresentation and a GLMMorphicFastListRenderer. 

Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	announcer:		This is an announcer use to work with Glamour workflow. 
	glamourPresentation:		This is a glamour presentation use to get some informations as the data manage by myself.
	tagsToFilterBy:		This is a list of filtering tags for the dasaSource.


"
Class {
	#name : #GLMFastListOutlineDataSource,
	#superclass : #FTOutlineDataSource,
	#traits : 'TGLMFastTable + TGLMFastTableTag',
	#classTraits : 'TGLMFastTable classTrait + TGLMFastTableTag classTrait',
	#instVars : [
		'announcer',
		'glamourPresentation',
		'tagsToFilterBy',
		'dataCache'
	],
	#category : #Glamour-FastTable-Model,
	#timestamp : 'CyrilFerlicot 11/10/2015 11:59'
}

{
	#category : #announcing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListOutlineDataSource>>announcer [
	^ announcer ifNil: [ announcer := GLMAnnouncer new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListOutlineDataSource>>basicItems [
	^ self glamourPresentation displayValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListOutlineDataSource>>calculateItems [
	^ self basicItems collect: [:coll | coll select: [ :each | self elementShouldBeDisplayed: each ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListOutlineDataSource>>cellColumn: column row: rowIndex  [
	| element cell |
	
	element := self elementAt: rowIndex.
	cell := FTCellMorph new
		cellInset: 5;
		addMorph: (self rowMorphForElement: element);
		yourself.

	(self needSeparatorBefore: rowIndex)
		ifTrue: [ cell withTopSeparator ].

	^ cell
]

{
	#category : #cache,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListOutlineDataSource>>dataCache [
	^ dataCache ifNil: [ dataCache := self class defaultCache ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListOutlineDataSource>>glamourPresentation [
	^ glamourPresentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListOutlineDataSource>>glamourPresentation: aGlamourPresentation [
	glamourPresentation := aGlamourPresentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListOutlineDataSource>>items  [
	^ items ifNil: [ items := self calculateItems ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListOutlineDataSource>>resetChildrenContent [
	items := self calculateItems.
	self resetDataCache
]

{
	#category : #cache,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListOutlineDataSource>>resetDataCache [
	dataCache := nil
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListOutlineDataSource>>rowMorphForElement: element [
	| rowElements |
	rowElements := OrderedCollection new.
	(self iconFor: element) ifNotNil: [ :icon | rowElements add: icon asMorph ].
	rowElements
		add: (self formatedDisplayValueOf: element) asMorph;
		addAll: (self tagMorphsFrom: self glamourPresentation for: element).
	^ Smalltalk ui theme newRowIn: World for: rowElements
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListOutlineDataSource>>tagsToFilterBy [
	^ tagsToFilterBy ifNil: [ tagsToFilterBy := OrderedCollection new ]
]
