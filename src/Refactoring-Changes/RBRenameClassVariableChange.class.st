"
I am a refactory change for a class variable renaming. The RBRefactory api is implemented in my super class, I just define
the concrete ""classvariable"" renaming.
"
Class {
	#name : #RBRenameClassVariableChange,
	#superclass : #RBRenameVariableChange,
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/8/2016 23:50'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameClassVariableChange>>addNewVariable [
	(RBAddClassVariableChange add: newName to: self changeClass)
		execute
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameClassVariableChange>>copyOldValuesToNewVariable [
	| oldValue |
	oldValue := self changeClass classPool at: oldName ifAbsent: [ nil ].
	self changeClass classPool at: newName asSymbol put: oldValue
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameClassVariableChange>>printOn: aStream  [
	aStream
		nextPutAll: self displayClassName;
		nextPutAll: ' removeClassVarName: ';
		print: self oldName;
		nextPut: $!; cr.
	aStream
		nextPutAll: self displayClassName; 
		nextPutAll: ' addClassVarName: '; 
		print: self newName;
		nextPut: $!
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameClassVariableChange>>removeOldVariable [
	(RBRemoveClassVariableChange remove: oldName from: self changeClass)
		execute
]
