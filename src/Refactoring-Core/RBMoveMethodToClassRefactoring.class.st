"
A RBMoveMethodToClassRefactoring is a class that represents functionality of ""Move method to class"" refactoring.
User chooses method, and than any of existiong classes.
Refactoring moves chosen method to class.

Instance Variables
	method:		<RBMethod>

method
	- chosen method

"
Class {
	#name : #RBMoveMethodToClassRefactoring,
	#superclass : #RBMethodRefactoring,
	#instVars : [
		'method'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'MarkRizun 7/24/2014 14:17'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodToClassRefactoring class>>method: aMethod class: aClass [
	^ self new
		method: aMethod class: aClass;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodToClassRefactoring class>>model: aRBSmalltalk method: aMethod class: aClass [
	^ self new
		model: aRBSmalltalk;
		method: aMethod class: aClass;
		yourself
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodToClassRefactoring>>classModelOf: aClass [
	| classModel |
	classModel := aClass isMeta 
		ifTrue: [ RBClassModelFactory rbMetaclass named: aClass name ]
		ifFalse: [ RBClassModelFactory rbClass named: aClass name ].
	classModel model: self model.
	^classModel
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodToClassRefactoring>>method: aMethod class: aClass [
	method := aMethod.
	class := self classObjectFor: aClass.
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodToClassRefactoring>>preconditions [
	^(RBCondition definesSelector: method selector in: class) not
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodToClassRefactoring>>storeOn: aStream  [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' selector: #';
		nextPutAll:  method selector;
		nextPutAll: ' class: '.
	class storeOn: aStream.
	aStream
		nextPutAll: ''')'
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodToClassRefactoring>>transform [
	| oldClass newClass rbMethod originalProtocol |
	oldClass := self classModelOf: method methodClass.
	newClass := self classModelOf: class.
	rbMethod := RBClassModelFactory rbMethod for: newClass source: method sourceCode selector: method selector.
	originalProtocol := method protocol.
	oldClass removeMethod: method selector.
	newClass addMethod: rbMethod.
	newClass compile: rbMethod source classified: {originalProtocol}
]
