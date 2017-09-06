"
I am a Trait that manage some Glamour Model related functionalities. 

Description 
--------------------

I contains some functionnalities used by all the Glamour related data sources like the annoucements. Since a dataSource can be a list, or a outline list, or a tree … They cannot inherit from the same class. I am here to avoid a duplication of code.
"
Trait {
	#name : #TGLMFastTable,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Glamour-FastTable-Model,
	#timestamp : 'CyrilFerlicot 11/10/2015 11:45'
}

{
	#category : #'accessing - cache',
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable classSide>>defaultCache [
	^ LRUCache new maximumWeight: 128
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>allMenuActions [
	^ self glamourPresentation allSelectionActions select: #hasTitle
]

{
	#category : #announcing,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>announcer [
	self explicitRequirement
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>basicElements [
	^ self glamourPresentation displayValue
]

{
	#category : #'accessing - cache',
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>cacheAt: aKey for: anElement ifAbsentPut: aBlock [
	| elementCache |
	
	self shouldUseCache ifFalse: [ 
		^ aBlock value ].
	
	elementCache := self dataCacheFor: anElement.
	(elementCache includesKey: aKey) 
		ifTrue: [ ^ elementCache at: aKey ].
		
	^ aBlock value 
		ifNotNil: [ :anObject | elementCache at: aKey ifAbsentPut: [ anObject ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>calculateElements [
	^ self tagsToFilterBy 
		ifEmpty: [ self basicElements ]
		ifNotEmpty: [ self basicElements select: [ :each | self elementShouldBeDisplayed: each ]. ]

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>collectionToDragPassenger: aCollection [
	^ aCollection size = 1
		ifTrue: [ aCollection anyOne ] 
		ifFalse: [ aCollection ]
]

{
	#category : #cache,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>dataCache [
	self explicitRequirement
]

{
	#category : #cache,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>dataCacheFor: anElement. [

	^ self dataCache at: anElement ifAbsentPut: [ Dictionary new ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>elementOrZeroAt: rowIndex [
	^ rowIndex = 0 
		ifTrue: [ 0 ] 
		ifFalse: [ self elementAt: rowIndex ] 
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>elementShouldBeDisplayed: anObject [
	| elementTags |
	self tagsToFilterBy ifEmpty: [ ^ true ].
	elementTags := self glamourPresentation tagsFor: anObject to: #filter.
	^ self tagsToFilterBy allSatisfy: [ :each | elementTags includes: each ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>executeMenuAction: anAction [
	self announcer announce: (GLMMenuItemSelected action: anAction)
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>explicitSelection: anObject  [
	self table selectRowIndex: (self elements indexOf: anObject)
]

{
	#category : #'accessing - cache',
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>formatedDisplayValueOf: anElement [
	^ self 
		cacheAt: #formatedDisplayValue 
		for: anElement 
		ifAbsentPut: [ self glamourPresentation formatedDisplayValueOf: anElement ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>glamourPresentation [
	self explicitRequirement
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>glamourPresentation: anObject [
	self explicitRequirement
]

{
	#category : #'accessing - cache',
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>iconFor: anElement [
	^ self 
		cacheAt: #icon 
		for: anElement 
		ifAbsentPut: [ self glamourPresentation icon cull: anElement ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>menuColumn: column row: rowIndex [
	| menu subMenus targetMenuMorph subMenu |
	
	menu := UIManager default newMenuIn: self table for: self.
	subMenus := Dictionary new.
	self allMenuActions do: [ :action |
		targetMenuMorph := action category notNil 
			ifTrue: [ subMenus at: action category ifAbsentPut: [ 
					subMenu :=  MenuMorph new.
					menu add: action category subMenu: subMenu.
					subMenu ] ]
			ifFalse: [ menu ].
		(targetMenuMorph 
			add: action title
			target: self
			selector: #executeMenuAction:
			argument: action)
			icon:  action icon;
			enabled: (action isEnabledOn: self glamourPresentation);
			keyText: (action hasShortcut 
				ifTrue: [ action shortcutAsString ]
				ifFalse: [ nil ]) ].
	^ menu
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>newDataSourceMatching: aFTFilter [
	^ (super newDataSourceMatching: aFTFilter)
		glamourPresentation: self glamourPresentation;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>readyToBeDisplayed [
	self glamourPresentation announcer announce: (GLMDataSourceUpdated newDataSource: self).
]

{
	#category : #cache,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>resetDataCache [
	self explicitRequirement
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>selection: ann [
	| selection |
	selection := ann newSelectedRowIndexes select: [ :each | each ~= 0 ] thenCollect: [ :each | self elementAt: each ].
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
	#category : #'accessing - cache',
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>shouldUseCache [
	^ self glamourPresentation shouldUseCache
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>strongSelection: ann [
	self announcer announce: (GLMTreeMorphStrongSelectionChanged new 
		strongSelectionValue: (self elementAt: ann selectedRowIndex);
		yourself)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>toString: anObject [
	^ self glamourPresentation hasFilterBlock
		ifTrue: [ anObject ]
		ifFalse: [ super toString: anObject ]
]

{
	#category : #announcing,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>when: anAnnouncementClass do: aBlock [
	self announcer when: anAnnouncementClass do: aBlock
]

{
	#category : #announcing,
	#timestamp : ' 8/31/2017 05:26:35'
}
TGLMFastTable>>when: anAnnouncementClass send: selector to: target [
	self announcer 
		when: anAnnouncementClass 
		send: selector 
		to: target
]
