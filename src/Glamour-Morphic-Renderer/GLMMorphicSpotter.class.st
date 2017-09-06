"

"
Class {
	#name : #GLMMorphicSpotter,
	#superclass : #DialogWindow,
	#instVars : [
		'textMorph',
		'text',
		'answer',
		'childrenMorphs'
	],
	#category : #Glamour-Morphic-Renderer-Spotter,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter class>>on: aRequest [
	^ self basicNew initializeOn: aRequest
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter class>>openOn: aRequest [
	^ UITheme builder openModal: (self on: aRequest)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter>>answer [
	^ answer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter>>answer: anObject [
	answer := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter>>childrenMorphs [
	^ childrenMorphs
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter>>childrenMorphs: anObject [
	childrenMorphs := anObject
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter>>editorKeyStroke: anEvent [
"	anEvent keyCharacter = Character arrowDown ifTrue: [
		self listIndex: (self listIndex + 1 min: listValues size).
		^ true ].
	anEvent keyCharacter = Character arrowUp ifTrue: [
		self listIndex: (self listIndex - 1 max: 1). 
		^ true ]."
	^ false
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter>>initialize  [
	childrenMorphs := OrderedCollection new.
	super initialize
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter>>initializeOn: aRequest [
	model := aRequest.
	self initialize.
	self title: aRequest prompt.
	self text: aRequest default

]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter>>newContentMorph [
	^ (self newColumn: 
			((OrderedCollection with: self newTextMorph) addAll: self newListMorphs; yourself) )
		minWidth: 320;
		minHeight: 200;
		yourself
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter>>newListMorphs [
	| list |
	self model requests do: [:each | 
		list := (GLMMorphicSingleSpotter on: each parent: self).
		self childrenMorphs add: list ].
	^ childrenMorphs collect: #newListMorph
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter>>newTextMorph [
	textMorph := self
		newTextEntryFor: self
		getText: #text
		setText: #text:
		help: nil.
	textMorph
		autoAccept: true;
		selectAll.
	textMorph textMorph
		on: #keyStroke send: #editorKeyStroke: to: self.
	^ textMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter>>ok [
	| nonEmpty |
	nonEmpty := self childrenMorphs reject: [ :e | e listIndex isZero ].
	nonEmpty size = 1
		ifTrue: [ answer := nonEmpty first listSelection ].
	^ super ok
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter>>selectionIn: singleSpotlight [

	(self childrenMorphs reject: [:e| e = singleSpotlight] ) do: [:e| 
			e deselect.
		]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter>>text [
	^ text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter>>text: aString [
	text = aString
		ifTrue: [ ^ self ].
	text := aString.
	self childrenMorphs do: [:each | each text: aString ].
	self changed: #text; changed: #isEnabled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter>>textMorph [
	^ textMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSpotter>>textMorph: anObject [
	textMorph := anObject
]
