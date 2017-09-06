"
I am a refactoring for moving a method down to all direct subclasses.

My preconditions verify that this method isn't refered  as a super send in the subclass. And the class defining this method is abstract or not referenced anywhere.


"
Class {
	#name : #RBPushDownMethodRefactoring,
	#superclass : #RBMethodRefactoring,
	#instVars : [
		'selectors'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 8/6/2016 13:45'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPushDownMethodRefactoring class>>model: aRBSmalltalk pushDown: selectorCollection from: aClass  [
	^(self new)
		model: aRBSmalltalk;
		pushDown: selectorCollection from: aClass;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPushDownMethodRefactoring class>>pushDown: selectorCollection from: aClass  [
	^self new pushDown: selectorCollection from: aClass
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPushDownMethodRefactoring>>preconditions [
	| condition |
	condition := selectors 
		inject: RBCondition empty
		into: [ :cond :each | 
			cond & (RBCondition definesSelector: each in: class) 
				& (RBCondition subclassesOf: class referToSelector: each) not].
	^condition & (RBCondition isAbstractClass: class)
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPushDownMethodRefactoring>>pushDown: aSelector  [
	| code protocols refactoring |
	code := class sourceCodeFor: aSelector.
	protocols := class protocolsFor: aSelector.
	refactoring := RBExpandReferencedPoolsRefactoring 
				model: self model
				forMethod: (class parseTreeFor: aSelector)
				fromClass: class
				toClasses: class subclasses.
	self performComponentRefactoring: refactoring.
	class subclasses do: 
			[:each | 
			(each directlyDefinesMethod: aSelector) 
				ifFalse: [each compile: code classified: protocols]]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPushDownMethodRefactoring>>pushDown: selectorCollection from: aClass  [
	class := self classObjectFor: aClass.
	selectors := selectorCollection
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPushDownMethodRefactoring>>storeOn: aStream  [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream nextPutAll: ' pushDown: '.
	selectors asArray storeOn: aStream.
	aStream nextPutAll: ' from: '.
	class storeOn: aStream.
	aStream nextPut: $)
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPushDownMethodRefactoring>>transform [
	selectors do: [:each | self pushDown: each].
	selectors do: [:each | class removeMethod: each]
]
