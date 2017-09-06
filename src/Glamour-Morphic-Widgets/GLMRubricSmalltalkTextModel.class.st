"

"
Class {
	#name : #GLMRubricSmalltalkTextModel,
	#superclass : #GLMRubricTextModel,
	#instVars : [
		'highlightSmalltalk',
		'highlightSmalltalkContext',
		'bindingsStrategy',
		'variableBindings'
	],
	#category : #Glamour-Morphic-Widgets,
	#timestamp : ''
}

{
	#category : #bindings,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>appendVariableBinding: anAssociationList [

	anAssociationList ifNotNil: [
		anAssociationList do: [ :anAssociation | 
			self variableBindings add: 
				((anAssociation class = WorkspaceVariable) 
					ifTrue: [ anAssociation ] 
					ifFalse: [ (WorkspaceVariable key: anAssociation key value: anAssociation value) ]) ] ]
]

{
	#category : #bindings,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>bindingOf: aSymbol [

	^ self bindingsStrategy cull: self variableBindings cull: aSymbol cull: self
]

{
	#category : #bindings,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>bindingsStrategy [

	^ bindingsStrategy
]

{
	#category : #bindings,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>bindingsStrategy: aBlock [

	bindingsStrategy := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>doItContext [
	^ self glamourPresentation doItContext 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>doItReceiver [
	^ self glamourPresentation doItReceiver 
]

{
	#category : #bindings,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>guessTypeForName: aString  [
	^ nil
]

{
	#category : #bindings,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>hasBindingOf: aSymbol [

	^ self variableBindings includesKey: aSymbol
]

{
	#category : #bindings,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>hasBindingThatBeginsWith: aString [
	^ self variableBindings keys anySatisfy: [:each | each beginsWith: aString]
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>highlightSmalltalk [
	^ highlightSmalltalk
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>highlightSmalltalk: aBoolean [
	highlightSmalltalk := aBoolean
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>highlightSmalltalkContext [
	^ highlightSmalltalkContext
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>highlightSmalltalkContext: aClassOrMetaclass [
	highlightSmalltalkContext := aClassOrMetaclass
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>isCodeCompletionAllowed  [
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>selectedBehavior [
	
	^ self highlightSmalltalkContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>selectedClassOrMetaClass [
	
	^ self selectedBehavior
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>selectedMethod [

	^ self doItContext ifNil: [ nil ] ifNotNil: [ :aContext | aContext method ]
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>shoutAboutToStyle: aPluggableShoutMorph [
	self highlightSmalltalk ifFalse: [^ false].
	self highlightSmalltalkContext ifNotNil: [ :classOrMetaClass |
 		aPluggableShoutMorph classOrMetaClass: classOrMetaClass  ].
	^ true
]

{
	#category : #bindings,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>variableBindings [
	^ variableBindings ifNil: [variableBindings := Dictionary new]
]

{
	#category : #bindings,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubricSmalltalkTextModel>>variableBindings: aDictionary [
	variableBindings := aDictionary
]
