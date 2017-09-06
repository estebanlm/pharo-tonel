"
I am the baseclass for a ""class change"" refactoring change. I know about the
class(name) whether it is a change for for the meta or the instance side.

I keep track of the undo and redo operation, but the concrete class change operation is implement by my subclasses.
"
Class {
	#name : #RBRefactoryClassChange,
	#superclass : #RBRefactoryChange,
	#instVars : [
		'className',
		'isMeta'
	],
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/9/2016 20:01'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryClassChange>>= aRefactoryClassChange  [
	self class = aRefactoryClassChange class
		ifFalse: [ ^ false ].
	^ className = aRefactoryClassChange changeClassName 
		and: [ isMeta = aRefactoryClassChange isMeta ]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryClassChange>>asUndoOperation [
	^self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryClassChange>>changeClass [
	| class |
	class := Smalltalk globals at: self changeClassName ifAbsent: [ ^ nil ].
	^ isMeta ifTrue: [ class classSide ] ifFalse: [ class ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryClassChange>>changeClass: aBehavior  [
	isMeta := aBehavior isMeta.
	className := aBehavior theNonMetaClass name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryClassChange>>changeClassName [
	^ className
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryClassChange>>changeClassName: aSymbol  [
	className := aSymbol.
	isMeta isNil ifTrue: [ isMeta := false ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryClassChange>>changeString [
	^ self displayClassName
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryClassChange>>displayClassName [
	^ isMeta
		ifTrue: [ self changeClassName , ' class' ]
		ifFalse: [ self changeClassName asString ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryClassChange>>executeNotifying: aBlock [
	| undo |
	undo := self asUndoOperation.
	undo name: self name.
	self primitiveExecute.
	aBlock value.
	^ undo
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryClassChange>>hash [
	^ self changeClassName hash
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryClassChange>>isMeta [
	^ isMeta
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryClassChange>>methodSourceFor: aSymbol [
	^ (self changeClass includesSelector: aSymbol)
		ifTrue: [ self changeClass sourceCodeAt: aSymbol ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryClassChange>>primitiveExecute [
	^ self subclassResponsibility
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryClassChange>>printOn: aStream [
	aStream nextPutAll: self displayString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryClassChange>>renameChangesForClass: oldClassName to: newClassName [
	^ self changeClassName = oldClassName
		ifFalse: [ self ]
		ifTrue: [
			self copy
				changeClassName: newClassName;
				yourself ]
]
