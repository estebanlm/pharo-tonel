"
I am a refactoring for rename instance variables.

I rename the instance variable in the class definition, in all methods refering to this variable and rename the old accessors.

My precondition verifies that the new variable is valid and not yet used in the whole class hierarchy.
"
Class {
	#name : #RBRenameInstanceVariableRefactoring,
	#superclass : #RBVariableRefactoring,
	#instVars : [
		'newName',
		'browsedEnvironment',
		'renameAccessors'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 21:25'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring class>>model: aRBSmalltalk rename: aVarName to: aName in: aClass  [
	^(self new)
		model: aRBSmalltalk;
		rename: aVarName
			to: aName
			in: aClass;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring class>>model: aRBSmalltalk rename: aVarName to: aName in: aClass renameAccessors: aBoolean [
	^(self new)
		model: aRBSmalltalk;
		rename: aVarName
			to: aName
			in: aClass
			renameAccessors: aBoolean;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring class>>rename: aVarName to: aName in: aClass [
	^self new
		rename: aVarName
		to: aName
		in: aClass
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring class>>rename: aVarName to: aName in: aClass renameAccessors: aBoolean [
	^self new
		rename: aVarName
		to: aName
		in: aClass
		renameAccessors: aBoolean
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring>>addNewAccessors [
	| refactoring |
	refactoring := RBCreateAccessorsForVariableRefactoring
		model: self
		variable: newName asString
		class: class
		classVariable: false.
	refactoring
		createGetterAccessor;
		createSetterAccessor
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring>>browsedEnvironment [
	^ browsedEnvironment ifNil: [ browsedEnvironment := RBBrowserEnvironment new ]
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring>>executeRefactoring: aRefactoring  [
	aRefactoring primitiveExecute.
	RBParser parseExpression: aRefactoring storeString
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring>>initialize [
	super initialize.
	renameAccessors := false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring>>newName [
	^ newName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring>>newName: anObject [
	newName := anObject
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring>>preconditions [
	^(RBCondition isValidInstanceVariableName: newName for: class) 
		& (RBCondition definesInstanceVariable: variableName in: class) 
			& (RBCondition hierarchyOf: class definesVariable: newName) not 
			& (RBCondition isGlobal: newName in: self model) not
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring>>removeOldAccessors [
	| oldAccessors |
	oldAccessors := (class allSelectors
		select: [ :each | each = variableName asSymbol or: [ each = (variableName , ':') asSymbol ] ]
		thenCollect: [ :each | class methodFor: each ]) asOrderedCollection.
	oldAccessors do: [ :each | class removeMethod: each selector ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring>>rename: aVarName to: aName in: aClass [
	self rename: aVarName to: aName in: aClass renameAccessors: false

]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring>>rename: aVarName to: aName in: aClass renameAccessors: aBoolean [
	self variable: aVarName class: aClass.
	newName := aName.
	renameAccessors := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring>>renameAccessors [
	^ renameAccessors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring>>renameAccessors: anObject [
	renameAccessors := anObject
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring>>renameAccessorsReferences [
	| methods senders |
	methods := (class allSelectors select: [ :each | ((class methodFor: each) = nil) not ] thenCollect: [ :each | each ])
		asOrderedCollection.
	senders := (methods
		select: [ :each | (class methodFor: each) source includesSubstring: variableName asString ]
		thenCollect: [ :each | class methodFor: each ]) asOrderedCollection.
	senders
		do: [ :each | each source: (each source copyReplaceAll: variableName asString with: newName asString asTokens: false) ].
	senders
		do: [ :each | 
			(each selector = newName or: [ each selector asString = (newName asString , ':') ])
				ifFalse: [ (model classNamed: class name) compile: each source classified: each protocols ] ]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring>>renameReferences [
	| replacer |
	replacer := RBParseTreeRewriter 
				rename: variableName
				to: newName
				handler: 
					[self 
						refactoringError: ('<1s> is already defined as a method or block temporary <n> variable in this class or one of its subclasses' 
								expandMacrosWith: newName)].
	self 
		convertClasses: class withAllSubclasses
		select: [:aClass | aClass whichSelectorsReferToInstanceVariable: variableName]
		using: replacer
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring>>storeOn: aStream  [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' rename: ''';
		nextPutAll: variableName;
		nextPutAll: ''' to: ''';
		nextPutAll: newName;
		nextPutAll: ''' in: '.
	class storeOn: aStream.
	aStream nextPut: $)
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRenameInstanceVariableRefactoring>>transform [
	renameAccessors ifTrue: [ 
		self removeOldAccessors 
	].
	
	class renameInstanceVariable: variableName to: newName around: [ self renameReferences ].
	
	renameAccessors ifTrue: [ 
		self addNewAccessors.
		self renameAccessorsReferences
	]
]
