"
I represent a sequence of key combinations.

In order to have a match between me and a user's key presses, all user events must match all of my inner shortcuts in the same exact order.

To create a sequence of key combinations use the #, message. Like for example:

$a command , $b shift
"
Class {
	#name : #KMKeyCombinationSequence,
	#superclass : #KMKeyCombination,
	#instVars : [
		'shortcuts'
	],
	#category : #Keymapping-KeyCombinations,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationSequence class>>first: aShortcut next: anotherShortcut [
	^ (self new)
		first: aShortcut;
		next: anotherShortcut;
		yourself
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationSequence>>+ aCharacter  [
	| last |
	last := self sequence last.
	self sequence removeLast.
	self addShortcut: last + aCharacter.
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationSequence>>, aShortcut [
	self addShortcut: aShortcut asKeyCombination.
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationSequence>>= aShortcut [
	^ super = aShortcut and: [ shortcuts = aShortcut sequence ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationSequence>>addShortcut: aShortcut [
	self sequence add: aShortcut
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationSequence>>beginsWith: aShortcut  [
	
	^ self sequence first = aShortcut 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationSequence>>first: aShortcut [
	self addShortcut: aShortcut
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationSequence>>hash [
	^ shortcuts hash
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationSequence>>matches: anEventBuffer [
	|maxIndex|
	maxIndex := anEventBuffer size min: shortcuts size.
	1 to: maxIndex do: [:index|
		((shortcuts at: index) = (anEventBuffer at: index) asKeyCombination)
			ifFalse: [ ^ false]].
	^ true.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationSequence>>next: aShortcut [
	self addShortcut: aShortcut
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationSequence>>prettyPrintOn: aStream [

	shortcuts 
		do: [ :e | e prettyPrintOn: aStream ]
		separatedBy: [ aStream << ' + ' ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationSequence>>printOn: aStream [
	shortcuts 
		do: [ :shortcut| shortcut printOn: aStream]
		separatedBy: [ aStream nextPutAll: ' , '].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationSequence>>sequence [
	^ shortcuts ifNil: [ shortcuts := OrderedCollection new ]
]
