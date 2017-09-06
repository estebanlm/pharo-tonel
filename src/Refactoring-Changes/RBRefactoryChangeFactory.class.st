"
This object is the  abstract factory of all the changes, 
the idea is to have another version of the changes that can use the atomic class installer.
"
Class {
	#name : #RBRefactoryChangeFactory,
	#superclass : #Object,
	#category : #Refactoring-Changes,
	#timestamp : 'PabloTesone 1/11/2017 15:11'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory class>>instance [
	^ RBRefactoryChangeManager instance changeFactory
]

{
	#category : #refactory-changes-classes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>addClassDefinition: definition [
	^ RBAddClassChange definition: definition.
]

{
	#category : #refactory-changes-classes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>addClassDefinition: definition for: aController [
	^ RBAddClassChange definition: definition for: aController.
]

{
	#category : #refactory-changes-classes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>addClassDefinition: definition for: aController context: aDictionary [
	^ RBAddClassChange definition: definition for: aController context: aDictionary.
]

{
	#category : #refactory-changes-variables,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>addClassVariable: variableName to: aClass [
	^ RBAddClassVariableChange add: variableName to: aClass
]

{
	#category : #refactory-changes-variables,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>addInstanceVariable: variableName to: aClass [
	^ RBAddInstanceVariableChange add: variableName to: aClass
]

{
	#category : #refactory-changes-methods,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>addMethodSource: sourceCode in: aClass [
	^ RBAddMethodChange compile: sourceCode in: aClass
]

{
	#category : #refactory-changes-methods,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>addMethodSource: sourceCode in: aClass classified: aProtocol [
	^ RBAddMethodChange compile: sourceCode in: aClass classified: aProtocol
]

{
	#category : #refactory-changes-methods,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>addMethodSource: sourceCode in: aClass classified: aProtocol for: aController [
	^ RBAddMethodChange
		compile: sourceCode
		in: aClass
		classified: aProtocol
		for: aController
]

{
	#category : #refactory-changes-methods,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>addMethodSource: sourceCode in: aClass for: aController [
	^ RBAddMethodChange
			compile: sourceCode in: aClass for: aController
]

{
	#category : #refactory-changes-variables,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>addPoolVariable: variableName to: aClass [
	^ RBAddPoolVariableChange add: variableName to: aClass
]

{
	#category : #refactory-changes-classes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>addTraitDefinition: definition [
	^ RBAddTraitChange definition: definition.
]

{
	#category : #refactory-changes-classes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>comment: aComment in: aRBClass [
	^ RBCommentChange comment: aComment in: aRBClass
]

{
	#category : #refactory-changes-composites,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>compositeRefactoryChange [
	^ RBCompositeRefactoryChange new
]

{
	#category : #refactory-changes-composites,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>compositeRefactoryChangeNamed: name [
	^ RBCompositeRefactoryChange named:name
]

{
	#category : #refactory-changes-variables,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>removeClassNamed: aClassName [
	^ RBRemoveClassChange removeClassName: aClassName
]

{
	#category : #refactory-changes-variables,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>removeClassVariable: variableName from: aClass [
	^ RBRemoveClassVariableChange remove: variableName from: aClass
]

{
	#category : #refactory-changes-variables,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>removeInstanceVariable: variableName from: aClass [
	^ RBRemoveInstanceVariableChange remove: variableName from: aClass
]

{
	#category : #refactory-changes-methods,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>removeMethod: aSelector from: aClass [
	^ RBRemoveMethodChange remove: aSelector from: aClass
]

{
	#category : #refactory-changes-variables,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>removePoolVariable: variableName from: aClass [
	^ RBRemovePoolVariableChange remove: variableName from: aClass
]

{
	#category : #refactory-changes-classes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>renameClass: aRBClass to: newName [
	^ RBRenameClassChange rename: aRBClass name to: newName
]

{
	#category : #refactory-changes-variables,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>renameClassVariable: oldName to: newName in: aClass [
	^ RBRenameClassVariableChange rename: oldName to: newName in: aClass 
]

{
	#category : #refactory-changes-variables,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChangeFactory>>renameInstanceVariable: oldName to: newName in: aClass [
	^ RBRenameInstanceVariableChange rename: oldName to: newName in: aClass 
]
