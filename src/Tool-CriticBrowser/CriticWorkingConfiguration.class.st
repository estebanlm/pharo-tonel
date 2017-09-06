"
A CriticWorkspace holds the current worspace for the CriticBrowser.

It's composed of the set of rules to check (as a composite rule) and the environment to work in.
"
Class {
	#name : #CriticWorkingConfiguration,
	#superclass : #Object,
	#instVars : [
		'rule',
		'environment',
		'removeTestCase',
		'logInManifest'
	],
	#classVars : [
		'Current'
	],
	#category : #Tool-CriticBrowser,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticWorkingConfiguration class>>current [

	^ Current ifNil: [ Current  := self basicNew initialize ].
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticWorkingConfiguration class>>exists [

	^ Current notNil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticWorkingConfiguration class>>new [

	^ self shouldNotImplement
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticWorkingConfiguration class>>reset [

	Current := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticWorkingConfiguration>>environment [
	^ environment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticWorkingConfiguration>>environment: anObject [
	environment := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticWorkingConfiguration>>logInManifest [
	^ logInManifest
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticWorkingConfiguration>>logInManifest: anObject [
	logInManifest := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticWorkingConfiguration>>removeTestCase [
	^ removeTestCase
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticWorkingConfiguration>>removeTestCase: aBoolean [
	removeTestCase := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticWorkingConfiguration>>rule [
	^ rule
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticWorkingConfiguration>>rule: anObject [
	rule := anObject
]
