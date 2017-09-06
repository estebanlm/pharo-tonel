"
I am a RBBrowserEnvironment on a set of Pragmas.
I containt all entities that define methods using this pragmas.
Example:
(RBBrowserEnvironment new) forPragmas:{ #primitive:}.
"
Class {
	#name : #RBPragmaEnvironment,
	#superclass : #RBBrowserEnvironmentWrapper,
	#instVars : [
		'keywords',
		'condition'
	],
	#category : #Refactoring-Environment,
	#timestamp : 'NicolaiHess 4/27/2015 21:23'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPragmaEnvironment class>>keywords: aKeywordCollection [
	^ self
		onEnvironment: self default
		keywords: aKeywordCollection
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPragmaEnvironment class>>onEnvironment: anEnvironment keywords: aKeywordCollection [
	^ (self onEnvironment: anEnvironment)
		keywords: aKeywordCollection;
		yourself
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPragmaEnvironment>>addKeyword: aSymbol [
	keywords add: aSymbol
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPragmaEnvironment>>condition: aBlock [
	condition := aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPragmaEnvironment>>defaultLabel [
	| stream |
	stream := String new writeStream.
	keywords do: [ :each | stream nextPut: $<; nextPutAll: each; nextPut: $>; nextPut: $ ].
	^ stream contents
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPragmaEnvironment>>definesClass: aClass [
	^ environment definesClass: aClass
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPragmaEnvironment>>includesCategory: aCategory [
	^ (environment includesCategory: aCategory) and: [ (self classNamesFor: aCategory) notEmpty ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPragmaEnvironment>>includesClass: aClass [
	^ (environment includesClass: aClass) and: [ aClass selectors anySatisfy: [ :each | self includesSelector: each in: aClass ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPragmaEnvironment>>includesPragma: aPragma [
	^ (keywords includes: aPragma keyword) and: [ condition value: aPragma ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPragmaEnvironment>>includesProtocol: aProtocol in: aClass [
	^ (environment includesProtocol: aProtocol in: aClass) and: [ (self selectorsFor: aProtocol in: aClass) notEmpty ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPragmaEnvironment>>includesSelector: aSelector in: aClass [
	(environment includesSelector: aSelector in: aClass)
		ifFalse: [ ^ false ].
	^ (aClass compiledMethodAt: aSelector) pragmas
		anySatisfy: [ :each | self includesPragma: each ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPragmaEnvironment>>initialize [
	super initialize.
	keywords := IdentitySet new.
	condition := [ :pragma | true ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPragmaEnvironment>>keywords: aCollection [
	keywords addAll: aCollection
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPragmaEnvironment>>packages [
	^ (self methods collect: #package) asSet
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPragmaEnvironment>>postCopy [
	super postCopy.
	keywords := keywords copy
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPragmaEnvironment>>storeOn: aStream [
	aStream nextPut: $(.
	super storeOn: aStream.
	aStream nextPutAll: ' keywords: '.
	keywords asArray storeOn: aStream.
	aStream nextPut: $)
]
