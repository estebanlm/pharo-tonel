"
I represent a generic refactoring, which can be reconstructed via it's #storeString.
"
Class {
	#name : #EpGenericRefactoring,
	#superclass : #EpRefactoring,
	#instVars : [
		'storeString'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 15:18'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpGenericRefactoring class>>canAccept: aRBRefactoring  [

	^ (aRBRefactoring class whichClassIncludesSelector: #storeOn:) ~= Object
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpGenericRefactoring class>>for: aRBRefactoring [
	^ self basicNew
		initializeWith: aRBRefactoring;
		yourself
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpGenericRefactoring>>asRBRefactoring [
	^ self class compiler evaluate: storeString
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpGenericRefactoring>>initializeWith: aRBRefactoring [
	self initialize.
	storeString := aRBRefactoring storeString
]
