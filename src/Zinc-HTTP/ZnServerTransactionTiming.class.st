"
I am ZnServerTransactionTiming.

I hold timing information related to the handling of an HTTP transaction by a server.

"
Class {
	#name : #ZnServerTransactionTiming,
	#superclass : #Object,
	#instVars : [
		'requestDuration',
		'handlerDuration',
		'responseDuration'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/13/2014 16:00'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerTransactionTiming>>handlerDuration [
	^ handlerDuration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerTransactionTiming>>handlerDuration: anObject [
	handlerDuration := anObject
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerTransactionTiming>>initialize [
	super initialize.
	requestDuration := handlerDuration := responseDuration := 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerTransactionTiming>>requestDuration [
	^ requestDuration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerTransactionTiming>>requestDuration: anObject [
	requestDuration := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerTransactionTiming>>responseDuration [
	^ responseDuration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerTransactionTiming>>responseDuration: anObject [
	responseDuration := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerTransactionTiming>>totalDuration [
	"requestDuration is unreliable because it contains idle wait time"
	
	^ handlerDuration + responseDuration 
]
