"
I am a keymap category.  I represent a set of keymaps that can be attached to a morph, so morphs can share my keymaps.
"
Class {
	#name : #KMCategory,
	#superclass : #Object,
	#instVars : [
		'name',
		'platforms'
	],
	#category : #Keymapping-Core,
	#timestamp : 'GuillermoPolito 12/14/2010 21:32'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory class>>named: aCategorySymbol [
	^ (self new)
		name: aCategorySymbol;
		yourself
]

{
	#category : #associating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>addKeymapEntry: aKeymapEntry  [
	self commonEntries add: aKeymapEntry.
]

{
	#category : #associating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>addKeymapEntry: aKeymapEntry at: aPlatform [
	(self entriesAt: aPlatform) add: aKeymapEntry
]

{
	#category : #associating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>allEntries [
	^self commonEntries, self platformEntries
]

{
	#category : #binding,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>asKmCategoryIn: aKmRepository [

	"Maybe we should validate we exist in the repository?"
	^ self
]

{
	#category : #binding,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>bindToObject: anObject andMorph: aMorph [
	
	^ KMCategoryBinding target: anObject morph: aMorph category: self.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>buildKeymapOnMethod: method [

	self addKeymapEntry: (self perform: method selector)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>categoryName [
	^ name
]

{
	#category : #associating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>commonEntries [
	^self entriesAt: #all
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>entriesAt: aPlatform [
	platforms ifNil: [ platforms := Dictionary new ].
	^platforms at: aPlatform ifAbsentPut: [ KMStorage new ].
]

{
	#category : #associating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>hasKeymapNamed: aKeymapEntryName [
	^self allEntries hasKeymapNamed: aKeymapEntryName
]

{
	#category : #associating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>hasKeymapNamed: aKeymapEntryName at: aPlatform [
	^ (self entriesAt: aPlatform) hasKeymapNamed: aKeymapEntryName
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>initialize [

	super initialize.
	self class methods
		select: [ :m | m isShortcutDeclaration ]
		thenDo: [ :m | self buildKeymapOnMethod: m ]
]

{
	#category : #binding,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>installAsGlobalCategory [

	KMRepository default setAsGlobalCategory: self
]

{
	#category : #binding,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>keymapForShortcut: aShortcut [

	^ self allEntries keymapForShortcut: aShortcut
]

{
	#category : #associating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>keymapNamed: aKeymapEntryName [
	^self allEntries keymapNamed: aKeymapEntryName
]

{
	#category : #associating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>keymapNamed: aKeymapEntryName at: aPlatform [
	^(self entriesAt: aPlatform) keymapNamed: aKeymapEntryName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>keymaps [
	^self allEntries keymaps
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>matches: aString [
	^ self keymaps anySatisfy: [ :entry | 
		entry matches: aString ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>matchesCompletely: aString [
	^ self keymaps anySatisfy: [ :entry | 
		entry matchesCompletely: aString ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>name: aCategorySymbol  [
	name := aCategorySymbol 
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>onMatchWith: anEventBuffer notify: aMatchListener andDo: aBlock [
	self keymaps do: [ :entry | 
		entry onMatchWith: anEventBuffer 
			notify: aMatchListener 
			andDo: aBlock ].
]

{
	#category : #associating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>platformEntries [
	^self entriesAt: Smalltalk os platformFamily
]

{
	#category : #associating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategory>>removeKeymapEntry: aKeymapEntry [

	[ self commonEntries remove: aKeymapEntry ] 
	on: Error
	do: [ self platformEntries remove: aKeymapEntry ]
]
