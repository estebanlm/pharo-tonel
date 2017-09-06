"
I represent a change in a class or a trait.
"
Class {
	#name : #EpBehaviorChange,
	#superclass : #EpCodeChange,
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:41'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorChange>>= other [

	^ self class = other class and: [ self behaviorAffected = other behaviorAffected ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorChange>>affectedPackageName [
	
	^  self behaviorAffected package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorChange>>behaviorAffected [
	^ self shouldBeImplemented 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorChange>>behaviorAffectedName [
	^ self shouldBeImplemented 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorChange>>doesOverride: aCodeChange  [
	
	^ aCodeChange class = self class and: [ 
		aCodeChange behaviorAffectedName = self behaviorAffectedName ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorChange>>hash [

	^ self class hash bitXor: self behaviorAffected hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorChange>>isEpBehaviorChange [
	^true
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpBehaviorChange>>printOn: aStream [

	super printOn: aStream.

	aStream 
		nextPut: $(;
		nextPutAll: self behaviorAffectedName;
		nextPut: $)
]
