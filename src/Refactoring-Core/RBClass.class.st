"
I represent the instance side of a class in a refactoring namespace. 

You can query methods and (instance) var names, poolDictionaries, class category and comment.

I shouldn't be created directly, but always be part of a refactoring namespace.
My  namespace usally knows me and my meta class.
"
Class {
	#name : #RBClass,
	#superclass : #RBAbstractClass,
	#instVars : [
		'classVariableNames',
		'poolDictionaryNames',
		'category',
		'comment'
	],
	#classVars : [
		'LookupComment'
	],
	#category : #Refactoring-Core-Model,
	#timestamp : 'NicolaiHess 5/18/2016 23:41'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass class>>existingNamed: aSymbol  [
	^(self named: aSymbol)
		realName: aSymbol;
		yourself
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass class>>initialize [
	LookupComment := Object new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass class>>named: aSymbol  [
	^(self new)
		name: aSymbol;
		yourself
]

{
	#category : #'variable accessing',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>addClassVariable: aString  [
	self privateClassVariableNames add: aString asSymbol.
	model addClassVariable: aString to: self
]

{
	#category : #'variable accessing',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>addPoolDictionary: aString  [
	self privatePoolDictionaryNames add: aString asSymbol.
	model addPool: aString to: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>allClassVariableNames [
	| sprClass |
	sprClass := self superclass.
	^sprClass isNil 
		ifTrue: [self classVariableNames]
		ifFalse: [sprClass allClassVariableNames , self classVariableNames]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>allPoolDictionaryNames [
	| sprClass |
	sprClass := self superclass.
	^sprClass isNil 
		ifTrue: [self sharedPoolNames]
		ifFalse: [sprClass allPoolDictionaryNames , self sharedPoolNames]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>category [
	^category isNil 
		ifTrue: 
			[self isDefined
				ifTrue: [category := self realClass category]
				ifFalse: [model environment whichCategoryIncludes: self name]]
		ifFalse: [category]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>category: aSymbol  [
	category := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>classVariableNames [
	^self privateClassVariableNames copy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>classVariableNames: aCollectionOfStrings  [
	classVariableNames := (aCollectionOfStrings 
				collect: [:each | each asSymbol]) asOrderedCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>comment [
	^ comment = LookupComment
		ifTrue: [
			comment := self isDefined
				ifTrue: [ self realClass comment ]
				ifFalse: [ nil ] ]
		ifFalse: [ comment ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>comment: aString [
	model comment: (comment := aString) in: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>definitionString [
	^ String
		streamContents:
			[ :definitionStream | 
			definitionStream
				nextPutAll: self superclass printString;
				nextPutAll: ' subclass: #';
				nextPutAll: self name;
				nextPutAll:
					'
	instanceVariableNames: '''.
			self instanceVariableNames
				do: [ :each | 
					definitionStream
						nextPutAll: each;
						nextPut: $  ].
			definitionStream
				nextPutAll:
					'''
	classVariableNames: '''.
			self classVariableNames
				do: [ :each | 
					definitionStream
						nextPutAll: each;
						nextPut: $  ].
			definitionStream
				nextPutAll:
					'''
	poolDictionaries: '''.
			self sharedPoolNames
				do: [ :each | 
					definitionStream
						nextPutAll: each;
						nextPut: $  ].
			definitionStream
				nextPutAll:
					'''
	category: #'''.
			definitionStream nextPutAll: self category asString.
			definitionStream nextPut: $' ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>directlyDefinesClassVariable: aString  [
	^self classVariableNames includes: aString asSymbol
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>directlyDefinesPoolDictionary: aString  [
	^self sharedPoolNames includes: aString asSymbol
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>initialize [
	super initialize.
	comment := LookupComment
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>isMeta [
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>poolDictionaryNames: aCollectionOfStrings  [
	poolDictionaryNames := (aCollectionOfStrings 
				collect: [:each | each asSymbol]) asOrderedCollection
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>privateClassVariableNames [
	(self isDefined and: [classVariableNames isNil]) 
		ifTrue: [self classVariableNames: self realClass classVarNames].
	^classVariableNames
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>privatePoolDictionaryNames [
	(self isDefined and: [poolDictionaryNames isNil]) 
		ifTrue: 
			[self poolDictionaryNames: (self realClass sharedPools 
						collect: [:each | self realClass environment keyAtValue: each])].
	^poolDictionaryNames
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>realName: aSymbol  [
	self realClass: (self class environment at: aSymbol)
]

{
	#category : #'variable accessing',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>removeClassVariable: aString  [
	self privateClassVariableNames remove: aString asSymbol.
	model removeClassVariable: aString from: self
]

{
	#category : #'variable accessing',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>removePoolDictionary: aString  [
	self privatePoolDictionaryNames remove: aString asSymbol
]

{
	#category : #'variable accessing',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>renameClassVariable: oldName to: newName around: aBlock  [
	self privateClassVariableNames 
		at: (self privateClassVariableNames indexOf: oldName asSymbol)
		put: newName asSymbol.
	model 
		renameClassVariable: oldName
		to: newName
		in: self
		around: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>sharedPoolNames [
	^self privatePoolDictionaryNames copy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>sharedPools [
	^ self allPoolDictionaryNames collect: [ :each | Smalltalk globals at: each asSymbol ifAbsent: [ Dictionary new ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBClass>>theNonMetaClass [
	^ self
]
