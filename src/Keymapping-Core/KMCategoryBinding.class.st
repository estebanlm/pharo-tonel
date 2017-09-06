"
I am the reification of the relation morph<->category, created when a morph gets attached a category of shortcuts.
"
Class {
	#name : #KMCategoryBinding,
	#superclass : #Object,
	#instVars : [
		'target',
		'category',
		'morph'
	],
	#category : #Keymapping-Core,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryBinding class>>target: aTarget morph: aMorph category: aCategory [
	^self new
		target: aTarget;
		category: aCategory;
		morph: aMorph;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryBinding>>category [

	^ category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryBinding>>category: aCategory [
	category := aCategory
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryBinding>>completeMatch: aKeymap buffer: aBuffer [
	KMLog logCompleteMatch: aKeymap.
	KMBuffer uniqueInstance completeMatch.
	aKeymap action cull: target value cull: morph cull: aBuffer first.

]

{
	#category : #binding,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryBinding>>keymapForShortcut: aKey [
	
	^ category keymapForShortcut: aKey
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryBinding>>morph [

	^ morph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryBinding>>morph: aMorph [
	morph := aMorph
]

{
	#category : #iterating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryBinding>>nextForKmChain: aKMDispatchChain [
	^self target
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryBinding>>noMatch [
	"do nothing"
	
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryBinding>>partialMatch [
	"do nothing"
	
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryBinding>>printOn: aStream [

	aStream
		nextPutAll: 'aKMCategoryTarget(';
		nextPutAll: (category name ifNil: 'nil' ifNotNil: [ :n | n printString ]);
		nextPutAll: ')'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryBinding>>target [

	^ target
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryBinding>>target: aTarget [
	target := aTarget
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryBinding>>verifyMatchWith: anEventBuffer notifying: aListener thenDoing: anAction [
	self flag: #fixme. "ugly hack with array of listeners"
	category 
		onMatchWith:  anEventBuffer
		notify: { self . aListener } " first we have to tell the dispatcher "
		andDo: anAction
]
