"
I am a refactoring for replacing every direct access to  class variables with accessor methods.

My precondition verifies that the variable is directly defined in that class.
I create new accessor methods for the variables and replace every read and write to this variable with the new accessors.

"
Class {
	#name : #RBAbstractClassVariableRefactoring,
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
RBAbstractClassVariableRefactoring>>abstractClassReferences [
	| replacer |
	replacer := RBParseTreeRewriter 
		variable: variableName
		getter: self accessorsRefactoring getterMethod
		setter: self accessorsRefactoring setterMethod.
	self 
		convertClasses: class theMetaClass withAllSubclasses
		select: 
			[ :aClass | 
			(aClass whichSelectorsReferToClassVariable: variableName) reject: 
				[ :each | 
				aClass == class theMetaClass and: 
					[ each == self accessorsRefactoring getterMethod or: [ each == self accessorsRefactoring setterMethod ] ] ] ]
		using: replacer
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractClassVariableRefactoring>>abstractInstanceReferences [
	| replacer |
	replacer := RBParseTreeRewriter 
		variable: variableName
		getter: 'class ' , self accessorsRefactoring getterMethod
		setter: 'class ' , self accessorsRefactoring setterMethod.
	self 
		convertClasses: class withAllSubclasses
		select: [ :aClass | aClass whichSelectorsReferToClassVariable: variableName ]
		using: replacer
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractClassVariableRefactoring>>accessorsRefactoring [
	^accessorsRefactoring isNil 
		ifTrue: 
			[accessorsRefactoring := RBCreateAccessorsForVariableRefactoring 
						model: self model
						variable: variableName asString
						class: class
						classVariable: true]
		ifFalse: [accessorsRefactoring]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractClassVariableRefactoring>>createAccessors [
	self performComponentRefactoring: self accessorsRefactoring
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractClassVariableRefactoring>>preconditions [
	^(RBCondition isMetaclass: class) not 
		& (RBCondition directlyDefinesClassVariable: variableName asSymbol in: class) 
			& ((RBCondition withBlock: 
						[(#(#Object #Behavior #ClassDescription #Class) includes: class name) not]) 
					errorMacro: 'This refactoring does not work for Object, Behavior, ClassDescription, or Class')
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractClassVariableRefactoring>>transform [
	self createAccessors.
	self abstractInstanceReferences.
	self abstractClassReferences
]
