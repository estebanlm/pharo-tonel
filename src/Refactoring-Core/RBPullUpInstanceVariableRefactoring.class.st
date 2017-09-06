"
I am a refactoring for moving a instance  variable up to the superclass.
"
Class {
	#name : #RBPullUpInstanceVariableRefactoring,
	#superclass : #RBVariableRefactoring,
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 21:20'
}

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPullUpInstanceVariableRefactoring>>preconditions [
	^RBCondition withBlock: 
			[(class hierarchyDefinesInstanceVariable: variableName) 
				ifFalse: [self refactoringFailure: 'No subclass defines ' , variableName].
			(class subclasses 
				detect: [:each | (each directlyDefinesInstanceVariable: variableName) not]
				ifNone: [nil]) notNil 
				ifTrue: 
					[self 
						refactoringWarning: 'Not all subclasses have an instance variable named ' 
								, variableName , '.'].
			true]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPullUpInstanceVariableRefactoring>>transform [
	class allSubclasses do: 
			[:each | 
			(each directlyDefinesInstanceVariable: variableName) 
				ifTrue: [each removeInstanceVariable: variableName]].
	class addInstanceVariable: variableName
]
