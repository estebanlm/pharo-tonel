"

"
Class {
	#name : #MetacelloClearStackCacheNotification,
	#superclass : #Notification,
	#instVars : [
		'cacheNames'
	],
	#category : #Metacello-Core-Exceptions-Notifications,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloClearStackCacheNotification>>cacheNames [
	^ cacheNames
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloClearStackCacheNotification>>cacheNames: anArray [
	cacheNames := anArray
]

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloClearStackCacheNotification>>signal: anArray [
	"Signal the occurrence of an exceptional condition with a specified cacheName."

	self cacheNames: anArray.
	^ self signal
]
