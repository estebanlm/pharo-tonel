"
I am a refactoring for creating accessors for variables.

I am used by a couple of other refactorings  creating new variables and accessors.

My procondition is that the variable name is defined for this class.
"
Class {
	#name : #RBCreateAccessorsForVariableRefactoring,
	#superclass : #RBVariableRefactoring,
	#instVars : [
		'getterMethod',
		'setterMethod',
		'classVariable',
		'needsReturn'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 21:00'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring class>>model: aRBSmalltalk variable: aVarName class: aClass classVariable: aBoolean  [
	^(self 
		model: aRBSmalltalk
		variable: aVarName
		class: aClass)
		classVariable: aBoolean;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring class>>variable: aVarName class: aClass classVariable: aBoolean  [
	^(self variable: aVarName class: aClass)
		classVariable: aBoolean; yourself
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>classVariable: aBoolean  [
	classVariable := aBoolean
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>createGetterAccessor [
	getterMethod := self findGetterMethod.
	getterMethod isNil ifTrue: [getterMethod := self defineGetterMethod]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>createSetterAccessor [
	setterMethod := self findSetterMethod.
	setterMethod isNil ifTrue: [setterMethod := self defineSetterMethod]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>defineGetterMethod [
	| selector definingClass |
	definingClass := self definingClass.
	selector := self safeMethodNameFor: definingClass
				basedOn: variableName asString.
	definingClass 
		compile: ('<1s><r><t>^ <2s>' expandMacrosWith: selector with: variableName)
		classified: #(#accessing).
	^selector
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>defineSetterMethod [
	| selector definingClass string |
	definingClass := self definingClass.
	string := self needsReturnForSetter 
				ifTrue: ['<1s> anObject<r><t>^ <2s> := anObject']
				ifFalse: ['<1s> anObject<r><t><2s> := anObject'].
	selector := self safeMethodNameFor: definingClass
				basedOn: variableName asString , ':'.
	definingClass 
		compile: (string expandMacrosWith: selector with: variableName)
		classified: #accessing.
	^selector
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>definingClass [
	^ classVariable 
		ifTrue: [ class theMetaClass ]
		ifFalse: [ class ]
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>findGetterMethod [
	| definingClass matcher |
	definingClass := self definingClass.
	matcher := RBParseTreeSearcher getterMethod: variableName.
	^self possibleGetterSelectors detect: 
			[:each | 
			(self 
				checkClass: definingClass
				selector: each
				using: matcher) notNil 
				and: [(definingClass subclassRedefines: each) not]]
		ifNone: [nil]
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>findSetterMethod [
	| definingClass matcher |
	definingClass := self definingClass.
	matcher := self needsReturnForSetter 
				ifTrue: [RBParseTreeSearcher returnSetterMethod: variableName]
				ifFalse: [RBParseTreeSearcher setterMethod: variableName].
	^self possibleSetterSelectors detect: 
			[:each | 
			(self 
				checkClass: definingClass
				selector: each
				using: matcher) notNil 
				and: [(definingClass subclassRedefines: each) not]]
		ifNone: [nil]
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>getterMethod [
	^getterMethod
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>methodsReferencingVariable [
	^classVariable 
		ifTrue: [self definingClass whichSelectorsReferToClassVariable: variableName]
		ifFalse: 
			[self definingClass whichSelectorsReferToInstanceVariable: variableName]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>needsReturnForSetter [
	needsReturn isNil 
		ifTrue: 
			[needsReturn := self 
						usesAssignmentOf: variableName
						in: class
						classVariable: classVariable].
	^needsReturn
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>possibleGetterSelectors [
	^self methodsReferencingVariable select: [:each | each numArgs == 0]
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>possibleSetterSelectors [
	^self methodsReferencingVariable select: [:each | each numArgs == 1]
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>preconditions [
	^classVariable 
		ifTrue: [RBCondition definesClassVariable: variableName asSymbol in: class]
		ifFalse: [RBCondition definesInstanceVariable: variableName in: class]
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>setterMethod [
	^setterMethod
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>storeOn: aStream  [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream nextPutAll: ' variable: '.
	variableName storeOn: aStream.
	aStream nextPutAll: ' class: '.
	class storeOn: aStream.
	aStream nextPutAll: ' classVariable: '.
	classVariable storeOn: aStream.
	aStream nextPut: $)
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>transform [
	self
		createGetterAccessor;
		createSetterAccessor
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBCreateAccessorsForVariableRefactoring>>usesAssignmentOf: aString in: aClass classVariable: isClassVar  [
	| matcher definingClass |
	matcher := RBParseTreeSearcher new.
	matcher
		answer: false;
		matches: aString , ' := ``@object'
			do: [ :aNode :answer | answer or: [ aNode isUsed and: [ aNode methodNode selector ~= aString] ] ].
	definingClass := isClassVar 
		ifTrue: [ aClass theNonMetaClass ]
		ifFalse: [ aClass ].
	^ (definingClass withAllSubclasses , (isClassVar 
			ifTrue: [ definingClass theMetaClass withAllSubclasses ]
			ifFalse: 
				[ #() ]) 
		detect: 
			[ :each | 
			((isClassVar 
				ifTrue: [ each whichSelectorsReferToClassVariable: aString ]
				ifFalse: [ each whichSelectorsReferToInstanceVariable: aString ]) 
				detect: 
					[ :sel | 
					self 
						checkClass: each
						selector: sel
						using: matcher ]
				ifNone: [ nil ]) notNil ]
		ifNone: [ nil ]) notNil
]
