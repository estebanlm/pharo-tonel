"
I am the baseclass for a variable-name refactoring change. I know about the
class(name) for this variable renaming, whether it is on the instance or class side and the old and
new variable name. See my subclasses for the concrete implementation of renaming a class or an instance variable.

Executing this refactory change will change the variable name of the (global) class.
"
Class {
	#name : #RBRenameVariableChange,
	#superclass : #RBCompositeRefactoryChange,
	#instVars : [
		'className',
		'isMeta',
		'oldName',
		'newName'
	],
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/8/2016 23:48'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange class>>rename: oldName to: newName in: aClass  [
	^ self new
		oldName: oldName;
		newName: newName;
		changeClass: aClass;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>= aRenameVariableChange  [
	self class = aRenameVariableChange class 
		ifFalse: [ ^ false ].
	^ className = aRenameVariableChange changeClassName 
		and: [ isMeta = aRenameVariableChange isMeta 
		and: [ oldName = aRenameVariableChange oldName 
		and: [ newName = aRenameVariableChange newName ] ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>addNewVariable [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>changeClass [
	| class |
	class := Smalltalk globals at: self changeClassName ifAbsent: [ ^ nil ].
	^ isMeta ifTrue: [ class class ] ifFalse: [ class ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>changeClass: aBehavior [
	isMeta := aBehavior isMeta.
	className := isMeta
		ifTrue: [ aBehavior soleInstance name ]
		ifFalse: [ aBehavior name ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>changeClassName [
	^ className
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>changeClassName: aSymbol [
	className := aSymbol.
	isMeta isNil
		ifTrue: [ isMeta := false ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>changeString [
	^ 'Rename ' , oldName , ' to ' , newName
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>copyOldValuesToNewVariable [
	self subclassResponsibility
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>displayClassName [
	^ isMeta
		ifTrue: [ self changeClassName , ' class' ]
		ifFalse: [ self changeClassName asString ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>executeNotifying: aBlock  [
	| undo |
	self addNewVariable.
	self copyOldValuesToNewVariable.
	undo := super executeNotifying: aBlock.
	undo
		oldName: newName;
		newName: oldName.
	self removeOldVariable.
	^ undo
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>hash [
	^ (self class hash bitXor: self oldName hash) bitXor: self newName hash
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>isMeta [
	^ isMeta
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>newName [
	^ newName
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>newName: aString  [
	newName := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>oldName [
	^ oldName
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>oldName: aString [
	oldName := aString
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>printOn: aStream [
	aStream nextPutAll: self displayString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameVariableChange>>removeOldVariable [
	self subclassResponsibility
]
