"
I am a refactoring for generating a printString (printOn: aStream) method. 

You can specify which of my instance variables should be used for generating the printString.

For example: 
RBGeneratePrintStringRefactoring model:RBNamespace new className: ClassS variables: { #inst1 . #inst2 . #inst3 }.

"
Class {
	#name : #RBGeneratePrintStringRefactoring,
	#superclass : #RBClassRefactoring,
	#instVars : [
		'variables'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 10:12'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBGeneratePrintStringRefactoring class>>className: aClass variables: anArray [
	^ (self className: aClass) variables: anArray
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBGeneratePrintStringRefactoring class>>model: aNamespace className: aClass variables: anArray [
	^ (self model: aNamespace className: aClass) variables: anArray
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBGeneratePrintStringRefactoring>>preconditions [
	^ variables
		inject: RBCondition empty
		into: [ :condition :variable | condition & (RBCondition definesInstanceVariable: variable in: self theClass) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBGeneratePrintStringRefactoring>>theClass [
	^ (self classObjectFor: className) theNonMetaClass
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBGeneratePrintStringRefactoring>>transform [
	| method |
	method := RBParser parseMethod: 'printOn: aStream
		"Append a sequence of characters to aStream that identify the receiver."
		
		super printOn: aStream'.
	variables do: [ :each |
		method body addNode: (RBParser 
			parseExpression: ('aStream nextPutAll: '' <1s>: ''; print: <1s>'
				expandMacrosWith: each)) ].
	self theClass
		compile: method formattedCode
		classified: #(printing)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBGeneratePrintStringRefactoring>>variables: anArray [
	variables := anArray
]
