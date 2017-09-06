"
I represent a refactoring which it's not possible to reconstruct because the original information is lost.
"
Class {
	#name : #EpUnknownRefactoring,
	#superclass : #EpRefactoring,
	#instVars : [
		'printString'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 2/11/2014 20:14'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpUnknownRefactoring class>>for: aRBRefactoring [
	^ self basicNew
		initializeWith: aRBRefactoring;
		yourself
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpUnknownRefactoring>>asRBRefactoring [
	"The original refactoring cannot be recreated."
	
	^ self shouldNotImplement
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpUnknownRefactoring>>canBuildRBRefactoring [
	^ false
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpUnknownRefactoring>>initializeWith: aRBRefactoring [
	self initialize.
	printString := aRBRefactoring printString
]
