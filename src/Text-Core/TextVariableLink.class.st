"
An active link in a text linking to a variable
"
Class {
	#name : #TextVariableLink,
	#superclass : #TextLink,
	#instVars : [
		'variableName'
	],
	#category : #Text-Core
}

{ #category : #'as yet unclassified' }
TextVariableLink class >> variableName: aSymbol [
	^ self new
		variableName: aSymbol;
		yourself
]

{ #category : #'as yet unclassified' }
TextVariableLink >> = anotherObject [

	^super = anotherObject and: [ variableName = anotherObject variableName ]
]

{ #category : #evaluating }
TextVariableLink >> actOnClick: anEvent for: aNautilusUI in: aParagraph editor: anEditor [
	anEditor referencesTo: self variableName.
	^ true
]

{ #category : #'as yet unclassified' }
TextVariableLink >> hash [

	^(super hash + variableName hash) hashMultiply 
]

{ #category : #accessing }
TextVariableLink >> variableName [
	^ variableName
]

{ #category : #accessing }
TextVariableLink >> variableName: aString [
	variableName := aString
]
