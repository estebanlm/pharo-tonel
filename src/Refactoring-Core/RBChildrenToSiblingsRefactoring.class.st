"
I am a refactoring operation for moving a class and its subclasses to a new super class.

You can choose which of the original childclasses should become now siblings.

For example,  we can generate a new Superclass for ClassS in
Object >> ClassP >> ClassS
Object >> ClassP >> ClassS >> ClassC1
Object >> ClassP >> ClassS >> ClassC2
Object >> ClassP >> ClassS >> ClassC3

and choose to move ClassC2 and ClassC3 to the new superclass - ClassNewP.

Object >> ClassP >> ClassNewP >> ClassS
Object >> ClassP >> ClassNewP >> ClassS >> ClassC1
Object >> ClassP >> ClassNewP >> ClassC2
Object >> ClassP >> ClassNewP >> ClassC3

Any method and instance variables,  defined in ClassS and used by the new siblings of ClassS are pushed up to the new superclass.


"
Class {
	#name : #RBChildrenToSiblingsRefactoring,
	#superclass : #RBClassRefactoring,
	#instVars : [
		'parent',
		'subclasses'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 21:35'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring class>>model: aRBSmalltalk name: aClassName class: aClass subclasses: subclassCollection  [
	^(self new)
		model: aRBSmalltalk;
		name: aClassName
			class: aClass
			subclasses: subclassCollection;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring class>>name: aClassName class: aClass subclasses: subclassCollection  [
	^(self new)
		name: aClassName
			class: aClass
			subclasses: subclassCollection;
		yourself
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>abstractSuperclass [
	^self model classNamed: className asSymbol
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>addSuperclass [
	self performComponentRefactoring: (RBAddClassRefactoring 
				model: self model
				addClass: className
				superclass: parent superclass
				subclasses: (Array with: parent)
				category: parent category)
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>changeIsKindOfReferences [
	| replacer |
	replacer := RBParseTreeRewriter new.
	replacer replace: '``@object isKindOf: ' , parent name
		with: '``@object isKindOf: ' , className.
	self convertAllReferencesToClass: parent using: replacer
]

{
	#category : #private-methods,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>computeSubclassSupersOf: aClass  [
	| selectors |
	selectors := Set new.
	aClass subclasses do: 
			[:each | 
			each selectors 
				do: [:sel | selectors addAll: (each parseTreeFor: sel) superMessages]].
	^selectors
]

{
	#category : #private-methods,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>createSubclassResponsibilityFor: aSelector in: aClass  [
	| source |
	(aClass superclass definesMethod: aSelector) ifTrue: [^self].
	source := self subclassResponsibilityFor: aSelector in: aClass.
	source isNil ifTrue: [^self].
	aClass superclass compile: source
		classified: (aClass protocolsFor: aSelector)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>name: aClassName class: aClass subclasses: subclassCollection  [
	className := aClassName asSymbol.
	parent := self model classFor: aClass.
	subclasses := subclassCollection 
				collect: [:each | self model classFor: each]
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>preconditions [
	^subclasses 
		inject: ((RBCondition isMetaclass: parent) 
				errorMacro: 'Superclass must not be a metaclass') not 
				& (RBCondition isValidClassName: className) 
					& (RBCondition isGlobal: className in: self model) not
		into: 
			[:sub :each | 
			sub 
				& ((RBCondition isMetaclass: each) 
						errorMacro: 'Subclass must <1?not :>be a metaclass') not 
					& (RBCondition isImmediateSubclass: each of: parent)]
]

{
	#category : #private-variables,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>pullUpClassInstanceVariables [
	| newSuperclass |
	newSuperclass := self abstractSuperclass theMetaClass.
	parent theMetaClass instanceVariableNames do: 
		[ :each | 
		self performComponentRefactoring: (RBPullUpInstanceVariableRefactoring 
				model: self model
				variable: each
				class: newSuperclass) ]
]

{
	#category : #private-variables,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>pullUpClassVariables [
	| newSuperclass |
	newSuperclass := self abstractSuperclass.
	parent classVariableNames do: 
			[:each | 
			self performComponentRefactoring: (RBPullUpClassVariableRefactoring 
						model: self model
						variable: each
						class: newSuperclass)]
]

{
	#category : #private-variables,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>pullUpInstanceVariables [
	| newSuperclass |
	newSuperclass := self abstractSuperclass.
	parent instanceVariableNames do: 
			[:each | 
			self performComponentRefactoring: (RBPullUpInstanceVariableRefactoring 
						model: self model
						variable: each
						class: newSuperclass)]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>pullUpMethods [
	self pushUpMethodsFrom: parent.
	self pushUpMethodsFrom: parent theMetaClass
]

{
	#category : #private-variables,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>pullUpPoolVariables [
	"Don't remove the pool variables from the subclass since they might be referenced there."

	| newSuperclass |
	newSuperclass := self abstractSuperclass.
	parent sharedPoolNames 
		do: [:each | newSuperclass addPoolDictionary: each]
]

{
	#category : #private-methods,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>pushUp: aSelector in: aClass  [
	| source |
	source := aClass sourceCodeFor: aSelector.
	source isNil 
		ifFalse: 
			[aClass superclass compile: source
				classified: (aClass protocolsFor: aSelector)]
]

{
	#category : #private-methods,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>pushUpMethodsFrom: aClass  [
	| selectorsToPushUp |
	selectorsToPushUp := self selectorsToPushUpFrom: aClass.
	aClass selectors do: 
			[:each | 
			(selectorsToPushUp includes: each) 
				ifTrue: [self pushUp: each in: aClass]
				ifFalse: [self createSubclassResponsibilityFor: each in: aClass]].
	selectorsToPushUp do: [:each | aClass removeMethod: each]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>pushUpVariables [
	self pullUpInstanceVariables.
	self pullUpClassInstanceVariables.
	self pullUpClassVariables.
	self pullUpPoolVariables
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>reparentSubclasses [
	self model reparentClasses: subclasses to: self abstractSuperclass
]

{
	#category : #private-methods,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>selectorsToPushUpFrom: aClass  [
	| superSelectors |
	superSelectors := self computeSubclassSupersOf: aClass.
	^aClass selectors select: 
			[:each | 
			(superSelectors includes: each) or: [self shouldPushUp: each from: aClass]]
]

{
	#category : #private-methods,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>shouldPushUp: aSelector from: aClass  [
	^ ((aClass isMeta 
		ifTrue: [ subclasses collect: [ :each | each theMetaClass ] ]
		ifFalse: [ subclasses ]) 
		detect: [ :each | (each directlyDefinesMethod: aSelector) not ]
		ifNone: [ nil ]) notNil
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>storeOn: aStream  [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' name: #';
		nextPutAll: className;
		nextPutAll: ' class: '.
	parent storeOn: aStream.
	aStream nextPutAll: ' subclasses: '.
	subclasses asArray storeOn: aStream.
	aStream nextPut: $)
]

{
	#category : #private-methods,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>subclassResponsibilityFor: aSelector in: aClass  [
	| methodNode position source |
	source := aClass sourceCodeFor: aSelector.
	methodNode := RBParser parseMethod: source onError: [:err :pos | ^nil].
	position := methodNode arguments isEmpty 
				ifTrue: [methodNode keywordsIntervals last last ]
				ifFalse: [methodNode arguments last stop].
	^'<1s><n><t>self subclassResponsibility' 
		expandMacrosWith: (source copyFrom: 1 to: position)
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBChildrenToSiblingsRefactoring>>transform [
	self
		addSuperclass;
		pushUpVariables;
		pullUpMethods;
		changeIsKindOfReferences;
		reparentSubclasses
]
