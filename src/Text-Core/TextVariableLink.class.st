"
An active link in a text linking to a variable
"
Class {
	#name : #TextVariableLink,
	#superclass : #TextLink,
	#instVars : [
		'variableName'
	],
	#category : #Text-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 12:19'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextVariableLink class>>variableName: aSymbol [
	^ self new
		variableName: aSymbol;
		yourself
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextVariableLink>>= anotherObject [

	^super = anotherObject and: [ variableName = anotherObject variableName ]
]

{
	#category : #evaluating,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextVariableLink>>actOnClick: anEvent for: aNautilusUI in: aParagraph editor: anEditor [
	anEditor referencesTo: self variableName.
	^ true
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextVariableLink>>hash [

	^(super hash + variableName hash) hashMultiply 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextVariableLink>>variableName [
	^ variableName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextVariableLink>>variableName: aString [
	variableName := aString
]
