"
I represent a change in the method dictionary of a class or a trait.
"
Class {
	#name : #EpMethodChange,
	#superclass : #EpCodeChange,
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:48'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodChange>>behaviorAffectedName [

	^ self methodAffected className
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodChange>>doesOverride: aCodeChange [

	^ aCodeChange isEpMethodChange and: [
		aCodeChange behaviorAffectedName = self behaviorAffectedName and: [ 
		aCodeChange methodAffectedSelector = self methodAffectedSelector ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodChange>>isEpMethodChange [

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodChange>>methodAffected [
	
	^ self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodChange>>methodAffectedProtocol [

	^ self methodAffected protocol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodChange>>methodAffectedSelector [

	^ self methodAffected selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodChange>>methodAffectedSourceCode [

	^ self methodAffected sourceCode
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMethodChange>>printOn: aStream [

	super printOn: aStream.

	aStream 
		nextPut: $(;
		nextPutAll: self behaviorAffectedName;
		nextPutAll: '>>';
		nextPutAll: self methodAffectedSelector;
		nextPut: $)
]
