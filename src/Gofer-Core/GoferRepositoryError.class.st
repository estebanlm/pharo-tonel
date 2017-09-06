"
A GoferRepositoryError is the error thrown when a repository cannot be accessed.
"
Class {
	#name : #GoferRepositoryError,
	#superclass : #Error,
	#instVars : [
		'repository'
	],
	#category : #Gofer-Core,
	#timestamp : 'lr 1/30/2010 14:39'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferRepositoryError class>>signal: aString repository: aRepository [
	^ self new repository: aRepository; signal: aString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferRepositoryError>>isResumable [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferRepositoryError>>repository [
	^ repository
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferRepositoryError>>repository: aRepository [
	repository := aRepository
]
