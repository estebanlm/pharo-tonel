"
I am a refactory change for a class-rename refactoring. I hold the old and new name.
Executing this change will rename the (global) defined ""oldName"" class to ""newName"".
"
Class {
	#name : #RBRenameClassChange,
	#superclass : #RBCompositeRefactoryChange,
	#instVars : [
		'oldName',
		'newName'
	],
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/8/2016 23:43'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameClassChange class>>rename: oldString to: newString  [
	^ self new
		rename: oldString to: newString;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameClassChange>>= aRenameClassChange  [
	super class = aRenameClassChange class
		ifFalse: [ ^ false ].
	^oldName = aRenameClassChange oldName 
		and: [ newName = aRenameClassChange newName ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameClassChange>>changeClass [
	^ Smalltalk globals at: oldName asSymbol ifAbsent: [ Smalltalk globals at: newName asSymbol ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameClassChange>>executeNotifying: aBlock  [
	| undos |
	self changeClass rename: newName.
	undos := changes collect: [ :each | 
		(each renameChangesForClass: oldName asSymbol to: newName asSymbol) 
			executeNotifying: aBlock ].
	^ self copy
		changes: undos reverse;
		rename: newName to: oldName;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameClassChange>>hash [
	^ (self class hash bitXor: self oldName hash) bitXor: self newName hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameClassChange>>newName [
	^ newName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameClassChange>>oldName [
	^ oldName
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameClassChange>>printOn: aStream  [
	aStream
		nextPutAll: self oldName;
		nextPutAll: ' rename: ';
		print: self newName;
		nextPut: $!
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameClassChange>>rename: oldString to: newString  [
	oldName := oldString.
	newName := newString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRenameClassChange>>renameChangesForClass: oldClassName to: newClassName [
	| change |
	change := super renameChangesForClass: oldClassName to: newClassName.
	oldName asSymbol = oldClassName
		ifTrue: [ change rename: newClassName to: newName ].
	^ change
]
