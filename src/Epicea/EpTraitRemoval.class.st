"
I represent the removal of a trait.
"
Class {
	#name : #EpTraitRemoval,
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
EpTraitRemoval class>>trait: aTrait [

	^ self basicNew 
		initializeWithTrait: aTrait;
		yourself
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitRemoval>>accept: aVisitor [

	^ aVisitor visitTraitRemoval: self 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitRemoval>>behaviorAffected [

	^ self traitRemoved
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitRemoval>>behaviorAffectedName [

	^ self traitRemoved name
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitRemoval>>initializeWithTrait: aTrait [

	self initialize.
	trait := aTrait asEpiceaRingDefinition.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitRemoval>>traitRemoved [

	^ trait
]
