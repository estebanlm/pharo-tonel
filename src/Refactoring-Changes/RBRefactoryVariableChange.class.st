"
I am the baseclass for all refactoring changes for all kind of variable changes, adding or removing class,  instance variables and pool variables.
I only hold the name of the actual variable. The concrete kind of variable and how the defintion for adding this variable looks like, is implemented
by my subclasses.
"
Class {
	#name : #RBRefactoryVariableChange,
	#superclass : #RBRefactoryClassChange,
	#instVars : [
		'variable'
	],
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/9/2016 20:39'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryVariableChange class>>add: aVariable to: aBehavior [
	"This should only be called on the Add*Change subclasses, but is here so we don't need to copy it to all subclasses"

	^ self new class: aBehavior variable: aVariable
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryVariableChange class>>remove: aVariable from: aBehavior [
	"This should only be called on the Remove*Change subclasses, but is here so we don't need to copy it to all subclasses"

	^ self new class: aBehavior variable: aVariable
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryVariableChange>>= aRefactoryVariableChange [
	^ super = aRefactoryVariableChange and: [ self variable = aRefactoryVariableChange variable ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryVariableChange>>changeObject [
	^ self variable
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryVariableChange>>changeSymbol [
	self subclassResponsibility
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryVariableChange>>class: aBehavior variable: aString  [
	self changeClass: aBehavior.
	variable := aString
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryVariableChange>>hash [
	^ self changeClassName hash bitXor: self variable hash
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryVariableChange>>primitiveExecute [
	self changeClass perform: self changeSymbol with: self changeObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryVariableChange>>printOn: aStream  [
	aStream
		nextPutAll: self displayClassName; nextPut: $ ;
		nextPutAll: self changeSymbol; nextPut: $ ;
		print: self variable;
		nextPut: $!
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryVariableChange>>variable [
	^ variable
]
