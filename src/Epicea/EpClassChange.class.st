"
I represent a change in the definition of a class.
"
Class {
	#name : #EpClassChange,
	#superclass : #EpBehaviorChange,
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:44'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassChange>>doesOverride: aCodeChange [

	^ aCodeChange isEpClassChange and: [
		aCodeChange behaviorAffectedName = self behaviorAffectedName ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassChange>>isEpClassChange [

	^ true
]
