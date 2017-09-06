"
I am a refactoring change for a class addition. Executing this change is just like an ordinary class definition by 
calling on ""my superclass"" (or ProtoObject) subclass:....instancevariable... etc.

"
Class {
	#name : #RBAddClassChange,
	#superclass : #RBRefactoryDefinitionChange,
	#instVars : [
		'superclassName',
		'instanceVariableNames',
		'classVariableNames',
		'poolDictionaryNames',
		'category'
	],
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/9/2016 20:34'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddClassChange class>>definitionPatterns [
	^ #('`@superclass subclass: `#className instanceVariableNames: `#instanceVariableNames classVariableNames: `#classVariableNames poolDictionaries: `#poolDictionaries category: `#category'
		'`@superclass subclass: `#className uses: `@traitComposition instanceVariableNames: `#instanceVariableNames classVariableNames: `#classVariableNames poolDictionaries: `#poolDictionaries category: `#category'
		'`@superclass variableByteSubclass: `#className instanceVariableNames: `#instanceVariableNames classVariableNames: `#classVariableNames poolDictionaries: `#poolDictionaries category: `#category'
		'`@superclass variableByteSubclass: `#className uses: `@traitComposition instanceVariableNames: `#instanceVariableNames classVariableNames: `#classVariableNames poolDictionaries: `#poolDictionaries category: `#category'
		'`@superclass variableSubclass: `#className instanceVariableNames: `#instanceVariableNames classVariableNames: `#classVariableNames poolDictionaries: `#poolDictionaries category: `#category'
		'`@superclass variableSubclass: `#className uses: `@traitComposition instanceVariableNames: `#instanceVariableNames classVariableNames: `#classVariableNames poolDictionaries: `#poolDictionaries category: `#category'
		'`@superclass variableWordSubclass: `#className instanceVariableNames: `#instanceVariableNames classVariableNames: `#classVariableNames poolDictionaries: `#poolDictionaries category: `#category'
		'`@superclass variableWordSubclass: `#className uses: `@traitComposition instanceVariableNames: `#instanceVariableNames classVariableNames: `#classVariableNames poolDictionaries: `#poolDictionaries category: `#category'
		'`@superclass weakSubclass: `#className instanceVariableNames: `#instanceVariableNames classVariableNames: `#classVariableNames poolDictionaries: `#poolDictionaries category: `#category'
		'`@superclass weakSubclass: `#className uses: `@traitComposition instanceVariableNames: `#instanceVariableNames classVariableNames: `#classVariableNames poolDictionaries: `#poolDictionaries category: `#category')
		flatCollect: [ :each | Array with: each with: (each copyReplaceAll: '`@superclass' with: 'ProtoObject') , '. `className superclass: `@superclass' ]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddClassChange>>asUndoOperation [
	| class |
	class := Smalltalk globals
		at: self changeClassName
		ifAbsent: [ nil ].
	^ class isBehavior
		ifTrue: [ RBRefactoryChangeManager changeFactory addClassDefinition: class definition ]
		ifFalse: [ RBRefactoryChangeManager changeFactory removeClassNamed: self changeClassName ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddClassChange>>category [
	^ category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddClassChange>>classVariableNames [
	^ classVariableNames
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddClassChange>>definitionClass [
	^ Smalltalk globals at: (self superclassName ifNil: [ ^ ProtoObject ])
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddClassChange>>fillOutDefinition: aDictionary [
	superclassName := (aDictionary at: '`@superclass')
		ifNotNil: [ :value | value asSymbol ].
	className := (aDictionary at: '`#className') asSymbol.
	instanceVariableNames := self namesIn: (aDictionary
		at: '`#instanceVariableNames'
		ifAbsent: [ String new ]).
	classVariableNames := self namesIn: (aDictionary
		at: '`#classVariableNames'
		ifAbsent: [ String new ]).
	poolDictionaryNames := self namesIn: (aDictionary
		at: '`#poolDictionaries'
		ifAbsent: [ String new ]).
	category := (aDictionary
		at: '`#category'
		ifAbsent: [ #Unclassified ])
			asSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddClassChange>>instanceVariableNames [
	^ instanceVariableNames
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddClassChange>>sharedPoolNames [
	^ poolDictionaryNames
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddClassChange>>superclassName [
	^ superclassName
]
