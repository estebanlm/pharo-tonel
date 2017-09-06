"
I'm a wrapper of renraku rules, so they can be used in other tools that follow the RB architecture
"
Class {
	#name : #RBRenrakuWrapperLintRule,
	#superclass : #RBBasicLintRule,
	#instVars : [
		'renrakuRule'
	],
	#category : #Refactoring-Critics,
	#timestamp : 'YuriyTymchuk 9/5/2016 14:30'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenrakuWrapperLintRule class>>new [

	^ Error signal: 'Please use #new: and provide a renraku rule instance'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenrakuWrapperLintRule class>>new: aRule [

	| annotatedClass |
	
	annotatedClass := self newAnonymousSubclass.
	annotatedClass class compile:
		'uniqueIdentifierName ^ ',
		aRule class uniqueIdentifierName surroundedBySingleQuotes.

	^ annotatedClass basicNew
		initialize: aRule;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenrakuWrapperLintRule class>>uniqueIdentifierName [
	^ 'WrapperRule'
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenrakuWrapperLintRule>>addSearchStringFrom: aCritique in: aSourceCode [

	aCritique sourceAnchor providesInterval ifTrue: [
		| interval |
		interval := aCritique sourceAnchor interval.
		result addSearchString: (
			aSourceCode
				copyFrom: interval first
				to: interval last)  ].
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenrakuWrapperLintRule>>byNodeCheckMethod: aMethod [

	aMethod ast nodesDo: [ :node |
		renrakuRule
			check: node
			forCritiquesDo: [ :crit |
				result addMethod: aMethod.
				self
					addSearchStringFrom: crit
					in: aMethod definition.
				^ self ] ]
	
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenrakuWrapperLintRule>>checkClass: aClass [
	renrakuRule class checksClass ifFalse: [ ^ self ].
	renrakuRule
		check: aClass
		forCritiquesDo: [ :crit |
			result addClass: aClass.
			self
				addSearchStringFrom: crit
				in: aClass definition.
			^ self ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenrakuWrapperLintRule>>checkMethod: aMethod [

	renrakuRule class checksNode ifTrue: [ 
		^ self byNodeCheckMethod: aMethod ].
	renrakuRule class checksMethod ifFalse: [ ^ self ].
	renrakuRule
		check: aMethod
		forCritiquesDo: [ :crit |
			result addMethod: aMethod.
			self
				addSearchStringFrom: crit
				in: aMethod definition.
			^ self ]
	
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenrakuWrapperLintRule>>checkPackage: aPackage [
	renrakuRule class checksPackage ifFalse: [ ^ self ].
	renrakuRule
		check: aPackage
		forCritiquesDo: [ :crit |
			^ result addPackage: aPackage ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenrakuWrapperLintRule>>group [

	^ renrakuRule group
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenrakuWrapperLintRule>>initialize: aRule [
	renrakuRule := aRule.
	self initialize.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenrakuWrapperLintRule>>longDescription [
	
	^ renrakuRule rationale
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenrakuWrapperLintRule>>name [

	^ renrakuRule name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenrakuWrapperLintRule>>rationale [

	^ renrakuRule rationale
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenrakuWrapperLintRule>>resultClass [

	renrakuRule class checksNode    ifTrue: [ ^ RBSelectorEnvironment ].
	renrakuRule class checksMethod  ifTrue: [ ^ RBSelectorEnvironment ].
	renrakuRule class checksClass   ifTrue: [ ^ RBClassEnvironment ].
	renrakuRule class checksPackage ifTrue: [ ^ RBPackageEnvironment ].
	^ RBMultiEnvironment
]
