"
I represent the creation of a trait.
"
Class {
	#name : #EpTraitAddition,
	#superclass : #EpTraitChange,
	#instVars : [
		'trait'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:46'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitAddition class>>trait: aTrait [

	^ self basicNew
		initializeWithTrait: aTrait;
		yourself 
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitAddition>>accept: aVisitor [

	^ aVisitor visitTraitAddition: self 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitAddition>>behaviorAffected [
	^ self traitAdded
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitAddition>>behaviorAffectedName [

	^ self traitAdded name
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitAddition>>initializeWithTrait: aTrait [

	self initialize.
	trait := aTrait asEpiceaRingDefinition.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitAddition>>traitAdded [

	^ trait 
]
