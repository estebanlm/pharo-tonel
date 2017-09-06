"
I'm a model datasource to handle glamour fast list presentations.

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
	#name : #GLMFastListDataSource,
	#superclass : #FTSimpleDataSource,
	#traits : 'TGLMFastTable + TGLMFastTableTag',
	#classTraits : 'TGLMFastTable classTrait + TGLMFastTableTag classTrait',
	#instVars : [
		'glamourPresentation',
		'announcer',
		'tagsToFilterBy',
		'dataCache'
	],
	#category : #Glamour-FastTable-Model,
	#timestamp : 'CyrilFerlicot 11/10/2015 11:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListDataSource>>actionColumn: column [
	"If columns has actions associated, execute them"
	column execute.
	self tableRefresh
]

{
	#category : #announcing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListDataSource>>announcer [
	^ announcer ifNil: [ announcer := GLMAnnouncer new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListDataSource>>cellColumn: column row: rowIndex [
	| element cell |
	element := self elementAt: rowIndex.
	cell := FTCellMorph new
		cellInset: 5;
		addMorph: (self rowMorphForElement: element);
		yourself.
	^ cell
]

{
	#category : #cache,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListDataSource>>dataCache [
	^ dataCache ifNil: [ dataCache := self class defaultCache ]
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListDataSource>>dragTransferType [
	^ #Glamour
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListDataSource>>dropElements: aCollection index: rowIndex [
	self glamourPresentation 
		accept: (self collectionToDragPassenger: aCollection)
		droppedOnItem: (self elementOrZeroAt: rowIndex)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListDataSource>>elements [
	^ elements ifNil: [ elements := self calculateElements ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListDataSource>>glamourPresentation [
	^ glamourPresentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListDataSource>>glamourPresentation: anObject [
	glamourPresentation := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListDataSource>>headerColumn: column [
	column id ifNil: [ ^ nil ].
	^ SimpleButtonMorph new
		layoutPolicy: RowLayout new; 
		listDirection: #leftToRight; 
		wrapCentering: #center;
		cellInset: 5@0;
		layoutInset: 5@0;
		label: column id;
		target: self;
		actionSelector: #actionColumn:;
		arguments: {column};
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListDataSource>>resetChildrenContent [
	elements := self calculateElements.
	self resetDataCache
]

{
	#category : #cache,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListDataSource>>resetDataCache [
	dataCache := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListDataSource>>resetElements [
	self resetDataCache.
	elements := nil
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListDataSource>>rowMorphForElement: element [
	| rowElements |
	rowElements := OrderedCollection new.
	(self iconFor: element) ifNotNil: [ :icon | rowElements add: icon asMorph ].
	rowElements
		add: (self formatedDisplayValueOf: element) asMorph asReadOnlyMorph;
		addAll: (self tagMorphsFrom: self glamourPresentation for: element).
	^ Smalltalk ui theme newRowIn: World for: rowElements
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListDataSource>>selectTable: aTable element: anObject  [
	aTable selectRowIndex: (self elements indexOf: anObject)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListDataSource>>tagsToFilterBy [
	^ tagsToFilterBy ifNil: [ tagsToFilterBy := OrderedCollection new ]
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastListDataSource>>wantsDropElements: aCollection type: type index: rowIndex [
	^ (aCollection isEmptyOrNil or: [ type ~= self dragTransferType ])
		ifFalse: [ self glamourPresentation allow: (self collectionToDragPassenger: aCollection) droppedOnItem: (self elementOrZeroAt: rowIndex) ]
		ifTrue: [ false ]
]
