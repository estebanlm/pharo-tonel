"

"
Class {
	#name : #MetacelloCannotUpdateReleasedVersionError,
	#superclass : #Error,
	#category : #Metacello-Core-Exceptions-Errors,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloCannotUpdateReleasedVersionError>>isResumable [
	"Determine whether an exception is resumable."

	^ true
]
