"
I represent a change in the protocols of a class.
"
Class {
	#name : #EpProtocolChange,
	#superclass : #EpBehaviorChange,
	#instVars : [
		'behavior',
		'protocol'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:45'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpProtocolChange class>>behavior: aBehavior protocol: aProtocol  [
	^ self basicNew 
		initializeWithBehavior: aBehavior
		protocol: aProtocol;
		yourself 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpProtocolChange>>behaviorAffected [
	^ behavior
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpProtocolChange>>behaviorAffectedName [

	^ behavior name
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpProtocolChange>>doesOverride: aCodeChange  [

	^ aCodeChange isEpProtocolChange and: [
		aCodeChange behaviorAffectedName = self behaviorAffectedName and: [ 
		aCodeChange protocol = self protocol ] ]
]

{
	#category : #initialization-release,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpProtocolChange>>initializeWithBehavior: aBehavior protocol: aProtocol [
	self initialize.
	behavior := aBehavior asEpiceaRingDefinition.
	protocol := aProtocol asSymbol.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpProtocolChange>>isEpProtocolChange [

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpProtocolChange>>protocol [
	^ protocol
]
