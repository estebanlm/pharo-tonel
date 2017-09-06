"
A MCClassDefinition represents a class.
"
Class {
	#name : #MCClassDefinition,
	#superclass : #MCDefinition,
	#instVars : [
		'name',
		'superclassName',
		'variables',
		'category',
		'type',
		'comment',
		'commentStamp',
		'traitComposition',
		'classTraitComposition'
	],
	#category : #Monticello-Modeling,
	#timestamp : '<historical>'
}

{
	#category : #obsolete,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition class>>name: nameString
superclassName: superclassString
category: categoryString 
instVarNames: ivarArray
classVarNames: cvarArray
poolDictionaryNames: poolArray
classInstVarNames: civarArray
comment: commentString [
	^ self	name: nameString
			superclassName: superclassString
			category: categoryString 
			instVarNames: ivarArray
			classVarNames: cvarArray
			poolDictionaryNames: poolArray
			classInstVarNames: civarArray
			type: #normal
			comment: commentString

]

{
	#category : #obsolete,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition class>>name: nameString
superclassName: superclassString
category: categoryString 
instVarNames: ivarArray
classVarNames: cvarArray
poolDictionaryNames: poolArray
classInstVarNames: civarArray
type: typeSymbol
comment: commentString [
	^ self 
		name: nameString
		superclassName: superclassString
		category: categoryString 
		instVarNames: ivarArray
		classVarNames: cvarArray
		poolDictionaryNames: poolArray
		classInstVarNames: civarArray
		type: typeSymbol
		comment: commentString
		commentStamp: nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition class>>name: nameString
superclassName: superclassString
category: categoryString 
instVarNames: ivarArray
classVarNames: cvarArray
poolDictionaryNames: poolArray
classInstVarNames: civarArray
type: typeSymbol
comment: commentString
commentStamp: stampString [
	^ self instanceLike:
		(self new initializeWithName: nameString
					superclassName: superclassString
					traitComposition: '{}'
					classTraitComposition: '{}'
					category: categoryString 
					instVarNames: ivarArray
					classVarNames: cvarArray
					poolDictionaryNames: poolArray
					classInstVarNames: civarArray
					type: typeSymbol
					comment: commentString
					commentStamp: stampString)
]

{
	#category : #obsolete,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition class>>name: nameString
superclassName: superclassString
category: categoryString 
instVarNames: ivarArray
comment: commentString [
	^ self	name: nameString
			superclassName: superclassString
			category: categoryString 
			instVarNames: ivarArray
			classVarNames: #()
			poolDictionaryNames: #()
			classInstVarNames: #()
			comment: commentString

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition class>>name: nameString
superclassName: superclassString
traitComposition: traitCompositionString
classTraitComposition: classTraitCompositionString
category: categoryString 
instVarNames: ivarArray
classVarNames: cvarArray
poolDictionaryNames: poolArray
classInstVarNames: civarArray
type: typeSymbol
comment: commentString
commentStamp: stampString [
	
	^ self instanceLike:
		(self new initializeWithName: nameString
					superclassName: superclassString
					traitComposition: traitCompositionString
					classTraitComposition: classTraitCompositionString
					category: categoryString 
					instVarNames: ivarArray
					classVarNames: cvarArray
					poolDictionaryNames: poolArray
					classInstVarNames: civarArray
					type: typeSymbol
					comment: commentString
					commentStamp: stampString)
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>= aDefinition [
	^(super = aDefinition)
		and: [superclassName = aDefinition superclassName
		and: [self traitCompositionString = aDefinition traitCompositionString
		and: [self classTraitCompositionString = aDefinition classTraitCompositionString
		and: [category = aDefinition category
		and: [type = aDefinition type
		and: [self sortedVariables = aDefinition sortedVariables
		and: [comment = aDefinition comment]]]]]]]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>accept: aVisitor [
	aVisitor visitClassDefinition: self.
	(self hasClassInstanceVariables or: [self hasClassTraitComposition])
		ifTrue: [aVisitor visitMetaclassDefinition: self].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>actualClass [
	^ Smalltalk globals classNamed: self className
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>addVariables: aCollection ofType: aClass [
	variables addAll: (aCollection collect: [:var | aClass name: var asString]).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>category [
	^ category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>classDefinitionString [
	"Answer a string describing the class-side definition."
	
	^String streamContents: [:stream | self printClassDefinitionOn: stream]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>classInstVarNames [
	^ self selectVariables: #isClassInstanceVariable
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>classInstanceVariables [
	^self usesSpecialVariables 
		ifTrue: [ self variablesOfType: #isClassInstanceVariable]
		ifFalse: [self classInstanceVariablesString asSlotCollection]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>classInstanceVariablesString [
	^ self stringForVariablesOfType: #isClassInstanceVariable
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>className [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>classTraitComposition [
	^classTraitComposition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>classTraitCompositionCompiled [
		^(Smalltalk compiler evaluate: self classTraitCompositionString) asTraitComposition 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>classTraitCompositionString [
	^self classTraitComposition ifNil: ['{}'].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>classVarNames [
	^(self selectVariables: #isClassVariable) asArray sort
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>classVariables [
	^self usesSpecialVariables 
		ifTrue: [self sortedVariablesOfType: #isClassVariable ]
		ifFalse: [(self classVariablesString substrings: ' ') collect: [:x | x asSymbol => ClassVariable]].

]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>classVariablesString [
	^ self stringForSortedVariablesOfType: #isClassVariable
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>comment [
	^ comment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>commentStamp [
	^ commentStamp
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>createClass [
	| superClass |
	"Ignore Context definition because of troubles with class migration on bootstrapped image. Temporary solution."
	name = #Context
		ifTrue: [ Context comment = comment 
						ifFalse: [ Context comment: comment stamp: commentStamp ].
					^ self ].
	superClass := superclassName == #nil
		ifFalse: [ Smalltalk globals at: superclassName ].
	^ [ PharoClassInstaller
		make: [ :builder | 
			builder
				superclass: superClass;
				name: name;
				layoutClass: (ObjectLayout layoutForType: type);
				slots: self instanceVariables;
				sharedVariables: self classVariables;
				sharedPools: self sharedPoolsString;
				classSlots: self classInstanceVariables;
				traitComposition: self traitCompositionCompiled;
				classTraitComposition: self classTraitCompositionCompiled;
				comment: comment stamp: commentStamp;
				category: category;
				environment: superClass environment ] ]
		on: Warning , DuplicatedVariableError
		do: [ :ex | ex resume ]
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>defaultCommentStamp [
	^ String new

	"The version below avoids stomping on stamps already in the image

	^ (Smalltalk globals at: name ifPresent: [:c | c organization commentStamp])
		ifNil: ['']
	"

]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>definitionString [
	^ String streamContents: [:stream | self printDefinitionOn: stream]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>description [
	^ Array with: name

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>hasClassInstanceVariables [
	^ (self selectVariables: #isClassInstanceVariable) isEmpty not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>hasClassTraitComposition [
	^self classTraitCompositionString ~= '{}'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>hasComment [
	^ comment isEmptyOrNil not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>hasTraitComposition [
	^self traitCompositionString ~= '{}'
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>hash [
	| hash |
	hash := String stringHash: name initialHash: 0.
	hash := String stringHash: superclassName initialHash: hash.
	hash := String stringHash: self traitCompositionString initialHash: hash.
	hash := String stringHash: self classTraitComposition asString initialHash: hash.
	hash := String stringHash: (category ifNil: ['']) initialHash: hash.
	hash := String stringHash: type initialHash: hash.
	variables do: [
		:v |
		hash := String stringHash: v name initialHash: hash.
	].
	^ hash
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>initializeWithName: nameString
superclassName: superclassString
category: categoryString 
instVarNames: ivarArray
classVarNames: cvarArray
poolDictionaryNames: poolArray
classInstVarNames: civarArray
type: typeSymbol
comment: commentString
commentStamp: stampStringOrNil [
	name := nameString asSymbol.
	superclassName := superclassString ifNil: ['nil'] ifNotNil: [superclassString asSymbol].
	category := categoryString.
	name = #CompiledMethod ifTrue: [type := #compiledMethod] ifFalse: [type := typeSymbol].
	comment := commentString withSqueakLineEndings.
	commentStamp := stampStringOrNil ifNil: [self defaultCommentStamp].
	variables := OrderedCollection  new.
	self addVariables: ivarArray ofType: MCInstanceVariableDefinition.
	self addVariables: cvarArray asSortedCollection ofType: MCClassVariableDefinition.
	self addVariables: poolArray asSortedCollection ofType: MCPoolImportDefinition.
	self addVariables: civarArray ofType: MCClassInstanceVariableDefinition.
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>initializeWithName: nameString
superclassName: superclassString
traitComposition: traitCompositionString
classTraitComposition: classTraitCompositionString
category: categoryString 
instVarNames: ivarArray
classVarNames: cvarArray
poolDictionaryNames: poolArray
classInstVarNames: civarArray
type: typeSymbol
comment: commentString
commentStamp: stampStringOrNil [
	name := nameString asSymbol.
	superclassName := superclassString ifNil: ['nil'] ifNotNil: [superclassString asSymbol].
	traitComposition := traitCompositionString.
	classTraitComposition := classTraitCompositionString.
	category := categoryString.
	name = #CompiledMethod ifTrue: [type := #compiledMethod] ifFalse: [type := typeSymbol].
	comment := commentString withSqueakLineEndings.
	commentStamp := stampStringOrNil ifNil: [self defaultCommentStamp].
	variables := OrderedCollection  new.
	self addVariables: ivarArray ofType: MCInstanceVariableDefinition.
	self addVariables: cvarArray asSortedCollection ofType: MCClassVariableDefinition.
	self addVariables: poolArray asSortedCollection ofType: MCPoolImportDefinition.
	self addVariables: civarArray ofType: MCClassInstanceVariableDefinition.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>instVarNames [
	^ self selectVariables: #isInstanceVariable
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>instanceVariables [
	^self usesSpecialVariables 
		ifTrue: [self variablesOfType: #isInstanceVariable]
		ifFalse: [self instanceVariablesString asSlotCollection]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>instanceVariablesString [
	^ self stringForVariablesOfType: #isInstanceVariable
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>isClassDefinition [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>isCodeDefinition [
	^ true
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>kindOfSubclass [
	type = #normal ifTrue: [^ ' subclass: '].
	type = #words ifTrue: [^ ' variableWordSubclass: '].
	type = #variable ifTrue: [^ ' variableSubclass: '].
	type = #bytes ifTrue: [^ ' variableByteSubclass: '].
	type = #weak ifTrue: [^ ' weakSubclass: ' ].
	type = #compiledMethod ifTrue: [^ ' variableByteSubclass: ' ].
	type = #immediate ifTrue: [ ^ ' immediateSubclass: ' ].
	type = #ephemeron ifTrue: [ ^ ' ephemeronSubclass: ' ].
	"hack to support user defined layouts"
	(Smalltalk hasClassNamed: type) ifTrue: [ ^type asString].
	self error: 'Unrecognized class type'
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>load [
	self createClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>poolDictionaries [
	^ self selectVariables: #isPoolImport
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>printAnnotations: requests on: aStream [
	"Add a string for an annotation pane, trying to fulfill the browser annotationRequests"

	requests do: [ :aRequest |
		aRequest == #requirements ifTrue: [
			self requirements do: [ :req | aStream nextPutAll: req ] separatedBy: [ aStream space ]]
	] separatedBy: [ aStream space ].
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>printClassDefinitionOn: stream [
	"Print a class-side definition of the receiver on the given stream.
	Class instance variables and class traits."
	
		stream
			nextPutAll: self className;
			nextPutAll: ' class';
			cr; tab.
		self hasClassTraitComposition ifTrue: [
			stream 
				nextPutAll: 'uses: ';
		 		nextPutAll: self classTraitCompositionString;
				cr; tab ].
		stream
			nextPutAll: 'instanceVariableNames: ';
			store: self classInstanceVariablesString
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>printDefinitionOn: stream [
		stream 
			nextPutAll: self superclassName;
			nextPutAll: self kindOfSubclass;
			nextPut: $# ;
			nextPutAll: self className;
			cr; tab.
		self hasTraitComposition ifTrue: [
			stream 
				nextPutAll: 'uses: ';
		 		nextPutAll: self traitCompositionString;
				cr; tab ].
		stream
			nextPutAll: 'instanceVariableNames: ';
			store: self instanceVariablesString;
			cr; tab;
			nextPutAll: 'classVariableNames: ';
			store: self classVariablesString;
			cr; tab;
			nextPutAll: 'poolDictionaries: ';
			store: self sharedPoolsString;
			cr; tab;
			nextPutAll: 'category: ';
			store: self category asString
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>printMetaDefinitionOn: stream [
	stream 
		nextPutAll: self className;
		nextPutAll: ' class'; cr; tab.
	self hasClassTraitComposition ifTrue: [
		stream
			nextPutAll: 'uses: ';
			nextPutAll: self classTraitCompositionString;
			cr; tab ].
	stream
		nextPutAll: ' instanceVariableNames: '; 
		store: self classInstanceVariablesString
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>provisions [
	^ Array with: name
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>requirements [
	^ ((superclassName == #nil) or: [superclassName asString beginsWith: 'AnObsolete'])
		ifTrue: [self poolDictionaries]
		ifFalse: [(Array with: superclassName), self poolDictionaries]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>selectVariables: aSelector [
	^ variables select: [:v | v perform: aSelector] thenCollect: [:v | v name]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>sharedPoolsString [
	^ self stringForSortedVariablesOfType: #isPoolImport
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>sortKey [
	^ self className
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>sortedVariables [
	"sort variables for comparison purposes"

	| sorted |
	sorted := variables select: [:var | var isOrderDependend].
	sorted addAll: ((variables reject: [:var | var isOrderDependend])
		asSortedCollection: [:a :b | a name <= b name]).
	^sorted
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>sortedVariablesOfType: aSymbol [
	"version for complex vars, { definition . definition }"
	^(((self selectVariables: aSymbol) asSortedCollection collect: [:each | Smalltalk compiler evaluate: each])) asArray.
		
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>source [
	^ self definitionString
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>storeDataOn: aDataStream [
	| instVarSize |
	instVarSize := (self hasTraitComposition or: [ self hasClassTraitComposition ])
		ifTrue: [ self class instSize ]
		ifFalse: [ self class instSize - 2 ].
	aDataStream
		beginInstance: self class
		size: instVarSize.
	1 to: instVarSize do: [ :index |
		aDataStream nextPut: (self instVarAt: index) ].
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>stringForSortedVariablesOfType: aSymbol [
	^ String streamContents:
		[:stream |
		(self selectVariables: aSymbol) asSortedCollection
			do: [:ea | stream nextPutAll: ea]
			separatedBy: [stream space]]
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>stringForVariablesOfType: aSymbol [
	^ String streamContents:
		[:stream |
		(self selectVariables: aSymbol) 
			do: [:ea | stream nextPutAll: ea]
			separatedBy: [stream space]]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>summary [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>superclassName [
	^ superclassName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>traitComposition [
	^traitComposition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>traitCompositionCompiled [
	^(Smalltalk compiler evaluate: self traitCompositionString) asTraitComposition 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>traitCompositionString [
	^self traitComposition ifNil: ['{}'].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>type [
	^ type
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>unload [
	Smalltalk globals removeClassNamed: name
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>usesSpecialVariables [
	"this checks if any ivar or class var is using more than just standard definitions.
	Complex vars are encoded with a string that starts with a # or one that has a space"
	
	^self variables anySatisfy: [:var | (var name beginsWith:'#') or: [ var name includes: Character space ]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>variables [
	^ variables
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassDefinition>>variablesOfType: aSymbol [
	"version for complex vars, { definition . definition }"
	^(((self selectVariables: aSymbol) collect: [:each | Smalltalk compiler evaluate: each])) asArray.
		
]
