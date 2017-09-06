"
I am a refactoring operation for creating accessors for all variables.

Example:
Create accessors for all instance variables:
RBAccessorClassRefactoring model: RBNamespace new className: 'Morph' .

Create accessors for all class instance variables:
RBAccessorClassRefactoring model: RBNamespace new className: 'Morph class' .

If the class already contains that accessor, I will create another one with a numbered suffix.

"
Class {
	#name : #RBAccessorClassRefactoring,
	#superclass : #RBClassRefactoring,
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 21:34'
}

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAccessorClassRefactoring>>preconditions [
	^ self refactorings
		inject: RBCondition empty
		into: [ :result :each | result & each preconditions ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAccessorClassRefactoring>>refactorings [
	| class |
	class := self classObjectFor: className asSymbol.
	^  class instanceVariableNames collect: [ :each | 
		RBCreateAccessorsForVariableRefactoring
			variable: each class: class classVariable: false ]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAccessorClassRefactoring>>transform [
	self refactorings do: [ :each | self performComponentRefactoring: each ]
]
