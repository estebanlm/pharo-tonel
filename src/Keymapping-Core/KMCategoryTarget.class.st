"
I am the reification of the relation morph<->category, created when a morph gets attached a category of shortcuts.
"
Class {
	#name : #KMCategoryTarget,
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
KMCategoryTarget class>>target: aTarget morph: aMorph category: aCategory [
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
KMCategoryTarget>>category [

	^ category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryTarget>>category: aCategory [
	category := aCategory
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryTarget>>completeMatch: aKeymap buffer: aBuffer [
	KMLog logCompleteMatch: aKeymap.
	KMBuffer uniqueInstance completeMatch.
	aKeymap action cull: target value cull: morph cull: aBuffer first.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryTarget>>morph [

	^ morph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryTarget>>morph: aMorph [
	morph := aMorph
]

{
	#category : #iterating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryTarget>>nextForKmChain: aKMDispatchChain [
	^self target
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryTarget>>noMatch [
	"do nothing"
	
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryTarget>>partialMatch [
	"do nothing"
	
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryTarget>>printOn: aStream [

	aStream
		nextPutAll: 'aKMCategoryTarget(';
		nextPutAll: (category name ifNil: 'nil' ifNotNil: [ :n | n printString ]);
		nextPutAll: ')'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryTarget>>target [

	^ target
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryTarget>>target: aTarget [
	target := aTarget
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCategoryTarget>>verifyMatchWith: anEventBuffer notifying: aListener thenDoing: anAction [
	self flag: #fixme. "ugly hack with array of listeners"
	category 
		onMatchWith:  anEventBuffer
		notify: { self . aListener } " first we have to tell the dispatcher "
		andDo: anAction
]
