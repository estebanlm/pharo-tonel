"
I represent the removal of a class.
"
Class {
	#name : #EpClassRemoval,
	#superclass : #EpClassChange,
	#instVars : [
		'classRemoved'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:45'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassRemoval class>>class: aClassRemoved [

	^ self basicNew 
		initializeClassRemoved: aClassRemoved;
		yourself
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassRemoval>>accept: aVisitor [

	^ aVisitor visitClassRemoval: self 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassRemoval>>behaviorAffected [
	^ classRemoved
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassRemoval>>behaviorAffectedName [

	^ self behaviorAffected ifNotNil: #name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassRemoval>>classRemoved [

	^ classRemoved
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassRemoval>>doesOverride: aCodeChange [

	^ (super doesOverride: aCodeChange) or: [
		(aCodeChange isEpBehaviorChange or: [ aCodeChange isEpMethodChange ]) and: [
		aCodeChange behaviorAffectedName = self behaviorAffectedName ]]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassRemoval>>initializeClassRemoved: aRemovedClass [

	self initialize.
	classRemoved := aRemovedClass asEpiceaRingDefinition.

]
