"
An active link in a text linking to a class
"
Class {
	#name : #TextClassLink,
	#superclass : #TextLink,
	#instVars : [
		'className'
	],
	#category : #Text-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 12:18'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextClassLink class>>class: aClass [
	^ self className: aClass name
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextClassLink class>>className: aSymbol [
	^ self new
		className: aSymbol;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextClassLink>>= anotherObject [

	^super = anotherObject and: [ className = anotherObject className ]
]

{
	#category : #evaluating,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextClassLink>>actOnClick: anEvent for: target in: aParagraph editor: anEditor [
	anEvent shiftPressed
		ifFalse: [ anEditor browseClassFrom: self className ]
		ifTrue: [ anEditor referencesTo: self className ].
	^ true
]

{
	#category : #'system primitives',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextClassLink>>className	 [
	^ className
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextClassLink>>className: aStringOrSymbol [
	className := aStringOrSymbol asSymbol
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextClassLink>>hash [

	^(super hash + className hash) hashMultiply 
]
