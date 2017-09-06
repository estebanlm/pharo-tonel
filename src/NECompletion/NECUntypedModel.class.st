"
When no receiver class is known, I'm the right model. I store all temporary variables, instance variables of the selected class and all selectors in system. For performance reasons I only collect selectors when at least one character is known.
"
Class {
	#name : #NECUntypedModel,
	#superclass : #NECModel,
	#instVars : [
		'instVars',
		'localVars',
		'includeVariables',
		'includeSelectors',
		'classVars',
		'listLimit'
	],
	#category : #NECompletion-Model,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECUntypedModel class>>class: aClass temporaries: aCollection  [
	^self 
		class: aClass
		temporaries: aCollection
		additionals: #()
		variables: true
		selectors: true
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECUntypedModel class>>class: aClass temporaries: aCollection additionals: additionalCollection variables: variablesBoolean selectors: selectorsBoolean  [
	| newInstance |
	newInstance := self basicNew initialize.
	newInstance 
		setClass: aClass
		temporaries: aCollection
		additionals: additionalCollection
		variables: variablesBoolean
		selectors: selectorsBoolean.
	^ newInstance
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECUntypedModel>>addAdditionals: aCollection  [
	aCollection
		ifNotNil: [aCollection
				do: [:each | each isLocal
						ifTrue: [localVars add: each value]
						ifFalse: [each isInstance
								ifTrue: [instVars add: each value]
								ifFalse: [each isSelector
										ifTrue: [selectors add: each value]]]]]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECUntypedModel>>addSelectors [
	self initializeSelectors.
	self addToEntries: selectors
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECUntypedModel>>addVariables [
	includeVariables
		ifFalse: [^ self].
	self addToEntries: localVars.
	self addToEntries: instVars.
	self addToEntries: classVars
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECUntypedModel>>initialize [
	super initialize.
	localVars := SortedCollection new.
	instVars := SortedCollection new.
	classVars := SortedCollection new.
	includeSelectors := true.
	includeVariables := true.
	listLimit := 100.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECUntypedModel>>initializeClassVars [
	(clazz isNil or: [ includeVariables not ]) ifTrue: [ ^ self ].
	classVars := clazz theNonMetaClass allClassVarNames asSortedCollection.
	classVars := classVars collect: 
		[ :each | 
		NECClassVarEntry contents: each ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECUntypedModel>>initializeInstVars [
	(clazz isNil or: [ includeVariables not ]) ifTrue: [ ^ self ].
	instVars := clazz allInstVarNames asSortedCollection.
	instVars := instVars collect: 
		[ :each |  NECInstVarEntry contents: each ].
	instVars add: (NECSelfEntry 
			contents: 'self'
			type: #self).
	instVars add: (NECSuperEntry 
			contents: 'super'
			type: #super)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECUntypedModel>>initializeSelectors [
	self resetSelectors.
	
	includeSelectors ifFalse: 
		[ Smalltalk keysAndValuesDo: [ :each :class |
			(each includesSubstring: narrowString caseSensitive: NECPreferences caseSensitive) ifTrue: [
			selectors add: (NECGlobalEntry contents: each)] ].
		^ self ].
	narrowString ifEmpty: [ ^ self ].
	NECSymbols 
		contains: narrowString
		caseSensitive: NECPreferences caseSensitive
		do: [ :each | 
			(includeVariables or: [ each first isLowercase ]) ifTrue: 
				[ selectors add: (NECSelectorEntry 
						contents: each
						type: #selector).
				selectors size > self listLimit ifTrue: [ ^ self ]]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECUntypedModel>>listLimit [
	^ listLimit
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECUntypedModel>>listLimit: aNumber [
	listLimit := aNumber
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECUntypedModel>>loadEntries [
	self addVariables;
		addSelectors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECUntypedModel>>message [
	^ (includeSelectors and: [ narrowString isEmpty ]) 
		ifTrue: 
			[ selectors size = 500 
				ifTrue: [ 'more...' ]
				ifFalse: [ 'press key for selectors' ] ]
		ifFalse: [ super message ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECUntypedModel>>narrowString: aString  [
	(narrowString isEmpty
			or: [aString isEmpty
			or: [aString first ~= narrowString first]])
		ifTrue: [self reset].
	super narrowString: aString
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECUntypedModel>>narrowWith: aString  [
	self narrowString: aString.
	self resetEntries.
	self addVariables.
	self addSelectors
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECUntypedModel>>setClass: aClass temporaries: aCollection additionals: additionalCollection variables: variablesBoolean selectors: selectorsBoolean  [
	includeVariables := variablesBoolean.
	includeSelectors := selectorsBoolean.
	clazz := aClass.
	self initializeInstVars.
	self initializeClassVars.
	includeVariables 
		ifTrue: [ 
			localVars := aCollection.
			self addAdditionals: additionalCollection ]
		ifFalse: [ localVars := OrderedCollection new ].
	self resetEntries.
]
