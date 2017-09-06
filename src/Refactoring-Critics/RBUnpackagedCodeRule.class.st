"
Code that is not contained in a Monticello package is not versioned and cannot be brought into a different image.
"
Class {
	#name : #RBUnpackagedCodeRule,
	#superclass : #RBBlockLintRule,
	#instVars : [
		'packages',
		'package'
	],
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:16'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnpackagedCodeRule class>>checksClass [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnpackagedCodeRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnpackagedCodeRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'UnpackagedCodeRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnpackagedCodeRule>>basicCheck: anEntity [

	^ anEntity package ifNil: [ true ] ifNotNil: #isDefault
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnpackagedCodeRule>>checkClass: aClass  [
	(self basicCheck: aClass) ifTrue: [
		self result addClass: aClass ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnpackagedCodeRule>>checkMethod: aMethod [
	aMethod isDoIt ifTrue: [ ^self ].
	(self basicCheck: aMethod) ifTrue: [
		self result addMethod: aMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnpackagedCodeRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnpackagedCodeRule>>initialize [
	super initialize.
	packages := MCWorkingCopy allManagers
		inject: #()
		into: [ :all :each | all, (each packageSet packages) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnpackagedCodeRule>>name [
	^ 'Unpackaged code'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnpackagedCodeRule>>packageSatisfying: aBlock [
	"Answer the first package satisfying aBlock or nil. This method assumes that it is likely that the last matching package matches the given condition again and thus it tries that one first."

	(package notNil and: [ aBlock value: package ])
		ifTrue: [ ^ package ].
	packages do: [ :info |
		(aBlock value: info)
			ifTrue: [ ^ package := info ] ].
	^ nil
]
