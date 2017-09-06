"
I represent a refactoring that consists in the propagation (i.e. the ""redo"") of another refactoring.
"
Class {
	#name : #EpPropagateRefactoring,
	#superclass : #EpRefactoring,
	#instVars : [
		'targetRefactoring'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 15:19'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpPropagateRefactoring class>>target: aTargetRefactoring [
	^ self basicNew
		initializeWith: aTargetRefactoring;
		yourself
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpPropagateRefactoring>>asRBRefactoring [
	^ EpRBPropagateRefactoring target: targetRefactoring asRBRefactoring
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpPropagateRefactoring>>initializeWith: aTargetRefactoring [
	self initialize.
	
	targetRefactoring := aTargetRefactoring.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpPropagateRefactoring>>targetRefactoring [
	^ targetRefactoring
]
