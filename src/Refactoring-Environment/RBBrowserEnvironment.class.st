"
I am the base class for environments of the refactoring framework.

I define the common interface for all environments.
And I act as a factory for various specialized environments. See my 'environment' protocol.

I am used by different tools to create a 'views' of subsets of the whole system environment to browse or act on (searching/validations/refactoring)

create instances:
RBBrowserEnvironment new forClasses:  Number withAllSubclasses.
RBBrowserEnvironment new forPackageNames: { #Kernel }.

query:
|env|
env := RBBrowserEnvironment new forPackageNames: { #Kernel }.
env referencesTo:#asArray.
-> RBSelectorEnvironment.

browse:
|env|
env := RBBrowserEnvironment new forPackageNames: { #Kernel }.
(Smalltalk tools browser browsedEnvironment: env) open.

"
Class {
	#name : #RBBrowserEnvironment,
	#superclass : #Object,
	#instVars : [
		'label',
		'searchStrings'
	],
	#category : #Refactoring-Environment,
	#timestamp : 'NicolaiHess 4/27/2015 21:22'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment class>>default [
	^ RBBrowserEnvironment new
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>& anEnvironment  [
	"If we or anEnvironment includes everything, then just include the other environment (optimization)"

	self isSystem ifTrue: [^anEnvironment].
	anEnvironment isSystem ifTrue: [^self].
	^RBAndEnvironment onEnvironment: self and: anEnvironment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>addSearchString: aString  [
	searchStrings isNil ifTrue: [
		searchStrings := SortedCollection sortBlock: [ :a :b | 
			(a indexOf: $: ifAbsent: [ a size ]) > (b indexOf: $: ifAbsent: [ b size ]) ] ].
	(searchStrings includes: aString)
		ifFalse: [ searchStrings add: aString ]
]

{
	#category : #accessing-classes,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>allClasses [
	"Answer all the unique non-metaclasses of all the classes and metaclasses in this environment."

	| allClasses |
	allClasses := IdentitySet new: 4096.
	self classesDo: [ :each | 
		allClasses add: each theNonMetaClass].
	^ allClasses asArray
]

{
	#category : #accessing-classes,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>allClassesAndTraits [
	" compatibility method with SystemDictionary "
	
	| allClassesAndTraits |
	allClassesAndTraits := OrderedCollection new: 4096.
	self allClassesAndTraitsDo: [ :each | 
		allClassesAndTraits add: each ].
	^ allClassesAndTraits asArray
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>allClassesAndTraitsDo: aBlock [
	self systemDictionary allClassesAndTraitsDo: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>allClassesDo: aBlock [
	self systemDictionaryClassesDo: aBlock
]

{
	#category : #accessing-classes,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>allMetaClasses [
	"Answer all the unique non-metaclasses of all metaclasses in this environment."

	| allMetaClasses |
	allMetaClasses := OrderedCollection new: 4096.
	self
		classesDo: [ :each | 
			each isMeta
				ifTrue: [ allMetaClasses add: each theNonMetaClass ] ].
	^ allMetaClasses asArray
]

{
	#category : #accessing-classes,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>allNonMetaClasses [
	"Answer all the unique non-metaclasses of all of all the non-metaclasses in this environment."
	| allNonMetaClasses |
	allNonMetaClasses := OrderedCollection new: 4096.
	self
		classesDo: [ :each | 
			each isMeta
				ifFalse: [ allNonMetaClasses add: each  ] ].
	^ allNonMetaClasses asArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>asSelectorEnvironment [
	^(RBClassEnvironment onEnvironment: self classes: self classes) asSelectorEnvironment
]

{
	#category : #accessing-classes,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>associationAt: aKey [
	^ self associationAt: aKey ifAbsent: [ self error: aKey printString , ' not found' ]
]

{
	#category : #accessing-classes,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>associationAt: aKey ifAbsent: aBlock [
	| association class |
	association := self systemDictionary
		associationAt: aKey
		ifAbsent: [ ^ aBlock value ].
	class := association value isBehavior
		ifTrue: [ association value ]
		ifFalse: [ association value class ].
	^ ((self includesClass: class) or: [ self includesClass: class class ])
		ifTrue: [ association ]
		ifFalse: [ nil ]
]

{
	#category : #accessing-classes,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>at: aKey [
	^ self at: aKey ifAbsent: [ self error: aKey printString , ' not found' ]
]

{
	#category : #accessing-classes,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>at: aKey ifAbsent: aBlock [
	| association |
	association := self
		associationAt: aKey 
		ifAbsent: [ nil ].
	^ association isNil
		ifTrue: [ aBlock value ]
		ifFalse: [ association value ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>categories [
	^ self systemDictionary organization categories select: [ :each | self includesCategory: each ]
]

{
	#category : #accessing-classes,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>classNames [
	| names |
	names := IdentitySet new: 4096.
	self classesDo: [ :each | names add: each theNonMetaClass name ].
	^ names
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>classNamesFor: aCategoryName [
	^ (self systemDictionary organization listAtCategoryNamed: aCategoryName) select: [ :each |
		| class |
		class := self systemDictionary at: each ifAbsent: [ nil ].
		class notNil 
			and: [ (self includesClass: class)
			or: [ self includesClass: class class ] ] ]
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>classVarRefsTo: instVarName in: aClass  [
	^ RBVariableEnvironment 
		on: self
		referencesToClassVariable: instVarName
		in: aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>classVariablesFor: aClass  [
	^aClass classVarNames
]

{
	#category : #accessing-classes,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>classes [
	| classes |
	classes := IdentitySet new: 4096.
	self classesDo: [ :each | classes add: each ].
	^ classes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>classesAndSelectorsDo: aBlock  [
	self classesDo: [ :class | 
		self selectorsForClass: class do: [ :sel | 
			aBlock value: class value: sel ]]
]

{
	#category : #accessing-classes,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>classesAndTraits [
	
	| classesAndTraits |
	classesAndTraits := OrderedCollection new: 4096.
	self classesAndTraitsDo: [ :each | 
		classesAndTraits add: each ].
	^ classesAndTraits asArray
]

{
	#category : #accessing-classes,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>classesAndTraitsDo: aBlock  [
	self allClassesAndTraitsDo: [ :each |
		(self includesClass: each)
			ifTrue: [ aBlock value: each ] ]
]

{
	#category : #accessing-classes,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>classesDo: aBlock  [
	self systemDictionaryClassesDo: [ :each |
		(self includesClass: each)
			ifTrue: [aBlock value: each ] ]
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>copyEmpty [
	^ self class new
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>defaultLabel [
	^ 'Smalltalk'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>definesClass: aClass [
	^ true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>environment [
	^ self
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>forCategories: categoryList  [
	^RBCategoryEnvironment onEnvironment: self categories: categoryList
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>forClass: aClass protocols: protocolCollection  [
	^RBProtocolEnvironment onEnvironment: self
		class: aClass
		protocols: protocolCollection
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>forClass: aClass selectors: selectorCollection  [
	^(RBSelectorEnvironment 
		onMethods: selectorCollection
		forClass: aClass
		in: self)
		label: aClass name , '>>' 
					, (selectorCollection detect: [:each | true] ifNone: ['']);
		yourself
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>forClasses: classCollection  [
	| classes |
	classes := OrderedCollection new: classCollection size * 2.
	classCollection do: 
			[:each | 
			classes add: each theNonMetaClass;
				add: each theMetaClass].
	^RBClassEnvironment onEnvironment: self classes: classes
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>forPackageNames: aCollection [
	^ RBPackageEnvironment onEnvironment: self packageNames: aCollection
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>forPackages: aCollection [
	^ RBPackageEnvironment onEnvironment: self packages: aCollection
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>forPragmas: aKeywordCollection [
	^ RBPragmaEnvironment onEnvironment: self keywords: aKeywordCollection
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>implementorsMatching: aString  [
	^RBSelectorEnvironment implementorsMatching: aString in: self
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>implementorsOf: aSelector  [
	^RBSelectorEnvironment implementorsOf: aSelector in: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>includesCategory: aCategory [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>includesClass: aClass [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>includesMethod: aMethod [
	^ self 
		includesSelector: aMethod selector
		in: aMethod methodClass
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>includesPackage: packageName [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>includesProtocol: aProtocol in: aClass [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>includesSelector: aSelector in: aClass [
	^ true
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>instVarReadersTo: instVarName in: aClass  [
	^RBVariableEnvironment 
		on: self
		readersOfInstanceVariable: instVarName
		in: aClass
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>instVarRefsTo: instVarName in: aClass  [
	^RBVariableEnvironment 
		on: self
		referencesToInstanceVariable: instVarName
		in: aClass
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>instVarWritersTo: instVarName in: aClass  [
	^RBVariableEnvironment 
		on: self
		writersOfInstanceVariable: instVarName
		in: aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>instanceVariablesFor: aClass  [
	^aClass instVarNames
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>isClassEnvironment [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>isEmpty [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>isSelectorEnvironment [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>isSystem [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>isVariableEnvironment [
	^ false
]

{
	#category : #accessing-classes,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>keys [
	| keys |
	keys := Set new.
	self systemDictionary keysAndValuesDo: [ :key :value | 
		| class |
		value isBehavior ifTrue: [
			(self includesClass: value) 
				ifTrue: [ keys add: key ] ].
			class := value class.
			(self includesClass: class) 
				ifTrue: [ keys add: key ] ].
	^ keys
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>label [
	^ label isNil
		ifTrue: [ self defaultLabel ]
		ifFalse: [ label ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>label: aString [
	label := aString
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>matches: aString  [
	^RBSelectorEnvironment matches: aString in: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>methods [
	| methods |
	methods := IdentitySet new: 4096.
	self methodsDo: [ :each | methods add: each ].
	^ methods
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>methodsDo: aBlock [
	
	self classesDo: [ :aClass |
		
		self selectorsForClass: aClass do: [ :selector |
			aBlock value: (aClass >> selector) ].
		self selectorsForClass: aClass class do: [ :selector |
			aBlock value: (aClass class >> selector) ] ]
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>not [
	self isSystem ifTrue: [^RBSelectorEnvironment new].
	^RBNotEnvironment onEnvironment: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>numberClasses [
	^self classNames size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>numberSelectors [
	| total |
	total := 0.
	self selectorsDo: [:sel | total := total + 1 ].
	^total
]

{
	#category : #accessing-packages,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>packageAt: aName [
	^ self packageAt: aName ifAbsent: [ NotFound signalFor: aName in: self ]
]

{
	#category : #accessing-packages,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>packageAt: aName ifAbsent: absentBlock [
	| package |
	package := self packageOrganizer 
		packageNamed: aName ifAbsent: absentBlock.
	
	^ (self includesCategory: aName)
		ifTrue: [ package ]
		ifFalse: absentBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>packageOrganizer [

	^ RPackageOrganizer default
]

{
	#category : #accessing-packages,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>packages [

	^ self packageOrganizer packages
		select: [ :package |
			self includesCategory: package name ]
]

{
	#category : #accessing-packages,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>packagesWithContributors [
	"answer a list of all packages contributing to the definition of classes in the environment"
	^ self classes 
		flatCollect: #packages
		as: Set
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>printOn: aStream [
	aStream nextPutAll: self label
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>problemCount [
	^self numberSelectors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>protocolsFor: aClass [
	^aClass organization categories 
		select: [ :each | self includesProtocol: each in: aClass ]
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>referencesTo: aLiteral  [
	^RBSelectorEnvironment referencesTo: aLiteral in: self
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>referencesTo: aLiteral in: aClass  [
	| classes |
	classes := aClass withAllSuperclasses asSet.
	classes
		addAll: aClass allSubclasses;
		addAll: aClass class withAllSuperclasses;
		addAll: aClass class allSubclasses.
	^(self forClasses: classes) referencesTo: aLiteral
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>rootEnvironment [
	"The root environment representing everything."

	^ self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>searchStrings [
	^searchStrings isNil
		ifTrue: [#()]
		ifFalse: [searchStrings]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>searchStrings: aCollection  [
	searchStrings := aCollection
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>selectMethods: aBlock  [
	| env |
	env := RBSelectorEnvironment onEnvironment: self.
	self classesAndSelectorsDo: 
			[:each :sel | 
			(aBlock value: (each compiledMethodAt: sel)) 
				ifTrue: [env addClass: each selector: sel]].
	^env
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>selectionIntervalFor: aString  [
	| interval |
	self searchStrings isEmpty ifTrue: [^nil].
	interval := self selectionParseTreeIntervalFor: aString.
	interval notNil ifTrue: [^interval].
	self searchStrings do: 
			[:each | 
			| search index |
			search := each isSymbol ifTrue: [each keywords first] ifFalse: [each].
			index := aString indexOfSubCollection: search startingAt: 1.
			index > 0 ifTrue: [^index to: index + search size - 1]].
	^nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>selectionParseTreeIntervalFor: aString  [
	| parseTree answerBlock |
	parseTree := RBParser
		parseMethod: aString
		onError: [ :str :pos | ^ nil ].
	answerBlock := [ :aNode :answer | ^ aNode sourceInterval ].
	self searchStrings do: [ :each | 
		| matcher tree |
		matcher := RBParseTreeSearcher new.
		matcher matchesTree: (RBLiteralNode value: each) do: answerBlock.
		each isSymbol 
			ifTrue: [
				tree := RBParseTreeSearcher buildSelectorTree: each.
				tree notNil ifTrue: [ matcher matchesTree: tree do: answerBlock ] ]
			ifFalse: [
				tree := RBVariableNode named: each.
				matcher
					matchesTree: tree do: answerBlock;
					matchesArgumentTree: tree do: answerBlock ].
		matcher executeTree: parseTree ].
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>selectors [
	^ Array streamContents: [ :stream |
		self selectorsDo: [ :selector | 
			stream nextPut: selector ]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>selectorsDo: aBlock [
	self allClassesDo: [ :each | 
		self selectorsForClass: each do: aBlock ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>selectorsFor: aProtocol in: aClass [
	^(aClass organization listAtCategoryNamed: aProtocol)
		select: [:each | self includesSelector: each in: aClass]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>selectorsForClass: aClass  [
	| selectors |
	selectors := IdentitySet new.
	self selectorsForClass: aClass do: [ :each | selectors add: each ].
	^ selectors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>selectorsForClass: aClass do: aBlock  [
	aClass selectorsAndMethodsDo: 
			[:each :meth | 
			(self includesSelector: each in: aClass) ifTrue: [aBlock value: each]]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>storeOn: aStream  [
	aStream
		nextPutAll: self class name;
		nextPutAll: ' new'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>systemDictionary [
	"The root system dictionary as the source of all objects in this environment."

	^ Smalltalk globals
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>systemDictionaryClassesDo: aBlock [
	self systemDictionary allClassesDo:[:class |
		 aBlock value: class; value: class theMetaClass]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>whichCategoryIncludes: aClassName [
	^ self systemDictionary organization categoryOfElement: aClassName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>whichProtocolIncludes: aSelector in: aClass [
	^aClass organization categoryOfElement: aSelector ifAbsent: [ Protocol unclassified ]
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>withoutClasses: aListOfClasses [
	"Build the same environment without classes given as parameter"
	^ RBClassEnvironment 
			onEnvironment: self 
			classes: (self classes copyWithoutAll: aListOfClasses)
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironment>>| anEnvironment  [
	"If we or anEnvironment includes everything, then return it instead of creating 
	an or that will include everything."

	self isSystem ifTrue: [^self].
	anEnvironment isSystem ifTrue: [^anEnvironment].
	^ RBOrEnvironment onEnvironment: self or: anEnvironment
]
