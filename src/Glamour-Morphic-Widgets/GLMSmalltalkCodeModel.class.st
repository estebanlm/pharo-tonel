"

"
Class {
	#name : #GLMSmalltalkCodeModel,
	#superclass : #GLMTextModel,
	#instVars : [
		'highlightSmalltalk',
		'highlightSmalltalkContext',
		'variableBindings',
		'bindingsStrategy'
	],
	#category : #Glamour-Morphic-Widgets,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>addVariableBinding: anAssociation [
	self variableBindings at: anAssociation key put: anAssociation value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>bindingOf: aSymbol [
	^ self bindingsStrategy cull: self variableBindings cull: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>bindingsStrategy [

	^ bindingsStrategy ifNil: [ bindingsStrategy := self defaultBindingsStrategy ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>bindingsStrategy: aBlock [

	bindingsStrategy := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>defaultBindingsStrategy [

	^ [ :currentBindings :aSymbol |
		 currentBindings associationAt: aSymbol ifAbsent: [nil] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>doItContext [
	^ self glamourPresentation doItContext 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>doItReceiver [
	^ self glamourPresentation doItReceiver 
]

{
	#category : #completion,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>guessTypeForName: aString  [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>hasBindingOf: aSymbol [
	^ self variableBindings includesKey: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>hasBindingThatBeginsWith: aString [
	^ self variableBindings keys anySatisfy: [:each | each beginsWith: aString]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>highlightSmalltalk [
	^ highlightSmalltalk
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>highlightSmalltalk: anObject [
	highlightSmalltalk := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>highlightSmalltalkContext [
	^ highlightSmalltalkContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>highlightSmalltalkContext: anObject [
	highlightSmalltalkContext := anObject
]

{
	#category : #completion,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>isCodeCompletionAllowed  [
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>selectedClassOrMetaClass [
	^ self highlightSmalltalkContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>shoutAboutToStyle: aPluggableShoutMorph [
	self highlightSmalltalk ifFalse: [^ false].
	self highlightSmalltalkContext notNil ifTrue: [
		aPluggableShoutMorph classOrMetaClass: self highlightSmalltalkContext].
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>variableBindings [
	^ variableBindings ifNil: [variableBindings := Dictionary new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSmalltalkCodeModel>>variableBindings: anObject [
	variableBindings := anObject
]
