"
I am a regex refactoring renaming class names.
"
Class {
	#name : #RBClassRegexRefactoring,
	#superclass : #RBRegexRefactoring,
	#instVars : [
		'rootClass',
		'mode'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 19:41'
}

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassRegexRefactoring>>copy: aClass name: aSymbol [
	^ self duplicate: aClass name: aSymbol deep: true
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassRegexRefactoring>>copyClasses [
	mode := #copy:name:
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassRegexRefactoring>>copyFrom: aSourceClass to: aTargetClass [
	aSourceClass instanceVariableNames
		do: [ :each | aTargetClass addInstanceVariable: each ].
	aSourceClass isMeta ifFalse: [
		aSourceClass allClassVariableNames
			do: [ :each | aTargetClass addClassVariable: each ].
		aSourceClass sharedPoolNames
			do: [ :each | aTargetClass addPoolDictionary: each ] ].
	aSourceClass selectors do: [ :each |
		aTargetClass
			compile: (aSourceClass sourceCodeFor: each)
			classified: (aSourceClass protocolsFor: each) ]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassRegexRefactoring>>create: aClass name: aSymbol [
	^ self duplicate: aClass name: aSymbol deep: false
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassRegexRefactoring>>createClasses [
	mode := #create:name:
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassRegexRefactoring>>duplicate: aClass name: aSymbol deep: aBoolean [
	| superclass superclassName name class |
	(self model includesClassNamed: aSymbol)
		ifTrue: [ ^ nil ].
	superclass := aClass superclass 
		ifNil: [ self rootClass ].
	superclassName := (self model includesClassNamed: superclass name)
		ifFalse: [ superclass name ]
		ifTrue: [ 
			(name := self execute: superclass name) = superclass name
				ifFalse: [ self duplicate: superclass name: name deep: aBoolean ].
			name ].
	self model defineClass: ('<1s>
		subclass: #<2s>
		instanceVariableNames: ''''
		classVariableNames: ''''
		poolDictionaries: ''''
		category: <3p>' 
			expandMacrosWith: superclassName 
			with: aSymbol with: aClass category asString).
	aBoolean ifTrue: [
		(class := self model classNamed: aSymbol) 
			ifNil: [ ^ self ].
		self copyFrom: aClass to: class.
		self copyFrom: aClass theMetaClass to: class theMetaClass ].
	^ nil
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassRegexRefactoring>>initialize [
	super initialize.
	self createClasses
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassRegexRefactoring>>rename: aClass name: aSymbol [
	^ RBRenameClassRefactoring 
		model: self model
		rename: aClass
		to: aSymbol
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassRegexRefactoring>>renameClasses [
	mode := #rename:name:
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassRegexRefactoring>>rootClass [
	^ rootClass ifNil: [ Object ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassRegexRefactoring>>rootClass: aClass [
	rootClass := aClass theNonMetaClass
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClassRegexRefactoring>>transform [
	| replacement refactoring |
	self model allClassesDo: [ :class |
		(class isNil or: [ class isMeta ]) ifFalse: [
			replacement := self execute: class name.
			replacement = class name asString ifFalse: [
				refactoring := self perform: mode
					with: class with: replacement asSymbol.
				(refactoring notNil and: [ refactoring preconditions check ])
					ifTrue: [ refactoring transform ] ] ] ]
]
