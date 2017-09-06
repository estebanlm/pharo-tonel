"
I have a singleton instance which can be accessed by executing the following:
""self default""

I am currently a god object to be refactored =D.
"
Class {
	#name : #KMRepository,
	#superclass : #Object,
	#instVars : [
		'categories',
		'categoryHolders',
		'globalCategories'
	],
	#classVars : [
		'Singleton'
	],
	#category : #Keymapping-Core,
	#timestamp : 'GuillermoPolito 12/14/2010 21:37'
}

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository class>>cleanUp [
	self reset
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository class>>default [
	^ Singleton ifNil: [ Singleton := self new ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository class>>default: aDefault [
	^ Singleton := aDefault
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository class>>reset [
	"Do not reset KMDispatchers instances, it may make the image unusable or force the user to close all the windows."
	
	"TODO: a better reset, allowing the KMDispatcher instances to reload all named, updated, keymaps from the resetted KMRepository."

	World setProperty: #kmDispatcher toValue: nil.
	self default: self new.
	KMCategory allSubclasses
		select: [ :c | c isGlobalCategory ]
		thenDo: [ :c | c new installAsGlobalCategory ].
	KMPragmaKeymapBuilder uniqueInstance reset.
]

{
	#category : #associating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository>>addCategory: aCategory [
	(self includesCategory: aCategory)
		ifTrue: [ self error: 'a Category named ' , aCategory name, ' already exists.' ].
	self categories at: aCategory name put: aCategory.
]

{
	#category : #keymaps,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository>>attach: aCategory to: aClass [
	(self categoryHolders includesKey: aClass) 
		ifFalse: [ self categoryHolders at: aClass put: Set new ].
	
	(self categoryHolders at: aClass) add: aCategory
]

{
	#category : #keymaps,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository>>attachCategoryName: aCategorySymbol to: aClass  [
	self attach: (self ensureCategoryByName: aCategorySymbol) to: aClass.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository>>categories [
	^ categories ifNil: [ categories := Dictionary new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository>>categoryForName: aCategorySymbol [
	^ self categories at: aCategorySymbol ifAbsentPut: [ KMCategory named: aCategorySymbol ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository>>categoryHolders [
	^ categoryHolders ifNil: [ categoryHolders := Dictionary new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository>>ensureCategoryByName: aCategorySymbol [
	| category |
	(self includesCategoryNamed: aCategorySymbol)
		ifFalse: [ 
			category := KMCategory named: aCategorySymbol.
			self addCategory: category ]
		ifTrue: [ category := self categoryForName: aCategorySymbol ].
	^ category
]

{
	#category : #global,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository>>globalCategories [
	^globalCategories ifNil: [ globalCategories := OrderedCollection new ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository>>includesCategory: aCategory [
	^ self categories includes: aCategory
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository>>includesCategoryNamed: aCategorySymbol [
	^ self categories includesKey: aCategorySymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository>>initializeKeymap: shortcutName executingOn: shortcut doing: action inCategory: categoryName platform: aPlatform [
	^self initializeKeymap: shortcutName executingOn: shortcut doing: action inCategory: categoryName platform: aPlatform description: ''
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository>>initializeKeymap: shortcutName executingOn: shortcut doing: action inCategory: categoryName platform: aPlatform description: aDescription [
	| category entry |
	category := self ensureCategoryByName: categoryName.
	(category hasKeymapNamed: shortcutName at: aPlatform) not
		ifTrue: [
			entry := shortcut asKeyCombination named: shortcutName do: action withDescription: aDescription.
			category addKeymapEntry: entry at: aPlatform.
			]
		ifFalse:[
			entry := category keymapNamed: shortcutName at: aPlatform.
			entry shortcutHasChangedBy: shortcut asKeyCombination.
			entry action: action.
			entry description: aDescription
			]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository>>keymapNamed: aKeymapName inCategory: aKeymapCategory [
	^ (self categoryForName: aKeymapCategory) keymapNamed: aKeymapName
]

{
	#category : #global,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMRepository>>setAsGlobalCategory: aGlobalCategory [
	| category |
	category := aGlobalCategory asKmCategoryIn: self.
	(self globalCategories includes: category)
		ifFalse: [ self globalCategories add: category ]
]
