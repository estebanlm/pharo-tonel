"
I am the baseclass for a ""class definition change"", a change that will create a class or modify the definition of an existing class.
I hold the class definition string and a controller used by the compiler when compiling the class definition for notifying about the
compilation result. My subclass define the kind of class definition I can add, a class, a metaclass a trait or a class trait.

My instance variable ""definedClass"" is the new class object.
"
Class {
	#name : #RBRefactoryDefinitionChange,
	#superclass : #RBRefactoryClassChange,
	#instVars : [
		'controller',
		'definition',
		'definedClass'
	],
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/9/2016 20:32'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryDefinitionChange class>>definition: aString [
	^ self definition: aString for: nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryDefinitionChange class>>definition: aString for: aController [
	| parseTree context |
	parseTree := RBParser
		parseExpression: aString
		onError: [ :err :pos | ^ self error: 'Invalid definition string' ].
	context := SmallDictionary new.
	RBRefactoryDefinitionChange allSubclassesDo: [ :class |
		class definitionPatterns do: [ :pattern |
			((RBParser parseRewriteExpression: pattern) match: parseTree inContext: context empty)
			 	ifTrue: [ ^ class definition: aString for: aController context: context ] ] ].
	^ self error: 'Invalid definition string'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryDefinitionChange class>>definition: aString for: aController context: aDictionary [
	| dictionary |
	dictionary := SmallDictionary new.
	aDictionary keysAndValuesDo: [ :key :node |
		dictionary at: key formattedCode put: (node isVariable
			ifTrue: [ node name ]
			ifFalse: [ 
				node isLiteralNode
					ifTrue: [ node value ]
					ifFalse: [ node ] ]) ].
	^ self new
		definition: aString controller: aController;
		fillOutDefinition: dictionary;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryDefinitionChange class>>definitionPatterns [
	self subclassResponsibility
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryDefinitionChange>>= aDefinitionChange [
	^ self class = aDefinitionChange class
		and: [ self definition = aDefinitionChange definition ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryDefinitionChange>>changeString [
	^ 'Define ' , self displayClassName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryDefinitionChange>>controller [
	^ controller
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryDefinitionChange>>definedClass [
	^ definedClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryDefinitionChange>>definition [
	^ definition
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryDefinitionChange>>definition: aString controller: aController [
	isMeta := false.
	definition := aString.
	controller := aController
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryDefinitionChange>>definitionClass [
	self subclassResponsibility
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryDefinitionChange>>fillOutDefinition: aDictionary [
	self subclassResponsibility
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryDefinitionChange>>hash [
	^ definition hash
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryDefinitionChange>>namesIn: aString [
	| names scanner token |
	names := OrderedCollection new.
	scanner := RBScanner
		on: (ReadStream on: aString)
		errorBlock: [ :msg :pos | ^ names ].
	[ scanner atEnd ] whileFalse: [
		token := scanner next.
		token isIdentifier
			ifTrue: [ names add: token value ] ].
	^ names asArray
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryDefinitionChange>>primitiveExecute [
	definedClass := self definitionClass compiler
		source: self definition;
		requestor: self controller;
		logged: true;
		evaluate
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryDefinitionChange>>printOn: aStream  [
	aStream
		nextPutAll: definition;
		nextPut: $!
]
