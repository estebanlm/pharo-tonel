"
I am a MOCK equivalent for GlobalIdentifierPersistenceChecker, userful for testing behavior.
"
Class {
	#name : #GlobalIdentifierPersistenceMockChecker,
	#superclass : #Object,
	#instVars : [
		'answer'
	],
	#category : #System-Identification-Tests,
	#timestamp : 'JurajKubelka 4/17/2017 09:40'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceMockChecker>>answer [
	^ answer ifNil: [ answer := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceMockChecker>>answer: anObject [
	answer := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceMockChecker>>isEnabled [
	^ self answer value
]
