"
I represent a refactoring that is composed of other refactorings.
"
Class {
	#name : #EpCompositeRefactoring,
	#superclass : #EpRefactoring,
	#instVars : [
		'childrenRefactorings'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 15:17'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCompositeRefactoring class>>withAll: someRefactorings [
	^ self basicNew 	
		initializeWith: someRefactorings;
		yourself
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCompositeRefactoring>>asRBRefactoring [
	^ RBCompositeRefactoryChange new
		changes: (childrenRefactorings collect: #asRBRefactoring);
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCompositeRefactoring>>childrenRefactorings [
	^ childrenRefactorings
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCompositeRefactoring>>initializeWith: someRefactorings  [
	self initialize.
	childrenRefactorings := someRefactorings collect: #asEpiceaEvent
]
