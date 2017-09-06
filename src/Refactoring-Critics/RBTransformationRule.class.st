"
A RBTransformationRule is a special rule that not only detects problems but also can automatically transform the good.
"
Class {
	#name : #RBTransformationRule,
	#superclass : #RBLintRule,
	#instVars : [
		'rewriteRule',
		'builder',
		'class'
	],
	#classVars : [
		'RecursiveSelfRule'
	],
	#category : #Refactoring-Critics,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule class>>checksMethod [
	^ true
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule class>>cleanUp [
	RecursiveSelfRule := nil.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule class>>initialize [
	self initializeRecursiveSelfRule
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule class>>initializeRecursiveSelfRule [
	RecursiveSelfRule := RBParseTreeSearcher new.
	RecursiveSelfRule 
		matchesAnyMethodOf: #(
			'`@methodName: `@args | `@temps | self `@methodName: `@args1' 
			'`@methodName: `@args | `@temps | ^ self `@methodName: `@args1')
		do: [ :node :answer | true ].
	^ RecursiveSelfRule
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule class>>isVisible [
	^ self name ~= #RBTransformationRule
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule class>>recursiveSelfRule [
	^ RecursiveSelfRule ifNil: [ self initializeRecursiveSelfRule ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'TransformationRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule>>basicCheck: aMethod  [
	aMethod isFromTrait
		ifTrue: [ ^ false ].
	(self rewriteRule canMatchMethod: aMethod) 
		ifFalse: [ ^ false ].
	class := aMethod methodClass.
	^ (self rewriteRule executeTree: aMethod ast copy) and: [
	  (self class recursiveSelfRule
			executeTree: rewriteRule tree
			initialAnswer: false) not ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule>>builder [
	^ builder
		ifNil: [ 
			self resetResult.
			builder ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule>>changes [
	^ self builder changes
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule>>checkMethod: aMethod  [
	(self basicCheck: aMethod) ifTrue: [
		self builder compile: rewriteRule tree newSource in: class classified: aMethod protocol ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule>>hasConflicts [
	^ true
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule>>initialize [
	super initialize.
	rewriteRule := RBParseTreeRewriter new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule>>isEmpty [
	^ self builder changes isEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule>>isTransformationRule [

	^ true 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule>>name [

	^ 'Code Rewriting'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule>>problemCount [
	^ self builder problemCount
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule>>resetResult [
	builder := RBRefactoryChangeManager changeFactory compositeRefactoryChangeNamed: self name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule>>result [
	| environment |
	environment := RBParseTreeEnvironment new.
	environment matcher: self rewriteRule.
	environment label: self name.
	self changes do: [ :change |
		(change isKindOf: RBAddMethodChange)
			ifTrue: [ environment addClass: change changeClass selector: change selector ] ].
	^ environment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule>>rewriteRule [
	^ rewriteRule
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTransformationRule>>rewriteRule: aRule [

	rewriteRule := aRule
]
