"
I represent a change in the definition of a trait.
"
Class {
	#name : #EpTraitChange,
	#superclass : #EpBehaviorChange,
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:46'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitChange>>doesOverride: aCodeChange [

	^ aCodeChange isEpTraitChange and: [
		aCodeChange behaviorAffectedName = self behaviorAffectedName ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTraitChange>>isEpTraitChange [

	^ true
]
