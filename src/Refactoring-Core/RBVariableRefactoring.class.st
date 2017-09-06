"
I am an abstract base class of refactorings modifying class or instance variables.
"
Class {
	#name : #RBVariableRefactoring,
	#superclass : #RBRefactoring,
	#instVars : [
		'class',
		'variableName'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 19:49'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBVariableRefactoring class>>model: aRBSmalltalk variable: aVarName class: aClass  [
	^(self new)
		model: aRBSmalltalk;
		variable: aVarName class: aClass;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBVariableRefactoring class>>variable: aVarName class: aClass [
	^self new variable: aVarName class: aClass
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBVariableRefactoring>>storeOn: aStream  [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream nextPutAll: ' variable: '.
	variableName storeOn: aStream.
	aStream nextPutAll: ' class: '.
	class storeOn: aStream.
	aStream nextPut: $)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBVariableRefactoring>>variable: aVarName class: aClass  [
	class := self classObjectFor: aClass.
	variableName := aVarName
]
