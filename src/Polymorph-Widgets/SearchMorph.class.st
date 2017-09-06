"
I am a searchfield with a dropdown for the history. It is a minor extension to the EditableDropListMorph managing the search history directly in the morph. 

Typical use-case:

	^ SearchMorph new
		model: self;
		setIndexSelector: #classSearchAccept:; ""sends the search result to the model""
		searchList: self class classSearchList; ""sent on creation to get the initial search list""
		yourself
	
	
"
Class {
	#name : #SearchMorph,
	#superclass : #EditableDropListMorph,
	#instVars : [
		'maxSize',
		'currentCompletionIndex',
		'updateSelector',
		'keystrokeSelector'
	],
	#category : #Polymorph-Widgets,
	#timestamp : 'CamilloBruni 8/4/2011 14:39'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>acceptSelector [
	^ self setIndexSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>acceptSelector: aSymbol [
	self setIndexSelector: aSymbol
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>addToList: aString [
	aString isEmpty ifTrue: [ ^ self ].
	list ifNil: [
		list := self searchList].
	list remove: aString ifAbsent: [].
	list size = self maxSize
		ifTrue: [ self searchList removeLast].
	list addFirst: aString.
	self changed: #list.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>content: anObject  [
	content := anObject trimBoth.
	self addToList: content.
	self listSelectionIndex: (self list indexOf: content).
	self updateList
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>contentChanged: aString [
	content := aString.
	self updateSelector ifNotNil: [ :selector|
		self model perform: selector with: aString ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>currentTabCompletion [
	self searchList ifEmpty: [ ^ ''].
	
	currentCompletionIndex > self searchList
		ifTrue: [ currentCompletionIndex := 1].
	
	^ self searchList at: currentCompletionIndex
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>initialize [
	super initialize.
	self convertTo: String.
	list := OrderedCollection new.
	self useSelectionIndex: false.
	self ghostText: 'Hit return to accept' translated
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>keyStroke: event [

	keystrokeSelector ifNotNil: [ 
		(self keystrokeAction: event) ifTrue: [ ^ self ] ].
	
	^ super keyStroke: event
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>keyStroke: event fromMorph: morph [

	keystrokeSelector ifNotNil: [ 
		^ self keystrokeAction: event ].
	
	^ false
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>keystrokeAction: event  [
	| args returnValue |
	keystrokeSelector ifNil: [ ^ nil ].
	args := keystrokeSelector numArgs.
	args = 1 ifTrue: [returnValue := model perform: keystrokeSelector with: event].
	args = 2 
		ifTrue: 
			[returnValue := model 
				perform: keystrokeSelector
				with: event
				with: self].
	returnValue ifNotNil: [
			^ returnValue = true ].
	
	self error: 'keystrokeSelector must be a 1- or 2-keyword symbol'.
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>keystrokeSelector [
	^ keystrokeSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>keystrokeSelector: aSymbol [
	keystrokeSelector := aSymbol.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>listSelectionIndex: anInteger [
	"Set the list selection."

	self hideList.
	anInteger = 0 
		ifTrue: [
			self model ifNotNil: [:m | 
				self setIndexSelector ifNotNil: [:s |
					self useSelectionIndex 
						ifFalse: [m perform: s with: nil]]]]
		ifFalse: [ ^ super listSelectionIndex: anInteger ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>maxSize [
	^ maxSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>maxSize: aNumber [
	maxSize := aNumber
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>newContentMorph [
	|pluggableTextMorph|
	pluggableTextMorph := super newContentMorph.

	pluggableTextMorph 
		autoAccept: false;
		askBeforeDiscardingEdits: false;
		setProperty: #wantsFrameAdornments toValue: false;
		changedAction: [:aString| self contentChanged: aString asString];
		eventHandler: MorphicEventHandler new.
		
	pluggableTextMorph on: #keyStroke send: #keyStroke:fromMorph: to: self.
	^ pluggableTextMorph
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>nextCompletion [
	currentCompletionIndex := (currentCompletionIndex + 1 \\ self searchList size) + 1.
	^ self currentTabCompletion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>searchList [
	^ list ifNil: [ list := OrderedCollection new].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>searchList: aCollection [
	self list: aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>searchString [
	^ content
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>selectionInterval [
	^ contentMorph selectionInterval
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>showList [
	"trigger a list update so that shared search results are updated properly"
	self changed: #list.
	super showList.
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>takeKeyboardFocus [
	contentMorph takeKeyboardFocus.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>updateSelector [
	^ updateSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
SearchMorph>>updateSelector: aSymbol  [
	updateSelector := aSymbol
]
