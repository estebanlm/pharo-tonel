"

"
Class {
	#name : #GTSpotterExceptionHandler,
	#superclass : #Object,
	#category : #GT-Spotter-Exceptions,
	#timestamp : ''
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterExceptionHandler>>handleException: anException [
	^ self handleException: anException do: [ 
		('[Spotter] Exception: ', anException asString) logCr ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterExceptionHandler>>handleException: anException do: aBlock [
	^ aBlock value
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterExceptionHandler>>handleException: anException with: anObject [
	^ self handleException: anException do: [ anObject ]
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterExceptionHandler>>handleExceptionsDuring: aBlock [
	[ GTCurrentSpotterExceptionHandler use: self during: aBlock ] 
		on: self 
		do: [ :exception | 
			[ self handleException: exception ] " handle any exception during aBlock "
				on: Error
				do: [ :fatalException | self handleFatalException: fatalException ] ] " handle exception caused while handling an exception "
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterExceptionHandler>>handleFatalException: anException [
	('[Spotter] Fatal Exception: ', anException asString) logCr
]
