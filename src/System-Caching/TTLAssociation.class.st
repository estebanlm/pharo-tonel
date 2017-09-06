"
I am TTLAssociation. 
I am an Assiciation.

I maintain a timestamp that gets updated each time my value changes.

I decide myself when I am stale, using a cache defined default time to live.
"
Class {
	#name : #TTLAssociation,
	#superclass : #Association,
	#instVars : [
		'timestamp'
	],
	#category : #System-Caching,
	#timestamp : 'SvenVanCaekenberghe 2/9/2015 15:23'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:16'
}
TTLAssociation>>isStale: timeToLive [
	^ self now - timestamp >= timeToLive
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
TTLAssociation>>key: aKey value: anObject  [
	super key: aKey value: anObject.
	timestamp := self now
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
TTLAssociation>>now [
	^ Time totalSeconds
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
TTLAssociation>>timestamp [
	^ timestamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
TTLAssociation>>value: anObject [
	super value: anObject.
	timestamp := self now
]
