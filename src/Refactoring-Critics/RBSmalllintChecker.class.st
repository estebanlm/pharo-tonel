"
I apply a lint rule to all classes and methods in a given environment.

My main API is 

- ==run== which resets and runs the rules.
"
Class {
	#name : #RBSmalllintChecker,
	#superclass : #Object,
	#instVars : [
		'rule',
		'environment',
		'context',
		'methodBlock'
	],
	#category : #Refactoring-Critics,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintChecker class>>newWithContext [
	^(self new)
		context: RBSmalllintContext new;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintChecker class>>runRule: aLintRule [
	(self new)
		rule: aLintRule;
		run.
	^aLintRule
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintChecker class>>runRule: aLintRule onEnvironment: aBrowserEnvironment [
	aLintRule resetResult.
	(self new)
		rule: aLintRule;
		environment: aBrowserEnvironment;
		run.
	^aLintRule
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintChecker>>checkClass: aClass  [
	(environment includesClass: aClass) ifTrue: [rule checkClass: aClass]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintChecker>>checkMethodsForClass: aClass [
	^ environment
		selectorsForClass: aClass
		do: [ :each | 
			rule checkMethod: aClass>>each.
			methodBlock value ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintChecker>>checkPackage: aRPackage [
	(environment includesPackage: aRPackage) 
		ifTrue: [rule checkPackage: aRPackage]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintChecker>>context: aSmalllintContext  [
	context := aSmalllintContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintChecker>>environment: aBrowserEnvironment  [
	environment := aBrowserEnvironment
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintChecker>>initialize [
	methodBlock := [].
	environment := RBBrowserEnvironment new.
	context := RBSmalllintContext newNoCache
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintChecker>>methodBlock: aBlock  [
	methodBlock := aBlock
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintChecker>>release [
	context release.
	super release
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintChecker>>rule: aLintRule  [
	rule := aLintRule
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintChecker>>run [
	environment classesAndTraits
		do: [ :class |
			self checkClass: class.
			self checkMethodsForClass: class.
			
			self checkClass: class classSide.
			self checkMethodsForClass: class classSide ]
		displayingProgress: [ :class | 'Running critics on: ', class name ].
	environment packages 
		do: [ :package | self checkPackage: package ]
		displayingProgress: [ :package | 'Running critics on: ', package name ].
]
