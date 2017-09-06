"
I'm the representation from a suggestion that can be executed.
I have some information related to the suggestion.
"
Class {
	#name : #SugsSuggestion,
	#superclass : #Object,
	#instVars : [
		'blockCommand',
		'context',
		'label',
		'icon',
		'position',
		'keyText',
		'isValidBlock'
	],
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion class>>for: blockCommand named: label icon: icon  [
	^ self new 
		blockCommand: blockCommand;
		label: label;
		icon: icon;
		yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion class>>for: blockCommand named: label icon: icon position: position [
	^ (self for: blockCommand named: label icon: icon)
	 	  position: position;
		  yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion class>>for: blockCommand named: label icon: icon position: position isValidBlock: validBlock [
	^ (self for: blockCommand named: label icon: icon position: position)
   		  isValidBlock: validBlock;
		  yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion class>>for: blockCommand named: label icon: icon position: position keyText: key [
	^ (self for: blockCommand named: label icon: icon position: position)
		  keyText: key;
		  yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion class>>for: blockCommand named: label icon: icon position: position keyText: key  isValidBlock: validBlock [
	^ (self for: blockCommand named: label icon: icon position: position)
		  keyText: key;
		 isValidBlock: validBlock;
		  yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion class>>icon: icon position: position [
	^ self new
	 	icon: icon;	 
		position: position;
		yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion class>>icon: icon position: position keyText: key [
	^ self new
	 	icon: icon;	 
		position: position;
		keyText: key;
		yourself.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion>>= otherSuggestion [
	otherSuggestion class = self class ifFalse: [  ^false ].
	^  self label = otherSuggestion label.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion>>blockCommand: aBlock  [
	blockCommand := aBlock.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion>>context: theContext  [
	context := theContext .
	
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion>>execute [
	blockCommand value: context.
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion>>icon [
	^icon.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion>>icon: anIcon [
	icon := anIcon 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion>>iconName: aSymbol [
	self icon: (self iconNamed: aSymbol)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion>>isValidBlock: aBlock  [
	isValidBlock := aBlock.
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion>>isValidForContext [
	^ isValidBlock ifNil:[true] ifNotNil:[isValidBlock value: context].
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion>>keyText [
	^ keyText
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion>>keyText: key [
	keyText := key.
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion>>label [
	^label
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion>>label: aLabel [
	label := aLabel.
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion>>position [
	^ position ifNil:[10000] ifNotNil: [ position ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion>>position: aPosition [
	position := aPosition .
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSuggestion>>printOn: aStream [
	aStream
		nextPutAll: 'aSugsSuggestion (';
		nextPutAll: self label;
		nextPutAll: ')'.
]
