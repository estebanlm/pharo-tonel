"
I'm an abstract class that stores the entries to be completed.
"
Class {
	#name : #NECModel,
	#superclass : #Object,
	#instVars : [
		'clazz',
		'selectors',
		'narrowString',
		'entries'
	],
	#category : #NECompletion-Model,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel class>>class: aClass  [
	| newInstance |
	newInstance := self basicNew initialize.
	newInstance setClass: aClass.
	^ newInstance
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>addToEntries: aCollection  [
	| temp caseSensitive |
	caseSensitive := NECPreferences caseSensitive.
	temp := aCollection select: [ :each | 
		each contents 
			occursInWithEmpty: narrowString
			caseSensitive: caseSensitive ].
	entries addAll: temp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>at: aNumber  [
	^ entries at: aNumber 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>commonPrefix [
	"Longest match among the typed text and all menu entries"

	| seed matchLengths prefixLength |
	seed := self entries first contents asString.
	matchLengths := entries allButFirst
		collect: [ :entry | seed charactersExactlyMatching: entry contents asString ]
		thenSelect: [ :e | e >= narrowString size ].
	prefixLength := matchLengths isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ matchLengths min ].
	^ seed first: prefixLength.
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>completionAt: aNumber [
	| entry |
	
	entry := (self at: aNumber) completion separateKeywords.
	^ NECPreferences spaceAfterCompletion 
		ifTrue: [ entry, ' ' ]
		ifFalse: [ entry ]. 
	
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>entries [
	^entries
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>entriesOfType: aSymbol  [
	| collection |
	collection := entries select: [ :each | each type == aSymbol ].
	^ collection collect: [ :each | each contents ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>entryCount [
	^entries size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>hasMessage [
	^ self message notNil
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>initialize [
	self reset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>initializeSelectors  [
	self subclassResponsibility 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>isEmpty [
	^ entries isEmpty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>message [
	^self isEmpty 
		ifTrue: ['no completions found'] 
		ifFalse: [nil]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>narrowString [
	^ narrowString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>narrowString: aString  [
	narrowString := aString
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>narrowWith: aString [
	self subclassResponsibility 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>notEmpty  [
	^self isEmpty not
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>reset [
	self resetSelectors.
	self resetEntries.
	narrowString := String new
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>resetEntries [
	entries := OrderedCollection new
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>resetSelectors [
	selectors := (SortedCollection new: 500) sortBlock: 
		[ :a :b | 
		| scoreA scoreB |
		scoreA := scoreB := 0.
		(a contents 
			beginsWithEmpty: narrowString
			caseSensitive: NECPreferences caseSensitive) ifFalse: [ scoreA := 2 ].
		(b contents 
			beginsWithEmpty: narrowString
			caseSensitive: NECPreferences caseSensitive) ifFalse: [ scoreB := 2 ].
		a contents < b contents
			ifTrue: [ scoreB := scoreB + 1 ]
			ifFalse: [ scoreA := scoreA + 1 ].
		scoreA < scoreB ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>setClass: aClass  [
	clazz := aClass.
	self initializeSelectors.
	self narrowWith: String new
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>theClass [
	^nil
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>title [
	^nil
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECModel>>toggleExpand [
	
]
