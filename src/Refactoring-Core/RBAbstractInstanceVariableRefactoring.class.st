"
I am a refactoring for replacing every direct access to  instance  variables with accessor methods.

My precondition verifies that the variable is directly defined in that class.
I create new accessor methods for the variables and replace every read and write to this variable with the new accessors.

"
Class {
	#name : #RBAbstractInstanceVariableRefactoring,
	#superclass : #RBVariableRefactoring,
	#instVars : [
		'accessorsRefactoring'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 19:53'
}

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractInstanceVariableRefactoring>>abstractReferences [
	| replacer |
	replacer := RBParseTreeRewriter 
				variable: variableName
				getter: self accessorsRefactoring getterMethod
				setter: self accessorsRefactoring setterMethod.
	self 
		convertClasses: class withAllSubclasses
		select: 
			[:aClass | 
			(aClass whichSelectorsReferToInstanceVariable: variableName) reject: 
					[:each | 
					aClass == class and: 
							[each == self accessorsRefactoring getterMethod 
								or: [each == self accessorsRefactoring setterMethod]]]]
		using: replacer
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractInstanceVariableRefactoring>>accessorsRefactoring [
	^accessorsRefactoring isNil 
		ifTrue: 
			[accessorsRefactoring := RBCreateAccessorsForVariableRefactoring 
						model: self model
						variable: variableName
						class: class
						classVariable: false]
		ifFalse: [accessorsRefactoring]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractInstanceVariableRefactoring>>createAccessors [
	self performComponentRefactoring: self accessorsRefactoring
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractInstanceVariableRefactoring>>preconditions [
	^RBCondition directlyDefinesInstanceVariable: variableName in: class
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractInstanceVariableRefactoring>>transform [
	self createAccessors.
	self abstractReferences
]
