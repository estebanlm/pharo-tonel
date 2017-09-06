"
Do not send requests to ""Smalltalk"" (which models the whole image)  that are related to the envionment of defines classes and globals
"
Class {
	#name : #RBSmalltalkGlobalsRule,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'MarcusDenker 8/14/2015 17:09'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalltalkGlobalsRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^ 'SmalltalkGlobalsRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalltalkGlobalsRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalltalkGlobalsRule>>initialize [
	super initialize.
	self rewriteRule
		replace: 'Smalltalk allClasses'
			with: 'Smalltalk globals allClasses';
		replace: 'Smalltalk allClassesDo: `@statements'
			with: 'Smalltalk globals allClassesDo: `@statements';
		replace: 'Smalltalk allTraits'
			with: 'Smalltalk globals allTraits';
		replace: 'Smalltalk includes:`@statements'
			with: 'Smalltalk globals includes: `@statements';
		replace: 'Smalltalk flushClassNameCache'
			with: 'Smalltalk globals flushClassNameCache';
		replace: 'Smalltalk includesKey: `@statements'
			with: 'Smalltalk globals includesKey: `@statements'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalltalkGlobalsRule>>name [
	^ 'Use "Smalltalk globals" instead of "Smalltalk"'
]
