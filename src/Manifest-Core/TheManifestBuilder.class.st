"
I'm a tool to build manifest that handles small lint false positive and other information.

My name is strange but this is to avoid to match with a Manifest class which is recognized because it starts with Manifest*.

"
Class {
	#name : #TheManifestBuilder,
	#superclass : #AbstractTool,
	#instVars : [
		'manifestClass'
	],
	#category : #Manifest-Core,
	#timestamp : 'StephaneDucasse 1/6/2014 20:52'
}

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder class>>allManifestClasses [

	^ PackageManifest subclasses
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder class>>falsePositiveBeginningTag [
	"the string that identifies uniquely the beginning of a selector who give  the set of false positive for a rule"
	
	^ 'rule'
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder class>>falsePositiveEndTag [
	"the string that identifies uniquely the end of a selector who give  the set of false positive for a rule"
	
	^ 'FalsePositive'
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder class>>falsePositiveMiddleTag [
	"the string that identifies uniquely the middle of a selector who give  the set of false positive for a rule"
	
	^ 'V'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder class>>hasManifestFor: aItem [

	^  (self new manifestOf: aItem) isNil not
		
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder class>>hasPackageNamed: aPackageName [

	^ self allManifestClasses 
		anySatisfy: [:each | each category = aPackageName  ]
	
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder class>>manifestClassComment [
	
	^ 'I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser'
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder class>>manifestTag [
	"the string that identifies uniquely the beginning of a Manifest class name"
	
	^ 'Manifest'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder class>>of: aItem [
	| mb  |

	mb := self new. 
	(mb manifestOf: aItem) 
			ifNil: [mb createManifestOf: aItem].	
	^ mb	

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder class>>ofPackageNamed: aPackageName [
	| builder |
	builder := self new.
	self allManifestClasses
		detect: [ :each | each category = aPackageName ]
		ifFound: [ :manifestClass | builder manifestClass: manifestClass ]
		ifNone: [ builder createManifestNamed: aPackageName ].
	^ builder
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder class>>rejectClassesTag [
	"the string that identifies uniquely the beginning of a selector who give  the set of rejected classes"
	
	^ 'rejectClasses'
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder class>>rejectRulesTag [
	"the string that identifies uniquely the beginning of a selector who give  the set of rejected rules"
	
	^ 'rejectRules'
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder class>>toDoBeginningTag [
	"the string that identifies uniquely the beginning of a selector who give  the set of TODO for a rule"
	
	^ 'rule'
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder class>>toDoEndTag [
	"the string that identifies uniquely the end of a selector who give  the set of TODO for a rule"
	
	^ 'TODO'
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder class>>toDoMiddleTag [
	"the string that identifies uniquely the middle of a selector who give  the set of TODO for a rule"
	
	^ 'V'
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder class>>truePositiveEndTag [
	"the string that identifies uniquely the end of a selector who give  the set of false positive for a rule"
	
	^ 'TruePositive'
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>= aObject [

	^ aObject class = self class and: [ self manifest = aObject manifest ]
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>addAllFalsePositive: fp of: ruleId version: versionId [

	| selector  |	
	selector := self selectorFalsePositiveOf: ruleId version: versionId. 
	self addAllItem: fp selector: selector.
	fp do: [:each |
		 (self containsToDo: each onRule: ruleId version: versionId)
		ifTrue: [ self removeToDo: each of:  ruleId version: versionId ]]
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>addAllItem: aSet selector: selector [
	| set newSet arrayString |
	set := (self manifest perform: selector) asOrderedCollection.
	newSet := aSet \ (self unwrap: set).
	newSet isEmpty
		ifTrue: [ ^ self ].
	set addAll:
			(newSet
				collect: [ :fp | 
					{(fp asRingDefinition arrayStringForManifest).
					(DateAndTime current asString)} ]).
	arrayString := self buildArrayString: set.
	self compileSelector: selector returnValue: arrayString
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>addAllToDo: aSet of: ruleId version: versionId [

	| selector |
	selector := self selectorToDoOf: ruleId version: versionId. 
	self addAllItem: aSet selector: selector. 
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>addFalsePositive: fp of: ruleId version: versionId [

	| selector |
	selector := self selectorFalsePositiveOf: ruleId version: versionId. 
	self addItem: fp selector: selector.	
	(self containsToDo: fp onRule: ruleId version: versionId)
		ifTrue: [self removeToDo: fp of:  ruleId version: versionId]. 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>addItem: fp selector: selector [
	self addAllItem: {fp} selector: selector
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>addRejectClass: aClass [

	|  falsePositives |
	falsePositives := self manifest rejectClasses asOrderedCollection .
	((self unwrap: falsePositives) anySatisfy: [:each | each = aClass])
		ifTrue: [ ^ self ].
	falsePositives add: {aClass asRingDefinition arrayStringForManifest. DateAndTime current asString}.
	self compileSelector:  (self class rejectClassesTag) returnValue: (self buildArrayString: falsePositives)
	
	
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>addRejectRule: ruleId  [

	|  nfp |	
	nfp := self manifest rejectRules asSet.
	nfp add: ruleId.
	nfp := nfp asArray.
	self compileSelector: (self class rejectRulesTag) returnValue: nfp asString

]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>addToDo: fp of: ruleId version: versionId [

	| selector |	
	selector := self selectorToDoOf: ruleId version: versionId. 
	self addItem: fp selector: selector.
	(self containsFalsePositive: fp onRule: ruleId version: versionId)
		ifTrue: [ self removeFalsePositive: fp of:  ruleId version: versionId ]
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>addTruePositive: fp of: ruleId version: versionId [

	| selector  |	
	selector := self selectorTruePositiveOf: ruleId version: versionId. 
	self addItem: fp selector: selector.
	(self containsToDo: fp onRule: ruleId version: versionId)
		ifTrue: [ self removeToDo: fp of:  ruleId version: versionId ]. 
	(self containsFalsePositive: fp onRule: ruleId version: versionId)
		ifTrue: [ self removeFalsePositive: fp of:  ruleId version: versionId ]

	
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>browsedEnvironment [
	^manifestClass environment 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>buildArrayString: aCollection [
	
	^ String streamContents: [:stream | 
		stream << '#('.
		aCollection do: [:each |  
			stream  nextPutAll: '#('.
			stream nextPutAll: each first printString.
			stream  nextPutAll: ' '.
			stream nextPutAll: (each at: 2) asSymbol  printString.
			stream  nextPutAll: ') '.].
		stream << ')']
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>cleanUp [

	| tagfp |
	tagfp := self class falsePositiveBeginningTag.
	self manifest class methodsDo: [ :method |
		(method selector asString beginsWith: tagfp)
				ifTrue: [self removeObsoleteFalsePositiveOf: method] ]
	
	



]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>compileSelector: selector returnValue: aLiteral [
	self 
		compileSelector: selector
		returnValue: aLiteral
		classified: 'code-critics'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>compileSelector: selector returnValue: aLiteral classified: aProtocolName [
	| source |
	source := String streamContents: [ :stream | 
		stream 
			nextPutAll: selector asString;
			nextPut: Character cr;
			nextPut: Character tab;
			nextPutAll: '^ ';
			nextPutAll: aLiteral ].
	manifestClass class
		compile: source
		classified: aProtocolName
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>containsFalsePositive: aItem onRule: ruleId version: versionId [

	^  (self hasFalsePositiveOf: ruleId version: versionId) 
			and: [ (self falsePositiveOf: ruleId version: versionId) anySatisfy: [ :fp | fp = aItem ]] 
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>containsRejectedClass: aClass [
	
	^ self rejectClasses anySatisfy: [ :cl | cl = aClass ]
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>containsRejectedRule: aRuleId [
	
	^ self rejectRules anySatisfy: [ :fp | fp = aRuleId ]
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>containsToDo: aItem onRule: ruleId version: versionId [

	^  (self hasToDoOf: ruleId version: versionId) 
		and: [(self toDoOf: ruleId version: versionId) 
			anySatisfy: [ :fp| fp = aItem ]] 
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>containsTruePositive: aItem onRule: ruleId version: versionId [

	^  (self hasTruePositiveOf: ruleId version: versionId) 
		and: [(self truePositiveOf: ruleId version: versionId) anySatisfy: [ :fp| fp = aItem ]] 
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>createManifestNamed: packageName [

	 manifestClass := PackageManifest subclass: (self class manifestTag, packageName onlyLetters) asSymbol
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: packageName.
	manifestClass comment: self class manifestClassComment.
	^ manifestClass
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>createManifestOf: elem [

	self createManifestNamed: (self packageNameOf: elem).
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>dateOf: ringobject forSelector: aSelector [

	| critics |

	critics := self manifest perform: aSelector.
	^ ((critics detect: [:each | ((self browsedEnvironment at: each first first) manifestReadOn: (each first at: 2)) = ringobject ]) at: 2) asDateAndTime
		
		
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>dateOfFalsePositive: aItem onRule: ruleId version: versionId [

	(self hasFalsePositiveOf: ruleId version: versionId)
		ifFalse: [^ self].
		
	^ self dateOf: ( aItem asRingDefinition) forSelector:  (self selectorFalsePositiveOf: ruleId version: versionId)
		
		
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>dateOfToDo: aItem onRule: ruleId version: versionId [
	
	 (self hasToDoOf: ruleId version: versionId)
		ifFalse: [^ self].
	^ self dateOf: ( aItem asRingDefinition) forSelector:  (self selectorToDoOf: ruleId version: versionId)
		
		
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>dateOfTruePositive: aItem onRule: ruleId version: versionId [

	(self hasTruePositiveOf: ruleId version: versionId)
		ifFalse: [^ self].
	^ self dateOf: ( aItem asRingDefinition) forSelector:  (self selectorTruePositiveOf: ruleId version: versionId)
		
		
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>falsePositiveOf: ruleId version: versionId  [

	^ self unwrap: (self manifest perform: (self selectorFalsePositiveOf: ruleId version: versionId))
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>hasFalsePositiveOf: ruleId version: versionId [
	^ self manifest respondsTo: (self selectorFalsePositiveOf: ruleId version: versionId)
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>hasToDoOf: ruleId version: versionId [
	^ self manifest respondsTo: (self selectorToDoOf: ruleId version: versionId)  
	
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>hasTruePositiveOf: ruleId version: versionId [
	^ self manifest respondsTo: (self selectorTruePositiveOf: ruleId version: versionId)  
	
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>hash [
	^ manifestClass hash bitXor: self class hash
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>installFalsePositiveOf: ruleId version: versionId [

	self compileSelector: (self selectorFalsePositiveOf: ruleId version: versionId) returnValue: '#()'

]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>installToDoOf: ruleId version: versionId [

	self compileSelector: (self selectorToDoOf: ruleId version: versionId) returnValue: '#()'

]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>installTruePositiveOf: ruleId version: versionId [
	
	self compileSelector: (self selectorTruePositiveOf: ruleId version: versionId) returnValue: '#()'

]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>isFalsePositive: anItem onRule: ruleId version: versionId [
	
	^ ((self containsFalsePositive: anItem onRule: ruleId version: versionId) or:
			[(self containsRejectedRule: ruleId) or:
				[(anItem class = RPackage) not and: [self containsRejectedClass: anItem criticClass]]])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>manifest [
	^ manifestClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>manifestClass: aClass [
	 manifestClass := aClass
		

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>manifestOf: elem [

	^ manifestClass := elem package ifNotNil: #packageManifestOrNil 

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>packageNameOf: elem [
	^ elem package name
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>printOn: aStream [

	aStream
		nextPutAll: 'ManifestBuilder of ';
		nextPutAll: manifestClass printString.
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>rejectClasses [
	^ self unwrap: (self manifest rejectClasses)

]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>rejectRules [
	^ self manifest rejectRules
	

]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>removeAllFalsePositive: aSet of: ruleId version: versionId [

	| selector |
	selector := self selectorFalsePositiveOf:ruleId version: versionId. 
	self removeAllItem: aSet selector: selector.
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>removeAllItem: aSet selector: selector [
	| set arrayString |
	set := (self manifest perform: selector) asOrderedCollection.
	set := set
		reject: [ :each | 
			| tmp |
			tmp := (self browsedEnvironment at: each first first) manifestReadOn: (each first at: 2).
			aSet anySatisfy: [ :fp | tmp = fp asRingDefinition ] ].
	arrayString := self buildArrayString: set.
	self compileSelector: selector returnValue: arrayString
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>removeAllManifest [
 
	self removeClasses: (self class allManifestClasses)
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>removeAllToDo: fp of: ruleId version: versionId [
	
	| selector |
	selector := self selectorToDoOf: ruleId version: versionId. 
	self removeAllItem: fp selector: selector.
	
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>removeFalsePositive: fp of: ruleId version: versionId [
	
	| selector |
	selector := self selectorFalsePositiveOf: ruleId version: versionId. 
	self removeItem: fp selector: selector.
	
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>removeItem: fp selector: selector [
	self removeAllItem: {fp} selector: selector
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>removeManifestOf: aItem [
	
	(self manifestOf: aItem) ifNotNil: [ :myManifest | 
			self removeClass: myManifest  ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>removeObsoleteFalsePositiveOf: aMethod [

	| set arrayString  |
	set := (self manifest perform: aMethod selector) asOrderedCollection.
	set := set select: [ :each | ((self browsedEnvironment at: each first first) manifestReadOn:  (each first at: 2)) isDefined ].
	arrayString := self buildArrayString: set.
	self compileSelector: aMethod selector returnValue: arrayString
	
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>removeRejectClass: aClass [

	|  classes |
	classes :=  self manifest rejectClasses asOrderedCollection.
	classes := classes reject: [ :each | 
			((self browsedEnvironment at: each first first) manifestReadOn:  (each first at: 2)) =  aClass asRingDefinition ].	
	self compileSelector: (self class rejectClassesTag) returnValue:  (self buildArrayString: classes)
	
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>removeRejectRule: ruleId  [

	|  nfp |	
	nfp := self manifest rejectRules asOrderedCollection.
	nfp remove: ruleId ifAbsent: [^ self].
	nfp := nfp asArray.
	self compileSelector: (self class rejectRulesTag) returnValue:   nfp asString

	
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>removeToDo: fp of: ruleId version: versionId [
	
	| selector |
	selector := self selectorToDoOf:ruleId version: versionId. 
	self removeItem: fp selector: selector.
	
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>resetFalsePositiveOf: ruleId version: versionId [
 
	self  installFalsePositiveOf: ruleId version: versionId. 
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>resetToDoOf: ruleId version: versionId [
 	
	self installToDoOf: ruleId version: versionId. 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>selectorFalsePositiveOf: ruleId version: versionId [

	^ (self class falsePositiveBeginningTag, ruleId,
		self class falsePositiveMiddleTag, versionId asString,
		self class falsePositiveEndTag) 
			asSymbol.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>selectorToDoOf: ruleId version: versionId [

	^ (self class toDoBeginningTag, ruleId ,
		self class toDoMiddleTag, versionId asString,
		self class toDoEndTag) asSymbol.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>selectorTruePositiveOf: ruleId version: versionId [

	^ (self class falsePositiveBeginningTag, ruleId ,
		self class falsePositiveMiddleTag, versionId asString,
		self class truePositiveEndTag) 
		asSymbol.
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>toDoOf: ruleId version: versionId  [

	^ self unwrap: (self manifest perform: (self selectorToDoOf: ruleId version: versionId))
]

{
	#category : #manifest,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>truePositiveOf: ruleId version: versionId  [

	^ self unwrap: (self manifest perform: (self selectorTruePositiveOf: ruleId version: versionId))
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:30'
}
TheManifestBuilder>>unwrap: aCollection [

	| unwrapCollection rgobject |
	
	unwrapCollection := OrderedCollection new.
	aCollection
		do: [ :each | 
			rgobject := (self browsedEnvironment at: each first first) manifestReadOn:  (each first at: 2).
			(rgobject isClass and: [ rgobject  realClass notNil ])
				ifTrue: [ unwrapCollection add: rgobject realClass ].
			(rgobject isMethod and: [ rgobject method notNil ])
				ifTrue: [ unwrapCollection add: rgobject method ].
			(rgobject isPackage and: [ rgobject realPackage notNil ])
				ifTrue: [ unwrapCollection add: rgobject realPackage ] ].
	^ unwrapCollection
]
