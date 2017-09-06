"
I am a refactoring for moving a class variable up to the superclass.
"
Class {
	#name : #RBPullUpClassVariableRefactoring,
	#superclass : #RBVariableRefactoring,
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 21:19'
}

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPullUpClassVariableRefactoring>>preconditions [
	^(RBCondition isMetaclass: class) not
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPullUpClassVariableRefactoring>>subclassDefiningVariable [
	| subclasses |
	subclasses := class allSubclasses 
		select: [ :each | each isMeta not and: [ each directlyDefinesClassVariable: variableName ] ].
	subclasses isEmpty 
		ifTrue: [ self refactoringFailure: 'Could not find a class defining ' , variableName ].
	subclasses size > 1 
		ifTrue: [ self refactoringError: 'Multiple subclasses define ' , variableName ].
	^ subclasses asArray first
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPullUpClassVariableRefactoring>>transform [
	| subclass |
	subclass := self subclassDefiningVariable.
	subclass removeClassVariable: variableName.
	class addClassVariable: variableName
]
