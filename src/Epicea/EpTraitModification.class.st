"
I represent the modification of a trait.
"
Class {
	#name : #EpTraitModification,
	#superclass : #EpTraitChange,
	#instVars : [
		'oldTrait',
		'newTrait'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:46'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitModification class>>oldTrait: anOldTrait newTrait: aNewTrait [

	^ self basicNew 
		initializeOldTrait: anOldTrait newTrait: aNewTrait;
		yourself
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitModification>>accept: aVisitor [

	^ aVisitor visitTraitModification: self 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitModification>>behaviorAffected [
	^ newTrait
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitModification>>behaviorAffectedName [

	^ newTrait name
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitModification>>initializeOldTrait: anOldTrait newTrait: aNewTrait [

	self initialize.
	oldTrait := anOldTrait asEpiceaRingDefinition.
	newTrait := aNewTrait asEpiceaRingDefinition.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitModification>>newTrait [

	^ newTrait
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitModification>>oldTrait [

	^ oldTrait
]
