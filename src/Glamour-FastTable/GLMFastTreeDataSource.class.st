"
I'm a model datasource to handle glamour fast tree presentations.

Description 
--------------------

My basics functionnalities works as in my superclass but I do not get my data at my creation. Instead I ask to my Glamour presentation to get them.

I work with a GLMFastTreePresentation and a GLMMorphicFastTreeRenderer. 

Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	announcer:		This is an announcer use to work with Glamour workflow. 
	glamourPresentation:		This is a glamour presentation use to get some informations as the data manage by myself.
	tagsToFilterBy:		This is a list of filtering tags for the dasaSource.


"
Class {
	#name : #GLMFastTreeDataSource,
	#superclass : #FTTreeDataSource,
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
GLMFastTreeDataSource>>announcer [
	^ announcer ifNil: [ announcer := GLMAnnouncer new ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>basicRoots [
	^ self glamourPresentation displayValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>buttonFor: item [
	^ ( (self canDisplayChildrenOf: item) and: [self hasChildren: item])
		ifTrue: [ item generateButton ]
		ifFalse: [ self class emptyMorph ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>cellColumn: aColumnIndex row: aRowIndex [
	| item cell |
	item := self elementAt: aRowIndex.
	cell := FTCellMorph new
		cellInset: 5;
		addMorph: (self rowMorphForItem: item);
		yourself.
	^ cell
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>createRootItem [
	| fullRoot |
	fullRoot := FTRootItem data: self basicRoots from: self.
	^ self tagsToFilterBy
		ifEmpty: [ fullRoot ]
		ifNotEmpty:
			[ | children |
			children := OrderedCollection new.
			fullRoot children
				do: [ :item | (self matchingTag: item) ifNotNil: [ :itemNew | children add: itemNew ] ]
				displayingProgress: [ :each | 'Looking inside ' , each printString ].
			FTRootItem new
				dataSource: self;
				children: children asArray;
				yourself ]
]

{
	#category : #cache,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>dataCache [
	^ dataCache ifNil: [ dataCache := self class defaultCache ]
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>explicitSelection: anObject [
	self table selectRowIndexes: (self searchText: anObject asString)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>glamourPresentation [
	^ glamourPresentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>glamourPresentation: aGLMFastTreePresentation [
	glamourPresentation := aGLMFastTreePresentation
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>hasChildren: anItem [
	^ self glamourPresentation hasChildrenBlock 
		ifNil: [ anItem children isNotEmpty ]
		ifNotNil: [ :aBlock | aBlock cull: anItem data ]
]

{
	#category : #tag,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>matchingTag: anItem [
	| elementTags |
	elementTags := self glamourPresentation tagsFor: anItem data to: #filter.
	((anItem children collect: [ :it | self matchingTag: it ]) reject: #isNil)
		ifNotEmpty: [ :coll | 
			^ (self newStaticItemFrom: anItem)
				children: coll asArray;
				yourself ].
	^ (self tagsToFilterBy allSatisfy: [ :each | elementTags includes: each ])
		ifFalse: [ nil ]
		ifTrue: [ self newStaticItemFrom: anItem ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>newStaticItemFrom: anItem [
	^ FTStaticBasicItem new
		data: anItem data;
		depth: anItem depth;
		children: #();
		dataSource: self;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>resetChildrenContent [
	self rootItem: self createRootItem.
	self resetDataCache
]

{
	#category : #cache,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>resetDataCache [
	dataCache := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>resetElements [
	self resetDataCache.
	self updateData
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>rootItem [
	^ rootItem ifNil: [ rootItem := self createRootItem ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>rowMorphForItem: anItem [
	| rowElements |
	rowElements := OrderedCollection new.
	anItem depth timesRepeat: [ rowElements add: self class emptyMorph ].
	rowElements add: (self buttonFor: anItem).
	(self iconFor: anItem data) ifNotNil: [ :icon | rowElements add: icon asMorph ].
	rowElements
		add: (self formatedDisplayValueOf: anItem data) asMorph asReadOnlyMorph;
		addAll: (self tagMorphsFrom: self glamourPresentation for: anItem data).
	^ Smalltalk ui theme newRowIn: World for: rowElements
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>selection: ann [
	| selection |
	selection := ann newSelectedRowIndexes
		select: [ :each | each ~= 0 ]
		thenCollect: [ :each | (self elementAt: each) data ].
	selection
		ifNotEmpty: [ 
			self announcer
				announce:
					(GLMTreeMorphSelectionChanged new
						selectionValue:
								((selection size = 1 and: [ self glamourPresentation isSingle ])
										ifTrue: [ selection first ]
										ifFalse: [ selection ]);
						selectionPathValue: selection;
						yourself) ]
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>strongSelection: ann [
	self announcer
		announce:
			(GLMTreeMorphStrongSelectionChanged new
				strongSelectionValue: (self elementAt: ann selectedRowIndex) data;
				yourself)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeDataSource>>tagsToFilterBy [
	^ tagsToFilterBy ifNil: [ tagsToFilterBy := OrderedCollection new ]
]
