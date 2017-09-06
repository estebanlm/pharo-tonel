"
I am a composition of RBRefactoryChanges. I hold a list of changes. 
I implement many ""environment change"" operation like renameClass/removeClass/ rename instance variable that are
actually called on the name space by a refactoring operation and my responsibilty is to create a appropriate refactoring change
and save it in my list of changes.

"
Class {
	#name : #RBCompositeRefactoryChange,
	#superclass : #RBRefactoryChange,
	#instVars : [
		'changes'
	],
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/9/2016 19:59'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange class>>named: aString [
	^ self new
		name: aString;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>= aRefactoryBuilder  [
	self class = aRefactoryBuilder class
		ifFalse: [ ^ false ].
	changes size = aRefactoryBuilder changes size
		ifFalse: [ ^ false ].
	changes with: aRefactoryBuilder changes do: [ :first :second |
		first = second
			ifFalse: [ ^ false ] ].
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>addChange: aRefactoryChange  [
	changes add: aRefactoryChange.
	^ aRefactoryChange
]

{
	#category : #refactory-changes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>addClassVariable: variableName to: aClass  [
	^ self addChange: (RBRefactoryChangeManager changeFactory addClassVariable: variableName to: aClass)
]

{
	#category : #refactory-changes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>addInstanceVariable: variableName to: aClass  [
	^ self addChange: (RBRefactoryChangeManager changeFactory addInstanceVariable: variableName to: aClass)
]

{
	#category : #refactory-changes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>addPool: aPoolVariable to: aClass  [
	^ self addChange: (RBRefactoryChangeManager changeFactory addPoolVariable: aPoolVariable to: aClass)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>changeForClass: aClassName selector: aSelector  [
	changes reverseDo: [ :each | 
		| change |
		change := each changeForClass: aClassName selector: aSelector.
		change notNil ifTrue: [ ^ change ] ].
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>changeForMetaclass: aClassName selector: aSelector  [
	changes reverseDo: [ :each | 
		| change |
		change := each changeForMetaclass: aClassName selector: aSelector.
		change notNil ifTrue: [ ^ change ] ].
	^ nil
]

{
	#category : #'private-inspector accessing',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>changes [
	^ changes
]

{
	#category : #'private-inspector accessing',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>changes: aCollection  [
	changes := aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>changesSize [
	^ changes inject: 0 into: [ :sum :each | sum + each changesSize ]
]

{
	#category : #refactory-changes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>comment: aString in: aClass  [
	^ self addChange: (RBRefactoryChangeManager changeFactory comment: aString in: aClass)
]

{
	#category : #refactory-changes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>compile: source in: class  [
	^ self addChange: (RBRefactoryChangeManager changeFactory addMethodSource: source in: class)
]

{
	#category : #refactory-changes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>compile: source in: class classified: aProtocol  [
	^ self addChange: (RBRefactoryChangeManager changeFactory addMethodSource: source in: class classified: aProtocol)
]

{
	#category : #refactory-changes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>defineClass: aString  [
	^ self addChange: (RBRefactoryChangeManager changeFactory addClassDefinition: aString)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>executeNotifying: aBlock  [
	| undos undo |
	undos := changes collect: [ :each | each executeNotifying: aBlock ].
	undo := self copy.
	undo changes: undos reversed.
	^ undo
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>hash [
	^ self class hash bitXor: self changes size hash
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>initialize [
	super initialize.
	changes := OrderedCollection new
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>postCopy [
	super postCopy.
	changes := changes collect: [ :each | each copy ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>printOn: aStream  [
	name isNil
		ifTrue: [ ^ super printOn: aStream ].
	aStream nextPutAll: name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>problemCount [
	^ self changesSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>removeChange: aChange  [
	^ changes remove: aChange ifAbsent: [ nil ]
]

{
	#category : #refactory-changes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>removeClass: aClass  [
	^ self addChange: (RBRefactoryChangeManager changeFactory removeClassNamed: aClass name)
]

{
	#category : #refactory-changes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>removeClassNamed: aSymbol  [
	^ self addChange: (RBRefactoryChangeManager changeFactory removeClassNamed: aSymbol)
]

{
	#category : #refactory-changes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>removeClassVariable: variableName from: aClass  [
	^ self addChange: (RBRefactoryChangeManager changeFactory removeClassVariable: variableName from: aClass)
]

{
	#category : #refactory-changes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>removeInstanceVariable: variableName from: aClass  [
	^ self addChange: (RBRefactoryChangeManager changeFactory removeInstanceVariable: variableName from: aClass)
]

{
	#category : #refactory-changes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>removeMethod: aSelector from: aClass  [
	^ self addChange: (RBRefactoryChangeManager changeFactory removeMethod: aSelector from: aClass)
]

{
	#category : #refactory-changes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>removePool: aPoolVariable from: aClass  [
	^ self addChange: (RBRefactoryChangeManager changeFactory removePoolVariable: aPoolVariable from: aClass)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>renameChangesForClass: oldClassName to: newClassName [
	^ self copy
		changes: (self changes 
			collect: [ :each | each renameChangesForClass: oldClassName to: newClassName ]);
		yourself
]

{
	#category : #refactory-changes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>renameClass: class to: newName  [
	^ self addChange: (RBRefactoryChangeManager changeFactory renameClass: class to: newName)
]

{
	#category : #refactory-changes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>renameClassVariable: oldName to: newName in: aClass [
	^ self addChange: (RBRefactoryChangeManager changeFactory renameClassVariable: oldName to: newName in: aClass)
]

{
	#category : #refactory-changes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBCompositeRefactoryChange>>renameInstanceVariable: oldName to: newName in: aClass [
	^ self addChange: (RBRefactoryChangeManager changeFactory renameInstanceVariable: oldName to: newName in: aClass)
]
