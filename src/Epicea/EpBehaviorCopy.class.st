"
I represent a copy of a class or a trait .
"
Class {
	#name : #EpBehaviorCopy,
	#superclass : #EpEvent,
	#instVars : [
		'definition',
		'newName'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:37'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCopy class>>fromBehavior: aClass newName: aName  [

	^ self basicNew
		initializeWithBehavior: aClass 
		newName: aName;
		yourself
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCopy>>accept: aVisitor  [
	^ aVisitor visitBehaviorCopy: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCopy>>definition [
	
	^ definition
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCopy>>initializeWithBehavior: aClass newName: aName [
	self initialize.
	
	definition := aClass asEpiceaRingDefinition.
	newName := aName asSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorCopy>>newName [
	
	^ newName
]
