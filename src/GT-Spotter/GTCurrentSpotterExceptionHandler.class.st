"

"
Class {
	#name : #GTCurrentSpotterExceptionHandler,
	#superclass : #Notification,
	#category : #GT-Spotter-Exceptions,
	#timestamp : ''
}

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTCurrentSpotterExceptionHandler class>>defaultValue [
	^ nil
]

{
	#category : #evaluating,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTCurrentSpotterExceptionHandler class>>use: anObject during: aBlock [
	
	^ aBlock on: self do: [ :notification | notification resume: anObject ]
]

{
	#category : #evaluating,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTCurrentSpotterExceptionHandler class>>value [
	^ self signal
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTCurrentSpotterExceptionHandler>>defaultAction [
	^ self class defaultValue
]
