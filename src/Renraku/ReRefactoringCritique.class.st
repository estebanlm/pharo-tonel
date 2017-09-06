"
A critique which has a refactoring needed to solve the issue
"
Class {
	#name : #ReRefactoringCritique,
	#superclass : #ReAbstractCritique,
	#instVars : [
		'refactoring',
		'alreadyExecuted'
	],
	#category : #Renraku-Critiques,
	#timestamp : 'YuriyTymchuk 7/10/2016 15:43'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRefactoringCritique>>change [
	"return changes provided by the refactoring"
	
	alreadyExecuted ifFalse: [
		refactoring primitiveExecute.
		alreadyExecuted := true ].
	
	^ refactoring changes
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRefactoringCritique>>initialize [
	
	alreadyExecuted := false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRefactoringCritique>>providesChange [
	
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRefactoringCritique>>refactoring [
	^ refactoring
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRefactoringCritique>>refactoring: anObject [
	refactoring := anObject
]
