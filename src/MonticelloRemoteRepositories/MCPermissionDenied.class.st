"
I am signalled when a repositroy cannot save or access a version.
"
Class {
	#name : #MCPermissionDenied,
	#superclass : #Error,
	#instVars : [
		'repository'
	],
	#category : #MonticelloRemoteRepositories,
	#timestamp : '<historical>'
}

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCPermissionDenied class>>signalFor: aRepository [
	^ self new
		repository: aRepository;
		signal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCPermissionDenied>>repository [
	^ repository
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCPermissionDenied>>repository: anObject [
	repository := anObject
]
